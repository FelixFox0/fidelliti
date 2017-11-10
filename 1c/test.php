<?php
//phpinfo();
$products = '[{"sku":"1003\\\/Shoes\\\/S024\\\/B","quantity":"28","quantity_production":"10","price":"3190","size":{"36":"15","37":"13"}}]';
if( $curl = curl_init() ) {
    curl_setopt($curl, CURLOPT_URL, 'http://fidelitti.loc/1c/?token=31ec1923680f63a85c8025c970a0db09');
    curl_setopt($curl, CURLOPT_RETURNTRANSFER,true);
    curl_setopt($curl, CURLOPT_POST, true);
    curl_setopt($curl, CURLOPT_POSTFIELDS, "products=" . $products);
    $out = curl_exec($curl);
    echo $out;
    curl_close($curl);
}