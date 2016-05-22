<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<?php session_start();?>
<title>Дамп выборки</title>
<link rel="stylesheet" href="../style_main_page.css" />


</head>
<body>

<table border="0" style='border:1px solid #ccc; background:#f6f6f6;'>
<tr>
<td>


<?php /*?><!--<table>
	<tr>
		<th>Name</th>
		<th>Value</th>
	</tr>
	<?php $count = 0; foreach ($_POST as $name => $value) { ?>
	<tr class="<?php echo $count % 2 == 0 ? 'alt' : ''; ?>">
		<td><?php echo htmlentities(stripslashes($name)); if (htmlentities(stripslashes($name)) =='uploader_0_name') {$filename = nl2br(htmlentities(stripslashes($value)));} ?></td>
		<td><?php echo nl2br(htmlentities(stripslashes($value))) ?></td>
	</tr>
	<?php } ?>
</table>--><?php */
foreach ($_POST as $name => $value) {
if (htmlentities(stripslashes($name)) =='uploader_0_name') {$filename = nl2br(htmlentities(stripslashes($value)));}
}
?>

<p style="font-size:16px;"><strong>Имя файла: <?php echo $filename;?></strong>  <a href="print.php">XLS_ARRAY</a></p>

</td>
</tr>
<tr>
<td>



<?php

$format = 'd.m.Y';

require_once '../PHPExcel/IOFactory.php';
$filename = 'uploads/'.$filename;
$xls_data_array = array();

$objPHPExcel = PHPExcel_IOFactory::load($filename);
foreach ($objPHPExcel->getWorksheetIterator() as $worksheet)
{
    $worksheetTitle     = $worksheet->getTitle();
    $highestRow         = $worksheet->getHighestRow(); // например, 10
    $highestColumn      = $worksheet->getHighestColumn(); // например, 'F'
    $highestColumnIndex = PHPExcel_Cell::columnIndexFromString($highestColumn);
    $nrColumns = ord($highestColumn) - 64;
    echo "<br><p style='font-size:14px;'>В таблице \"".$worksheetTitle."\" ";
    echo $nrColumns . ' колонок (A-' . $highestColumn . ') ';
    echo ' и ' . $highestRow . ' строк:</p><br>';
    echo '<table bgcolor=#c6d5e1 border=0 cellpadding=10 cellspacing=2 ><tr>';
    for ($row = 1; $row <= $highestRow; ++ $row)
    {
        echo '<tr>';
        for ($col = 0; $col < $highestColumnIndex; ++ $col) 
        {
            $cell = $worksheet->getCellByColumnAndRow($col, $row);
            $val = $cell->getValue();
			$dataType = PHPExcel_Cell_DataType::dataTypeForValue($val);
			
			   if((PHPExcel_Shared_Date::isDateTime($cell)) && ($dataType == 'n')) {
               $val = date($format, PHPExcel_Shared_Date::ExcelToPHP($val)); 
               }
			   
			   if((substr($val,0,1) == '=' ) && (strlen($val) > 1)){
               $boost = $val;
			   $val = $cell->getCalculatedValue();
			   if ($val == "#REF!") {$val = $boost;}
               }
			$xls_data_array[$worksheetTitle][$col][$row] = $val;
			if ($row == 1) {$info = '<td bgcolor=#c1cedb>'; $values = '<strong>'.$val.'</strong>';} else {$info = '<td bgcolor=#f6f6f6>'; $values = $val;}           
//            echo $info . $val . '<br>(Тип ' . $dataType . ')</td>';
			echo $info . $values . '</td>';
        }
        echo '</tr>';
    }
    echo '</table>';
}
$_SESSION['xls_data_array'] = $xls_data_array;
?>

 

</td>
</tr>
</table>


</body>
</html>
