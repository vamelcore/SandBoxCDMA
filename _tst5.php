<?php
header('Content-Type: text/html; charset=utf-8');

$format = 'd.m.Y';

require_once 'PHPExcel/IOFactory.php';
$objPHPExcel = PHPExcel_IOFactory::load("Семко (Автосохраненный).xls");
foreach ($objPHPExcel->getWorksheetIterator() as $worksheet)
{
    $worksheetTitle     = $worksheet->getTitle();
    $highestRow         = $worksheet->getHighestRow(); // например, 10
    $highestColumn      = $worksheet->getHighestColumn(); // например, 'F'
    $highestColumnIndex = PHPExcel_Cell::columnIndexFromString($highestColumn);
    $nrColumns = ord($highestColumn) - 64;
    echo "<br>В таблице ".$worksheetTitle." ";
    echo $nrColumns . ' колонок (A-' . $highestColumn . ') ';
    echo ' и ' . $highestRow . ' строк.';
    echo '<br>Данные: <table border="1"><tr>';
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
			           
            echo '<td>' . $val . '<br>(Тип ' . $dataType . ')</td>';
        }
        echo '</tr>';
    }
    echo '</table>';
}

?>