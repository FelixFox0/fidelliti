<?php

static $registry = null;

// Error Handler
function error_handler_for_export_import($errno, $errstr, $errfile, $errline) {
	global $registry;
	
	switch ($errno) {
		case E_NOTICE:
		case E_USER_NOTICE:
			$errors = "Notice";
			break;
		case E_WARNING:
		case E_USER_WARNING:
			$errors = "Warning";
			break;
		case E_ERROR:
		case E_USER_ERROR:
			$errors = "Fatal Error";
			break;
		default:
			$errors = "Unknown";
			break;
	}
	
	$config = $registry->get('config');
	$url = $registry->get('url');
	$request = $registry->get('request');
	$session = $registry->get('session');
	$log = $registry->get('log');
	
	if ($config->get('config_error_log')) {
		$log->write('PHP ' . $errors . ':  ' . $errstr . ' in ' . $errfile . ' on line ' . $errline);
	}

	if (($errors=='Warning') || ($errors=='Unknown')) {
		return true;
	}

	if (($errors != "Fatal Error") && isset($request->get['route']) && ($request->get['route']!='tool/export_import/download'))  {
		if ($config->get('config_error_display')) {
			echo '<b>' . $errors . '</b>: ' . $errstr . ' in <b>' . $errfile . '</b> on line <b>' . $errline . '</b>';
		}
	} else {
		$session->data['export_import_error'] = array( 'errstr'=>$errstr, 'errno'=>$errno, 'errfile'=>$errfile, 'errline'=>$errline );
		$token = $request->get['token'];
		$link = $url->link( 'tool/export_import', 'token='.$token, 'SSL' );
		header('Status: ' . 302);
		header('Location: ' . str_replace(array('&amp;', "\n", "\r"), array('&', '', ''), $link));
		exit();
	}

	return true;
}


function fatal_error_shutdown_handler_for_export_import()
{
	$last_error = error_get_last();
	if ($last_error['type'] === E_ERROR) {
		// fatal error
		error_handler_for_export_import(E_ERROR, $last_error['message'], $last_error['file'], $last_error['line']);
	}
}


class ModelToolImportProducts extends Model {

	private $error = array();
	
    protected $null_array = array();
    
    private $colunms = [
        'product_name' => 2,
        'product_description' => 3,
        'product_price' => 4,
        'main_cat' => 5,
        'sub_cat' => 6,
        'image' => 7,
        'razgrafka' => 8,
        'manufacturer' => 9,
        'product_attribute' => 10
    ];
    private $product = [];
    
    private $availableStoreIds = [0];
    
	public function upload( $filename, $incremental=false ) {
       
		// we use our own error handler
		global $registry;
		$registry = $this->registry;
		set_error_handler('error_handler_for_export_import',E_ALL);
		register_shutdown_function('fatal_error_shutdown_handler_for_export_import');

		try {
			$this->session->data['export_import_nochange'] = 1;

			// we use the PHPExcel package from http://phpexcel.codeplex.com/
			$cwd = getcwd();
			chdir( DIR_SYSTEM.'PHPExcel' );
			require_once( 'Classes/PHPExcel.php' );
			chdir( $cwd );
			
			// Memory Optimization
			if ($this->config->get( 'export_import_settings_use_import_cache' )) {
				$cacheMethod = PHPExcel_CachedObjectStorageFactory::cache_to_phpTemp;
				$cacheSettings = array( ' memoryCacheSize '  => '16MB'  );
				PHPExcel_Settings::setCacheStorageMethod($cacheMethod, $cacheSettings);
			}

			// parse uploaded spreadsheet file
			$inputFileType = PHPExcel_IOFactory::identify($filename);
			$objReader = PHPExcel_IOFactory::createReader($inputFileType);
			$objReader->setReadDataOnly(true);
			$reader = $objReader->load($filename);
            
			$this->clearCache();
			$this->session->data['export_import_nochange'] = 0;
			$available_product_ids = array();
			$available_category_ids = array();
			$available_customer_ids = array();
			$this->uploadProducts( $reader, $incremental, $available_product_ids );
			return true;
		} catch (Exception $e) {
			$errstr = $e->getMessage();
			$errline = $e->getLine();
			$errfile = $e->getFile();
			$errno = $e->getCode();
			$this->session->data['export_import_error'] = array( 'errstr'=>$errstr, 'errno'=>$errno, 'errfile'=>$errfile, 'errline'=>$errline );
			if ($this->config->get('config_error_log')) {
				$this->log->write('PHP ' . get_class($e) . ':  ' . $errstr . ' in ' . $errfile . ' on line ' . $errline);
			}
			return false;
		}
	}    
    
    

	protected function uploadProducts( &$reader, $incremental, &$available_product_ids=array() ) {
		// get worksheet, if not there return immediately
		//$data = $reader->getSheetByName( 'Products' );
        
        $this->load->model('catalog/product');
        
        $data = $reader->getSheet(0);

		if ($data==null) {
			return;
		}


		// get pre-defined layouts
		//$layout_ids = $this->getLayoutIds();

		// get pre-defined store_ids
		//$available_store_ids = $this->getAvailableStoreIds();

		// find the installed languages
		$languages = $this->getLanguages();


		// load the worksheet cells and store them to the database
		$first_row = array();
		$i = 0;
		$k = $data->getHighestRow();

		for ($i=0; $i<$k; $i+=1) {
            $this->product = [];
			if ($i==0) {
				$max_col = PHPExcel_Cell::columnIndexFromString( $data->getHighestColumn() );

				for ($j=1; $j<=$max_col; $j+=1) {
					$first_row[] = $this->getCell($data,$i,$j);
				}
				continue;
			}

			//$j = 1;
			$product_name = trim($this->getCell($data, $i, $this->colunms['product_name']));
            //var_dump($product_name);
            //die($product_name);
			if ($product_name == "") {
				continue;
			}
            /*Проверяем товар на наличие в базе*/
            $productQuery = $this->getProductByName($product_name);
            if($productQuery->num_rows > 0){
                continue;
            }     
            
            /*Получаем id категорий*/
            $main_cat = trim($this->getCell($data, $i, $this->colunms['main_cat'])); 
            $sub_cat = trim($this->getCell($data, $i, $this->colunms['sub_cat'])); 
            $this->storeCategoryIntoDatabase($languages, $main_cat, $sub_cat);

            /*Получаем производителя*/
            $manufacturer = trim($this->getCell($data, $i, $this->colunms['manufacturer']));            
            $this->storeManufacturerIntoDatabase($manufacturer);
            
            $razgrafka = trim($this->getCell($data, $i, $this->colunms['razgrafka']));            
            $this->storeRazgrafkaIntoDatabase($languages, $razgrafka);            
            
            /*Получаем атрибуты*/
            $aa = $this->colunms['product_attribute'];
            while ($aa <= $max_col) {
                
                $attribute_name = trim($this->getCell($data, $i, $aa++));
                $attribute_measurement = trim($this->getCell($data, $i, $aa++));
                $attribute_value = trim($this->getCell($data, $i, $aa++));
                $this->storeAttributeIntoDatabase($languages, 'Характеристики товара', $attribute_name, $attribute_value, $attribute_measurement);
                
            }    
            $this->product['price'] = trim($this->getCell($data, $i, $this->colunms['product_price']));
            preg_match('/^[^0-9]*([0-9]*[.,]*[0-9]*)/', $this->product['price'], $m);
            $this->product['price'] = preg_replace('/[,]/', '.', $m[1]);
            //var_dump($m);die;
            
            $product_description = trim($this->getCell($data, $i, $this->colunms['product_description']));
            foreach($languages as $language){
                $this->product['product_description'][$language['language_id']]['name'] = $product_name;
                $this->product['product_description'][$language['language_id']]['description'] = $product_description;
                $this->product['product_description'][$language['language_id']]['meta_title'] = $product_name;
                $this->product['product_description'][$language['language_id']]['meta_description'] = $product_name;
                $this->product['product_description'][$language['language_id']]['meta_keyword'] = $product_name;
                $this->product['product_description'][$language['language_id']]['tag'] = '';
                
            }            
            $this->product['keyword'] = $this->makeSlug($product_name); 
            
            $this->product['model'] = $product_name;
            $this->product['sku'] = '';
            $this->product['upc'] = '';
            $this->product['ean'] = '';
            $this->product['jan'] = '';
            $this->product['isbn'] = '';
            $this->product['mpn'] = '';
            $this->product['location'] = '';
            $this->product['quantity'] = 9999;
            $this->product['minimum'] = 1;
            $this->product['subtract'] = 0;
            $this->product['stock_status_id'] = 6;
            $this->product['date_available'] = date('Y-m-d');
            $this->product['manufacturer_id'] = 0;
            $this->product['shipping'] = 1;
            
            $this->product['points'] = '';
            $this->product['weight'] = '';
            $this->product['weight_class_id'] = 0;
            $this->product['length'] = '';
            $this->product['width'] = '';
            $this->product['height'] = '';
            $this->product['length_class_id'] = 0;
            $this->product['status'] = 1;
            $this->product['tax_class_id'] = 0;
            $this->product['sort_order'] = 0;
            foreach($this->availableStoreIds as $storeId){
                $this->product['product_store'][] = $storeId;
            }            
            $this->product['product_layout'][] = 0;
            

            $images = trim($this->getCell($data, $i, $this->colunms['image'])); 
            
            

            
            
            $images = explode(',', $images);
            

            $this->product['image'] = '';
            $this->product['product_image'] = [];
            $allowed = array(
                'jpg',
                'jpeg',
                'gif',
                'png'
            );  
            if(!file_exists(DIR_IMAGE.'catalog/products')){
                mkdir(DIR_IMAGE.'catalog/products');
            }
            foreach($images as $key => $image){
                

                $image =  mb_substr($image, 18);
                $image = 'catalog'.str_replace('\\', '/', $image);
                
                
                $image = trim($image);
                if(empty($image)){
                    continue;
                }
                //$directory = DIR_IMAGE . 'catalog/products/';
                $path_parts = pathinfo($image);

				if (!in_array($path_parts['extension'], $allowed)) {
					continue;
				}
                if(preg_match('/^(http:\/\/.+)|(https:\/\/.+)/', $image)){
                    $filename = 'catalog/products/'.md5($image).'.'.$path_parts['extension'];
                    //copy($image, DIR_IMAGE.$filename);
                    $content = file_get_contents($image);
                    if($content){
                        file_put_contents(DIR_IMAGE.$filename, $content);
                    }else{
                        continue;
                    }
                }else{
                    $filename = $image;
                }
                if(empty($this->product['image'])){
                    $this->product['image'] = $filename;
                }else{
                    $this->product['product_image'][$key]['image'] = $filename;
                    $this->product['product_image'][$key]['sort_order'] = $key;
                    
                }
            }

            //echo '<pre>';var_dump($this->product);die;
            $this->model_catalog_product->addProduct($this->product);	
            //die;
        }
	}

    
    protected function storeCategoryIntoDatabase(&$languages, $main_cat, $sub_cat = '') {
        $this->product['product_category'] = [];
        
        $this->load->model('catalog/category');

        $this->product['product_category'][0] = 0;

        if($main_cat == ''){
            return;
        }
        
        $mainCat = $this->getCategoryByName($main_cat, 0);
        if($mainCat->num_rows == 0){
            $data = [];
            $data['parent_id'] = 0;
            $data['column'] = 1;
            $data['sort_order'] = 0;
            $data['status'] = 1;
            foreach($languages as $language){
                $data['category_description'][$language['language_id']]['name'] = $main_cat;
                $data['category_description'][$language['language_id']]['description'] = '';
                $data['category_description'][$language['language_id']]['meta_title'] = $main_cat;
                $data['category_description'][$language['language_id']]['meta_description'] = $main_cat;
                $data['category_description'][$language['language_id']]['meta_keyword'] = $main_cat;
            }
            foreach($this->availableStoreIds as $storeId){
                $data['category_store'][] = $storeId;
            }
            $data['category_layout'][] = 0;
            $data['keyword'] = $this->makeSlug($main_cat);
            $this->product['product_category'][1] = $this->model_catalog_category->addCategory($data);
        }else{
            $this->product['product_category'][1] = $mainCat->row['category_id'];
        }         
        
        if($sub_cat != ''){
            $subCat = $this->getCategoryByName($sub_cat, $this->product['product_category'][1]);
            if($subCat->num_rows == 0){
                $data = [];
                $data['parent_id'] = $this->product['product_category'][1];
                $data['column'] = 1;
                $data['sort_order'] = 0;
                $data['status'] = 1;
                foreach($languages as $language){
                    $data['category_description'][$language['language_id']]['name'] = $sub_cat;
                    $data['category_description'][$language['language_id']]['description'] = '';
                    $data['category_description'][$language['language_id']]['meta_title'] = $sub_cat;
                    $data['category_description'][$language['language_id']]['meta_description'] = $sub_cat;
                    $data['category_description'][$language['language_id']]['meta_keyword'] = $sub_cat;
                }
                foreach($this->availableStoreIds as $storeId){
                    $data['category_store'][] = $storeId;
                }
                $data['category_layout'][] = 0;
                $data['keyword'] = $this->makeSlug($sub_cat);
                $this->product['product_category'][2] = $this->model_catalog_category->addCategory($data);                
            }else{
                $this->product['product_category'][2] = $subCat->row['category_id'];
            }
        }  
	}    
       
  
    protected function storeManufacturerIntoDatabase($name) {
        $this->load->model('catalog/manufacturer');
        
        if($name == ''){
            return;
        } 

        $manufacturer = $this->getManufacturerByName($name);
        if($manufacturer->num_rows == 0){
            $data = [];
            $data['name'] = $name;
            $data['sort_order'] = 0;
            foreach($this->availableStoreIds as $storeId){
                $data['manufacturer_store'][] = $storeId;
            }
            $data['category_layout'][] = 0;
            $data['keyword'] = $this->makeSlug($name);
            $this->product['manufacturer_id'] = $this->model_catalog_manufacturer->addManufacturer($data);
        }else{
            $this->product['manufacturer_id'] = $manufacturer->row['manufacturer_id'];
        }          
	} 
    
    protected function storeRazgrafkaIntoDatabase($languages, $name) {
        $this->load->model('catalog/option');
        
        if($name == ''){
            return;
        } 
        $sql = "SELECT * FROM `".DB_PREFIX."option_description` od 
            INNER JOIN `".DB_PREFIX."option` AS o ON od.option_id = o.option_id 
            WHERE od.`name` = 'Разграфка' 
            LIMIT 1";
        $res =  $this->db->query( $sql );
        if($res->num_rows == 0){
            $this->db->query("INSERT INTO `" . DB_PREFIX . "option` SET type = 'select', sort_order = '0'");

            $option_id = $this->db->getLastId();
            
            foreach($languages as $language){
                $this->db->query("INSERT INTO " . DB_PREFIX . "option_description SET option_id = '" . (int)$option_id . "', language_id = '" . (int)$language['language_id'] . "', name = 'Разграфка'");            
            }
        }else{
            $option_id = $res->row['option_id'];
        }
        $name = explode(',', $name);
        $this->product['product_option'][0] = [
            'type' => 'select',
            'option_id' => $option_id, 
            'required' => 1,
        ];
        foreach($name as $nameKey => $nameVal){
            $nameVal = trim($nameVal);
            if(empty($nameVal)){
                continue;
            }
            $sql = "SELECT * FROM `".DB_PREFIX."option_value_description` od 
                INNER JOIN `".DB_PREFIX."option_value` AS o ON od.option_value_id = o.option_value_id 
                WHERE od.`name` = '".$nameVal."' 
                LIMIT 1";
            $res =  $this->db->query( $sql );            
            if($res->num_rows == 0){
                $this->db->query("INSERT INTO " . DB_PREFIX . "option_value SET option_id = '" . (int)$option_id . "', image = '', sort_order = '0'");

                $option_value_id = $this->db->getLastId();        
                
                foreach($languages as $language){
					$this->db->query("INSERT INTO " . DB_PREFIX . "option_value_description SET option_value_id = '" . (int)$option_value_id . "', language_id = '" . (int)$language['language_id'] . "', option_id = '" . (int)$option_id . "', name = '" . $nameVal . "'");
                }                
            }else{
                $option_value_id = $res->row['option_value_id'];
            }
            $this->product['product_option'][0]['product_option_value'][] = [
                'option_value_id' => $option_value_id, 
                'quantity' => 1, 
                'subtract' => 0, 
                'price' => 0, 
                'price_prefix' => '+', 
                'points' => 0, 
                'points_prefix' => '+', 
                'weight' => 0, 
                'weight_prefix' => '+',
            ];
        }  
        
        
	}    
    
    protected function storeAttributeIntoDatabase($languages, $attribute_group, $attribute_name, $attribute_value, $attribute_measurement = '') {
        $this->load->model('catalog/attribute_group');
        $this->load->model('catalog/attribute');
        
        if($attribute_group == '' || $attribute_name == ''){
            return;
        } 

        $attributeGroup = $this->getAttributeGroupByName($attribute_group);
        if($attributeGroup->num_rows == 0){
            $data = [];
            $data['sort_order'] = 0;
            foreach($languages as $language){
                $data['attribute_group_description'][$language['language_id']]['name'] = $attribute_group;             
            }
            $attribute_group_id = $this->model_catalog_attribute_group->addAttributeGroup($data);
        }else{
            $attribute_group_id = $attributeGroup->row['attribute_group_id'];
        }  
        
        $attribute = $this->getAttributeByName($attribute_name, $attribute_group_id);
        if($attribute->num_rows == 0){
            $data = [];
            $data['sort_order'] = 0;
            $data['attribute_group_id'] = $attribute_group_id;
            foreach($languages as $language){
                $data['attribute_description'][$language['language_id']]['name'] = $attribute_name;             
            }
            $attribute_id = $this->model_catalog_attribute->addAttribute($data);
        }else{
            $attribute_id = $attribute->row['attribute_id'];
        }       
        
        $this->product['product_attribute'][$attribute_id] = [];
        
        $this->product['product_attribute'][$attribute_id]['attribute_id'] = $attribute_id;

        foreach($languages as $language){;
            $this->product['product_attribute'][$attribute_id]['product_attribute_description'][$language['language_id']]['text'] = $attribute_value.' '.$attribute_measurement;
        }
        
	}    
    
    
    private function getCategoryByName($name, $parent_id = null){
        $sql = "SELECT c.* FROM `".DB_PREFIX."category_description` AS cd";
        if($parent_id !== null){
            $sql .= " INNER JOIN `".DB_PREFIX."category` AS c ON cd.category_id = c.category_id";
        }
        $sql .= " WHERE cd.`name` = '".$this->db->escape($name)."'";
        if($parent_id !== null){
            $sql .= " AND c.parent_id = ".(int)$parent_id."";
        }
        $sql .= " LIMIT 1;";
        return $this->db->query($sql);
    }

    private function getProductByName($name){
        $sql = "SELECT * FROM `".DB_PREFIX."product_description` pd INNER JOIN `".DB_PREFIX."product` AS p ON pd.product_id = p.product_id WHERE pd.`name` = '".$this->db->escape($name)."' LIMIT 1";
        return $query = $this->db->query( $sql );  
    }

    private function getManufacturerByName($name){
        $sql = "SELECT * FROM `".DB_PREFIX."manufacturer` m WHERE m.`name` = '".$this->db->escape($name)."' LIMIT 1";
        return $query = $this->db->query( $sql );  
    }       

    private function getAttributeGroupByName($name){
        $sql = "SELECT * FROM `".DB_PREFIX."attribute_group_description` AS agd INNER JOIN `".DB_PREFIX."attribute_group` AS ag ON agd.attribute_group_id = ag.attribute_group_id WHERE agd.`name` = '".$this->db->escape($name)."' LIMIT 1";
        return $query = $this->db->query( $sql );  
    }    
    
    private function getAttributeByName($name, $attribute_group_id){
        $sql = "SELECT * FROM `".DB_PREFIX."attribute_description` AS ad 
            INNER JOIN `".DB_PREFIX."attribute` AS a ON ad.attribute_id = a.attribute_id 
            WHERE ad.`name` = '".$this->db->escape($name)."' 
            AND a.attribute_group_id = ".(int)$attribute_group_id."    
            LIMIT 1";
        return $query = $this->db->query( $sql );  
    }    
    
	function getCell(&$worksheet,$row,$col,$default_val='') {
		$col -= 1; // we use 1-based, PHPExcel uses 0-based column index
		$row += 1; // we use 0-based, PHPExcel uses 1-based row index
		$val = ($worksheet->cellExistsByColumnAndRow($col,$row)) ? $worksheet->getCellByColumnAndRow($col,$row)->getValue() : $default_val;
		if ($val===null) {
			$val = $default_val;
		}
		return $val;
	}

	protected function isInteger($input){
		return(ctype_digit(strval($input)));
	}

	protected function clearCache() {
		$this->cache->delete('*');
	}

    public function makeSlug($title, $separator = '-')
    {
        $matrix = [
            'й' => 'i',    'ц' => 'c',  'у' => 'u',  'к' => 'k',    'е' => 'e',
            'н' => 'n',    'г' => 'g',  'ш' => 'sh', 'щ' => 'shch', 'з' => 'z',
            'х' => 'h',    'ъ' => '',   'ф' => 'f',  'ы' => 'y',    'в' => 'v',
            'а' => 'a',    'п' => 'p',  'р' => 'r',  'о' => 'o',    'л' => 'l',
            'д' => 'd',    'ж' => 'zh', 'э' => 'e',  'ё' => 'e',    'я' => 'ya',
            'ч' => 'ch',   'с' => 's',  'м' => 'm',  'и' => 'i',    'т' => 't',
            'ь' => '',     'б' => 'b',  'ю' => 'yu', 'ү' => 'u',    'қ' => 'k',
            'ғ' => 'g',    'ә' => 'e',  'ң' => 'n',  'ұ' => 'u',    'ө' => 'o',
            'Һ' => 'h',    'һ' => 'h',  'і' => 'i',  'ї' => 'ji',   'є' => 'je',
            'ґ' => 'g',    'Й' => 'I',  'Ц' => 'C',  'У' => 'U',    'Ұ' => 'U',
            'Ө' => 'O',    'К' => 'K',  'Е' => 'E',  'Н' => 'N',    'Г' => 'G',
            'Ш' => 'SH',   'Ә' => 'E',  'Ң '=> 'N',  'З' => 'Z',    'Х' => 'H',
            'Ъ' => '',     'Ф' => 'F',  'Ы' => 'Y',  'В' => 'V',    'А' => 'A',
            'П' => 'P',    'Р' => 'R',  'О' => 'O',  'Л' => 'L',    'Д' => 'D',
            'Ж' => 'ZH',   'Э' => 'E',  'Ё' => 'E',  'Я' => 'YA',   'Ч' => 'CH',
            'С' => 'S',    'М' => 'M',  'И' => 'I',  'Т' => 'T',    'Ь' => '',
            'Б' => 'B',    'Ю' => 'YU', 'Ү' => 'U',  'Қ' => 'K',    'Ғ' => 'G',
            'Щ' => 'SHCH', 'І' => 'I',  'Ї' => 'YI', 'Є' => 'YE',   'Ґ' => 'G',
        ];
        foreach ($matrix as $from => $to)  {
            $title = mb_eregi_replace($from, $to, $title);
        }
        $pattern = '![^'.preg_quote($separator).'\pL\pN\s]+!u';
        $title = preg_replace($pattern, '', mb_strtolower($title));
        $flip = $separator == '-' ? '_' : '-';
        $title = preg_replace('!['.preg_quote($flip).']+!u', $separator, $title);
        $title = preg_replace('!['.preg_quote($separator).'\s]+!u', $separator, $title);
        return trim($title, $separator);
    }    

	protected function getDefaultLanguageId() {
		$code = $this->config->get('config_language');
		$sql = "SELECT language_id FROM `".DB_PREFIX."language` WHERE code = '$code'";
		$result = $this->db->query( $sql );
		$language_id = 1;
		if ($result->rows) {
			foreach ($result->rows as $row) {
				$language_id = $row['language_id'];
				break;
			}
		}
		return $language_id;
	}


	protected function getLanguages() {
		$query = $this->db->query( "SELECT * FROM `".DB_PREFIX."language` WHERE `status`=1 ORDER BY `code`" );
		return $query->rows;
	}    
    
	protected function clean( &$str, $allowBlanks=false ) {
		$result = "";
		$n = strlen( $str );
		for ($m=0; $m<$n; $m++) {
			$ch = substr( $str, $m, 1 );
			if (($ch==" ") && (!$allowBlanks) || ($ch=="\n") || ($ch=="\r") || ($ch=="\t") || ($ch=="\0") || ($ch=="\x0B")) {
				continue;
			}
			$result .= $ch;
		}
		return $result;
	}

	protected function multiquery( $sql ) {
		foreach (explode(";\n", $sql) as $sql) {
			$sql = trim($sql);
			if ($sql) {
				$this->db->query($sql);
			}
		}
	}

	protected function getLayoutIds() {
		$result = $this->db->query( "SELECT * FROM `".DB_PREFIX."layout`" );
		$layout_ids = array();
		foreach ($result->rows as $row) {
			$layout_ids[$row['name']] = $row['layout_id'];
		}
		return $layout_ids;
	}


	protected function getAvailableStoreIds() {
		$sql = "SELECT store_id FROM `".DB_PREFIX."store`;";
		$result = $this->db->query( $sql );
		$store_ids = array(0);
		foreach ($result->rows as $row) {
			if (!in_array((int)$row['store_id'],$store_ids)) {
				$store_ids[] = (int)$row['store_id'];
			}
		}
		return $store_ids;
	}    
    
}
?>
