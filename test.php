<?php
print("hello");


$a = [];
$a["vehicle"]["capacity"] = [[8]];
$json = json_encode($a);
$json_decode = json_decode($json);
// $json = json_encode($json_decode, JSON_FORCE_OBJECT);
print_r($json);