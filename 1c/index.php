<?php
// config db
$host = 'localhost';
$user = 'root';
$password = '';
$db_name = 'fidelitti';
$port = '3306';
$db_prefix = 'oc_';

if(isset($_GET['token'])){
    if($_GET['token'] === '31ec1923680f63a85c8025c970a0db09'){
        if($db = mysql_connect($host . ':' . $port, $user , $password)){
            if(!mysql_select_db($db_name)){
                echo 'Error: DB not exist';
                die();
            }
            if(isset($_GET['products'])){
                $products = json_decode($_GET['products']);
//                $products = (array) $products;
//                var_dump($products);
                foreach ($products as $key => $value) {
                    $value = (array) $value;
                    if((int)$value['quantity_production']){
                        $stock_status_id = 6;
                    }else{
                        $stock_status_id = 8;
                    }
                    
//                    mysql_query("UPDATE " . $db_prefix . "product SET quantity = '" . (int)$value['quantity'] . "', stock_status_id = '" . (int)$stock_status_id . "', price = '" . (float)$value['price'] . "', status = '1', date_modified = NOW() WHERE sku = '" . $value['sku'] . "'");
                    mysql_query("UPDATE " . $db_prefix . "product SET quantity = '" . (int)$value['quantity'] . "', stock_status_id = '" . (int)$stock_status_id . "', date_modified = NOW() WHERE sku = '" . $value['sku'] . "'");
                    
                    if (isset($value['size'])) {
			foreach ($value['size'] as $key_size => $option_value) {
                            $option_value = (array) $option_value;
                            $option_id = 22;
                            $option_value_id = query("SELECT option_value_id FROM " . $db_prefix . "option_value_description WHERE name = '" . $key_size . "' AND option_id = ". (int)$option_id);
                            $product_id = query("SELECT product_id FROM  " . $db_prefix . "product WHERE sku = '" . $value['sku'] . "'");
                            
                            if($product_id['row']['product_id']&&$option_value_id['row']['option_value_id']&&$option_id){
                                mysql_query("UPDATE " . $db_prefix . "product_option_value SET quantity = '" . (int)$option_value[0] . "' WHERE product_id = '" . (int)$product_id['row']['product_id'] . "' AND option_id = '" . (int)$option_id . "' AND option_value_id = '" . (int)$option_value_id['row']['option_value_id'] . "'");
                            }   
                        }
                    }
                }
            }else{
                echo 'Error: array of products not received';
            }
            mysql_close($db);
        }else{
            echo 'Error: DB not connected';
        }
    }else{
        echo 'Error: token does not exist';
    }
}else{
    echo 'token not entered';
}
echo 'complete';

function query($sql) {
    $resource = mysql_query($sql);
    if ($resource) {
            if (is_resource($resource)) {
                    $i = 0;

                    $data = array();

                    while ($result = mysql_fetch_assoc($resource)) {
                            $data[$i] = $result;

                            $i++;
                    }

                    mysql_free_result($resource);

                    $query = array();
                    $query['row'] = isset($data[0]) ? $data[0] : array();
                    $query['rows'] = $data;
                    $query['num_rows'] = $i;

                    unset($data);

                    return $query;
            } else {
                    return true;
            }
    } else {
            $trace = debug_backtrace();

            //throw new \Exception('Error: ' . mysql_error($this->connection) . '<br />Error No: ' . mysql_errno($this->connection) . '<br /> Error in: <b>' . $trace[1]['file'] . '</b> line <b>' . $trace[1]['line'] . '</b><br />' . $sql);
    }
}
