<?php
header('Content-Type: text/html; charset=utf-8');


require_once 'PHPExcel.php';
$objPHPExcel = new PHPExcel();

//настройки для шрифтов
$baseFont = array(
	'font'=>array(
		'name'=>'Arial',
		'size'=>'10',
		'bold'=>false
	)
);
$boldFont = array(
	'font'=>array(
		'name'=>'Arial',
		'size'=>'12',
		'bold'=>true
	)
);
//и позиционирование
$center = array(
	'alignment'=>array(
		'horizontal'=>PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
		'vertical'=>PHPExcel_Style_Alignment::VERTICAL_TOP
	)
);

// устанавливаем метаданные
$objPHPExcel->getProperties()->setCreator("PHP")
                ->setLastModifiedBy("Алексей")
                ->setTitle("Office 2007 XLSX Тестируем")
                ->setSubject("Office 2007 XLSX Тестируем")
                ->setDescription("Тестовый файл Office 2007 XLSX, сгенерированный PHPExcel.")
                ->setKeywords("office 2007 openxml php")
                ->setCategory("Тестовый файл");

$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'Привет')
            ->setCellValue('B1', 'Мир!');

$objPHPExcel->getActiveSheet()->setTitle('Демо');

$objPHPExcel->createSheet(1);

$objPHPExcel->setActiveSheetIndex(1);
$objPHPExcel->getActiveSheet()->setCellValue('A2', 'Привет')->getStyle('A2')->applyFromArray($boldFont)->applyFromArray($center);
$objPHPExcel->getActiveSheet()->setCellValue('B2', 'Мир!')->getStyle('B2')->applyFromArray($boldFont)->applyFromArray($center);

$objPHPExcel->getActiveSheet()->getColumnDimension("A")->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension("B")->setAutoSize(true);

$objPHPExcel->getActiveSheet()->setTitle('Демо2');

$filename='Остатки.xlsx';
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'); 
header('Content-Disposition: attachment;filename="'.$filename.'"');
header('Cache-Control: max-age=0');
			
require_once 'PHPExcel/IOFactory.php';
$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
// Если вы хотите, то можете сохранить в другом формате, например, PDF:
//$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'PDF');
//$objWriter->save('MyExcel.xslx');
$objWriter->save('php://output');
?>