<?php
$host = 'localhost'; 
$user = 'cdma'; 
$pass = 'cdma'; 
$base = 'zadmin_cdma';  


@$db = mysql_connect ($host,$user,$pass);
@mysql_select_db($base,$db);
mysql_query("SET NAMES 'utf8'");
ini_set('display_errors', '1');

?>