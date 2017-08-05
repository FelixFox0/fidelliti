<?php
//Переклад: Том'як Олег з любов'ю до Української мови та легкості Opencart
// Headings
$_['heading_title']        	   = 'Налаштування';
$_['text_openbay']             = 'OpenBay Pro';
$_['text_fba']                 = 'Fulfillment від Amazon';

// Text
$_['text_success']     		   = 'Ваші налаштування збережені';
$_['text_status']         	   = 'Статус';
$_['text_account_ok']  		   = 'З’єднання до Fulfillment by Amazon встановлене';
$_['text_api_ok']       	   = 'API з’єднання встанолвене';
$_['text_api_status']          = 'API з’єднання';
$_['text_edit']           	   = 'Редагувати налаштування Fulfillment by Amazon';
$_['text_standard']            = 'Стандартні';
$_['text_expedited']           = 'Доставка';
$_['text_priority']            = 'Пріоритет';
$_['text_fillorkill']          = 'Заповнити або знищити';
$_['text_fillall']             = 'Заповнити все';
$_['text_fillallavailable']    = 'Заповнити всі доступні';
$_['text_prefix_warning']      = 'Do not change this setting after orders have been sent to Amazon, only set this when you first install.';
$_['text_disabled_cancel']     = 'Disabled - do not automatically cancel fulfillments';
$_['text_validate_success']    = 'Your API details are working correctly! You must press save to ensure settings are saved.';
$_['text_register_banner']     = 'Натистніть тут, якщо Вам необхідна реєстрація';

// Entry
$_['entry_api_key']            = 'API ключ';
$_['entry_account_id']         = 'ID аккаунта';
$_['entry_send_orders']        = 'Автоматично надсилати замовлення';
$_['entry_fulfill_policy']     = 'Fulfillment Політика дій';
$_['entry_shipping_speed']     = 'Швидкість доставки за замовчуванням';
$_['entry_debug_log']          = 'Включити режим налагодження';
$_['entry_new_order_status']   = 'Новий триге fulfillment';
$_['entry_order_id_prefix']    = 'Order ID префікс';
$_['entry_only_fill_complete'] = 'Всі лоти повинні бути для FBA';

// Help
$_['help_api_key']             = 'This is your API key, obtain this from your OpenBay Pro account area';
$_['help_account_id']          = 'This is the account ID that matches the registered Amazon account for OpenBay Pro, obtain this from your OpenBay Pro account area';
$_['help_send_orders']  	   = 'Orders containing matching Fulfillment by Amazon products will be send to Amazon automatically';
$_['help_fulfill_policy']  	   = 'The default fulfillment policy (FillAll - All fulfillable items in the fulfillment order are shipped. The fulfillment order remains in a processing state until all items are either shipped by Amazon or cancelled by the seller. FillAllAvailable - All fulfillable items in the fulfillment order are shipped. All unfulfillable items in the order are cancelled by Amazon.FillOrKill - If an item in a fulfillment order is determined to be unfulfillable before any shipment in the order moves to the Pending status (the process of picking units from inventory has begun), then the entire order is considered unfulfillable. However, if an item in a fulfillment order is determined to be unfulfillable after a shipment in the order moves to the Pending status, Amazon cancels as much of the fulfillment order as possible.)';
$_['help_shipping_speed']  	   = 'This is the default shipping speed category to apply to new orders, different service levels may incurr different costs';
$_['help_debug_log']  		   = 'Debug logs will record information to a log file about actions the module does. This should be left enabled to help find the cause of any problems.';
$_['help_new_order_status']    = 'This is the order status which will trigger the order to be created for fulfillment. Ensure that this is using a status only after you have received payment.';
$_['help_order_id_prefix']     = 'Having an order prefix will help identify orders that have come from your store not from other integrations. This is very helpful when merchants sell on many marketplaces and use FBA';
$_['help_only_fill_complete']  = 'This will only allow orders to be sent for fulfillment if ALL items in the order are matched to a Fulfillment by Amazon item. If any item is not then the whole order will remain unfilled.';

// Error
$_['error_api_connect']        = 'Failed to connect to the API';
$_['error_account_info']       = 'Unable to verify API connection to Fulfillment by Amazon ';
$_['error_api_key']    		   = 'The API key is invalid';
$_['error_api_account_id']     = 'The Account ID is invalid';
$_['error_validation']    	   = 'There was an error validating your details';

// Tabs
$_['tab_api_info']             = 'API леталі';

// Buttons
$_['button_verify']            = 'Деталі верифікації';