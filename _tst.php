<?php 
session_start();
include ("config.php");
$browser = array(
    'version'   => '0.0.0',
    'majorver'  => 0,
    'minorver'  => 0,
    'build'     => 0,
    'name'      => 'unknown',
    'useragent' => ''
  );

  $browsers = array(
    'firefox', 'msie', 'opera', 'chrome', 'safari', 'mozilla', 'seamonkey', 'konqueror', 'netscape','gecko', 'navigator', 'mosaic', 'lynx', 'amaya', 'omniweb', 'avant', 'camino', 'flock', 'aol'
  );

  if (isset($_SERVER['HTTP_USER_AGENT'])) {
    $browser['useragent'] = $_SERVER['HTTP_USER_AGENT'];
    $user_agent = strtolower($browser['useragent']);
    foreach($browsers as $_browser) {
      if (preg_match("/($_browser)[\/ ]?([0-9.]*)/", $user_agent, $match)) {
        $browser['name'] = $match[1];
        $browser['version'] = $match[2];
        @list($browser['majorver'], $browser['minorver'], $browser['build']) = explode('.', $browser['version']);
        break;
      }
    }
  }

?>


<?php 
$OSList = array
(
// Match user agent string with operating systems
'Windows 3.11' => 'Win16',
'Windows 95' => '(Windows 95)|(Win95)|(Windows_95)',
'Windows 98' => '(Windows 98)|(Win98)',
'Windows 2000' => '(Windows NT 5.0)|(Windows 2000)',
'Windows XP' => '(Windows NT 5.1)|(Windows XP)',
'Windows Server 2003' => '(Windows NT 5.2)',
'Windows Vista' => '(Windows NT 6.0)',
'Windows 7' => '(Windows NT 7.0)',
'Windows NT 4.0' => '(Windows NT 4.0)|(WinNT4.0)|(WinNT)|(Windows NT)',
'Windows ME' => 'Windows ME',
'Open BSD' => 'OpenBSD',
'Sun OS' => 'SunOS',
'Linux' => '(Linux)|(X11)',
'Mac OS' => '(Mac_PowerPC)|(Macintosh)',
'QNX' => 'QNX',
'BeOS' => 'BeOS',
'OS/2' => 'OS/2',
'Search Bot'=>'(nuhk)|(Googlebot)|(Yammybot)|(Openbot)|(Slurp)|(MSNBot)|(Ask Jeeves/Teoma)|(ia_archiver)'
);
// Loop through the array of user agents and matching operating systems
foreach($OSList as $CurrOS=>$Match)
{
// Find a match
if (eregi($Match, $_SERVER['HTTP_USER_AGENT']))
{
// We found the correct match
break;
}
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style_main_page.css" />
<link rel="stylesheet" type="text/css" href="form/style_popolnenie.css"/>
<script src="form/jquery.js"></script> 
<script>

$(function() {
	$("a[rel]").overlay(function test() {		
   $('#overlay').html('<div class="wrap"></div>');
		var wrap = this.getContent().find("div.wrap");
		if (wrap.is(":empty")) {
			wrap.load(this.getTrigger().attr("href"));
		}
	});
});

</script>
<title>test page</title>

</head>
<body>
<a href='form/page_zp_info.php?id=0' rel='#overlay'><img src='images/plus_icon.png' width='20' height='20' border='0'></a>

<div class="overlay" id="overlay">
<div class="wrap"></div></div>
<?php 

echo $browser['name'].'  '.$browser['version'].'<br>';

// You are using ...
echo "OS ".$CurrOS.'<br>';


$hours = date('H') + $_SESSION['time_zone']; 
$data = date ('d.m.Y', mktime ($hours));
$dat = date ('d.m.Y H:i:s', mktime ($hours));

$date1='15.05.2013 15:00:00';

$date2=$data.'15:00:00';

echo strtotime($date1).'<br>';
echo strtotime($date2).'<br>';

echo strtotime($dat).' -> my test';

	$result = mysql_query("SELECT * FROM sklad_kategorii ORDER BY ID ASC",$db);

$myarray = array(); $i = 0;	
//	print_r($myrow);
while ($myrow = mysql_fetch_array($result)) {	
$myarray['ID'][$i] = $myrow['ID'];
$myarray['kateg'][$i] = $myrow['kateg'];
$i++;
}
	print_r($myarray);
	echo '<br>';
	echo 'element '.$myarray['ID'][1];
	echo '<br>';
	echo 'iteration  '.$i;
	echo '<table>';
	for ($no=0; $no<$i; $no++) {echo '<tr><td>'.$myarray['ID'][$no].'</td><td>'.$myarray['kateg'][$no].'</td></tr>';}
	echo '</table>';
	
	$arr = "test";
    $filter = array("1"); 
     foreach($arr as $num=>$xss){
        $arr[$num]=str_replace($filter, "`", $xss, $apostroff_counter);
     }

	echo 'apastroff_num = '.$apostroff_counter;


$res_count = mysql_query("SELECT count(*) as total FROM sklad_kategorii",$db);
if (mysql_num_rows($res_count) > 0) {
$myr_count = mysql_fetch_assoc($res_count);
$incriment_graf = round(($myr_count['total']/4), 0);
echo '</br>$incriment_graf: '.$incriment_graf;


$text = 'Интертелеком "Барышевка" л/с 2797503 с прошлого месяца "3G Турбо вільний доступ+"';
$text = substr($text,0,strripos(substr($text,0,34),' ')); 
echo '</br>'.$text;


}	
?>
</body>
</html>