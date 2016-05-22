<?php include ("../config.php"); include ("functions.php");

header('Content-Type: text/html; charset=utf-8');
mysql_query("SET NAMES utf8");

session_start();
 

if ((isset($_SESSION['user_id'])) && ($_SESSION['password_secret_id_string'] == md5($_SERVER['REMOTE_ADDR'].$_SESSION['user_id'].session_id().'6891'))) {
	
$_POST=defender_xss($_POST);
$_POST=defender_sql($_POST);

      if (isset($_POST['kategory'])) {$kategory = $_POST['kategory'];if ($kategory == '') {unset ($kategory);}}
      if (isset($_POST['tovar'])) {$tovar = $_POST['tovar'];if ($tovar == '') {unset ($tovar);}}
      if (isset($_POST['kolichestvo'])) {$kolichestvo = $_POST['kolichestvo']; if ($kolichestvo == '') {$kolichestvo = 0;}}
	  if (isset($_POST['shtrih'])) {$shtrih = $_POST['shtrih']; if ($shtrih == '') {unset($shtrih);}}

$shtrih_copy = false;
if (($kolichestvo > 0) && isset($shtrih) && isset($kategory) && isset($tovar)) {
	
	$res_find_shtrih=mysql_query("SELECT DISTINCT shtrih FROM shtrihkod WHERE shtrih = '$shtrih'",$db);
    if (mysql_num_rows($res_find_shtrih) > 0) {$shtrih_copy = true;} else {
			$res_shtrih=mysql_query("INSERT INTO shtrihkod SET ID_ketegorii = '$kategory', ID_tovara = '$tovar', shtrih = '$shtrih'",$db);
	        $kolichestvo = $kolichestvo-1;
		}
	

}
	
if ($kolichestvo > 0) {
	if ($shtrih_copy == false) {
		header("Location: add_shtrihkod.php?k=$kategory&t=$tovar&kc=$kolichestvo");
		}
		else {
			header("Location: add_shtrihkod.php?k=$kategory&t=$tovar&kc=$kolichestvo&al=$shtrih");
			}
}
else {
header("Location: ../sklad.php");
}	
//echo '<meta http-equiv="refresh" content="0; url=http://multiservice.org.ua/prodaja.php">';
}
else {

header("Location: ../index.php");
die();
}
 ?>
