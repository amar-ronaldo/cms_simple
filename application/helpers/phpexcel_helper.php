<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Helper khusus untuk import/export data dari file excel, terutama dropdownlist di excel
 * @author Amar Ronaldo <amar.ronaldo.m@gmail.com>
 * Dicustome oleh Amar pada project inaport. Detail pemakaian, lihat pada function data_provinsi_in_excel dibawah
 */
/////////////////////////////////////////////////////////////



/** 
 * Untuk mendapatkan list provinsi pada sheet excel
 * @author  Ismatul Maula <ismatul.maula@deptechdigital.com>
 * @param  obj php excel
 * @param  beberapa parameter yg sudah dijelaskan didalam function
 * @return list data provinsi pada sheet excel
 */
function data_provinsi_in_excel($objPHPExcel='',$params=array()){
	$CI =& get_instance();
	$CI->load->model('Province_model');
	$setting_dropdown = array(
		'data_key' => ['name_alias'], // value yg dicari
		'dropdown_name' => ['Provinsi'], // select optionnya
		'colomn_list' => $params['colomn_list'], // untuk menentukan kolom dropdown
		'colomn_first' => $params['colomn_first'], // untuk menentukan baris dropdown
		'sheet' => $params['sheet'], // untuk menentukan dropdown mau ditaro di sheet berapa
		'sheetname' => $params['sheetname'], // untuk menentukan dropdown mau ditaro di sheet berapa
		'current_sheet' => $params['current_sheet'], // untuk menentukan dropdown mau ditaro di sheet berapa
		'dropdown_place' => $params['dropdown_place'], // select optionnya
	);
	$CI->db->order_by("provinsi",'ASC');
	$CI->db->select('concat(id,"| ",name) as name_alias');
	$data = $CI->Province_model->findByExcel();
	excel_dropdown($objPHPExcel,$setting_dropdown,$data);
}

/**
 * 
 * @author Amar Ronaldo
 * amar.ronaldo.m@gmail.com
 * @param  nama object phpexcel
 * @param  settingan untuk dropdown
 * @param  data untuk list dropdown
 * @return object 
 * 
 */
function excel_dropdown($obj,$setting,$data)
{
    // cek kalau setting kurang
    // $colomn_setting = array(
    //     'data_key',
    //     'colomn_list',
    //     'colomn_first',
    //     'sheet',
    //     'current_sheet',
    //     'sheetname',
    //     'dropdown_place',
    //     'dropdown_name'
    // );
    // cek option
    // foreach ($colomn_setting as $key => $value) {
    //     if (!in_array($value, $setting)) {
    //         print_r("ada yang lupa nulis nih");exit;
    //     }
    // }

    $sheet           = $setting['sheet']; // set untuk data dropdown
    $current_sheet   = $setting['current_sheet']; // set untuk dropdown
    
    $data_key        = $setting['data_key']; // key dari multi array data
    $jml_data        = count($data); // jml data

    $dropdown_target =  $setting['dropdown_place']; // alamat dropdown
    $dropdown_name   =  $setting['dropdown_name']; //  dropdown name
    $sheetname       =  $setting['sheetname'] ? $setting['sheetname']:'sheet'; // nama sheet

    // $colomn1         = $setting['colomn_list']; 
    // $colomn2         = next_alphabet($setting['colomn_list']);
    // $colomn3         = next_alphabet($setting['colomn_list'],2);

    $colomn3         = $setting['colomn_list'];
    $colomn1         = next_alphabet($setting['colomn_list']); 
    $colomn2         = next_alphabet($setting['colomn_list'],2);
   
    $first           = $setting['colomn_first']; // row pertama
    $real_first      = $setting['colomn_first']; // untuk reset row
    $last            = $jml_data + $setting['colomn_first'] - 1; // kolom terakhir
    $beforefirst     = $first-1;
    $hirarki         =  $setting['hirarki'];
    $hirarki_colomn  =  $setting['hirarki_colomn'];

    // ganti sheet
    try{
        $obj->setActiveSheetIndex($sheet);
        
    }catch(Exception $e){
        $obj->createSheet($sheet);
        $obj->setActiveSheetIndex($sheet);
    }

    $obj->getActiveSheet($sheet)->setTitle($sheetname);


    $style_col = excel_style('col');
    if (is_array($data_key)) {
        $data_mulai = 1 ;
        foreach ($data_key as $key => $value) {
            $tambahan_colomn = $key == 0 ? $data_mulai:$data_mulai+1;
            $colomn_detail = next_alphabet($colomn1,$tambahan_colomn);
            $obj->getActiveSheet()
                ->getStyle( $colomn_detail.$beforefirst)
                ->applyFromArray($style_col);

            $obj->getActiveSheet()->SetCellValue(
                $colomn_detail.$beforefirst,
                $dropdown_name[$key]
            );
            // set data dropdown
            foreach ($data as $key2 => $value2) {
                $obj->getActiveSheet()->SetCellValue(
                    $colomn_detail.$first++,
                    $value2[$value]
                );
            }
            $first = $real_first;
            $data_mulai++;

        }
    }else{
        $obj->getActiveSheet()
            ->getStyle( $colomn2.$beforefirst)
            ->applyFromArray($style_col);

        $obj->getActiveSheet()->SetCellValue(
            $colomn2.$beforefirst,
            $dropdown_name
        );
        // set data dropdown
        foreach ($data as $key => $value) {
            $data_array =  $data_key == ''?$value:$value[$data_key];
            $obj->getActiveSheet()->SetCellValue(
                $colomn2.$first++,
                $data_array
            );
        }
    }
    $first = $real_first;

    // set untuk menandai search ditemukan
    for ($i=0; $i < $jml_data; $i++) { 
        $second = $first-1;
        $cell_first = 'INDIRECT(Cell("address"))';
        
        $obj->getActiveSheet()
            ->setCellValue(
                $colomn1.$first,
                '=IF(ISNUMBER(SEARCH(IF('.
                $cell_first.'=0,"",'.$cell_first.'),'.
                $colomn2.$first.')),MAX($'.$colomn1.'$1:'.$colomn1.$second.')+1,0)'
            );
            $first++;
    }
    $first = $real_first;

    // set fungsi cari hasil search
    for ($i=0; $i <$jml_data ; $i++) { 
        $obj->getActiveSheet()
            ->SetCellValue(
                $colomn3.$first,
                '=IFERROR(VLOOKUP(ROWS($'.$colomn3.'$'.$real_first.':'.$colomn3.$first.'),$'.
                $colomn1.'$'.$real_first.':$'.$colomn2.'$'.$last.',2,0),"")'
        );
            $first++;
    }
    $first = $real_first;
    
    //hide colomn
    $colomn_hide = array($colomn3 ,$colomn2 );
    foreach ($colomn_hide as $key => $value) {
        // $obj->getActiveSheet()->getColumnDimension($value)->setVisible(false);
    }
    $obj->getActiveSheet()->getColumnDimension($colomn2)->setWidth(40);

    //set selectlistnya di excel
    $cell    = "'".$sheetname."'".'!$'.$colomn3.'$'.$real_first;
    $formula = '=OFFSET('.$cell.',,,countif('.$cell.':'.$colomn3.$last.',"?*"))';

    $obj->setActiveSheetIndex($current_sheet);
    if (is_array($dropdown_target)) {
        foreach ($dropdown_target as $key => $value) {
           excel_dropdown_validate_cell($obj,$value,$formula);
        }
    }else{
        excel_dropdown_validate_cell($obj,$dropdown_target,$formula,$setting,$last);
    }
}

function excel_dropdown_validate_cell($obj,$cell='',$formula,$setting,$last)
{
    // misah kan excel colomn bila range
    preg_match_all('/([a-zA-Z]+)([0-9]+)/m', $cell,$regex);

    if (count($regex[0]) <2) {
        excel_dropdown_validate($obj,$regex[1][0].$regex[2][0],$formula);
    }
    // range colomn
    else{

            $colomn_first = '$'.next_alphabet($setting['colomn_list'],2).$setting['colomn_first'];
            $colomn_last  = '$'.next_alphabet($setting['colomn_list'],2+count($setting['data_key'])).$last;

            $sheetname    = "'".$setting['sheetname']."'!";

        for ($i=$regex[2][0]; $i <= $regex[2][1]; $i++) { 
            excel_dropdown_validate($obj,$regex[1][0].$i,$formula);
            if ($setting['hirarki'] == 1) {
                foreach ($setting['hirarki_colomn'] as $key => $value) {
                    $offset = $value[0]+2;
                    $obj->setActiveSheetIndex($setting['current_sheet']);
                    $formula2 = '=IFERROR(VLOOKUP('.$regex[1][0].$i.','.$sheetname.$colomn_first.':'.$colomn_last.','.$offset.',),"")';
                    $obj->getActiveSheet()->SetCellValue(
                        $key.$i,
                        $formula2
                    );
                }
            }
        }
    }
}
/**
 * membuat validate yang diperlukan dropdown excel
 * @param  object $obj obj phpexcel
 * @param  string $cell name cell
 * @param  string $formula formula untuk validate
 * @return Cell
 */
function excel_dropdown_validate($obj,$cell='',$formula)
{
    // set validate excel
    $objValidation = $obj->getActiveSheet()->getCell($cell)->getDataValidation();                
    $objValidation->setType( PHPExcel_Cell_DataValidation::TYPE_LIST );
    $objValidation->setErrorStyle( PHPExcel_Cell_DataValidation::STYLE_INFORMATION );
    $objValidation->setAllowBlank(true);
    $objValidation->setShowInputMessage(false);
    $objValidation->setShowErrorMessage(false);
    $objValidation->setShowDropDown(true);
    $objValidation->setFormula1($formula);
}
/**
 * untuk  penamaan download excel
 * @param  string $obj  object phpexcel
 * @param  string $name nama dari database
 * @return browser langsung download file 
 */
function excel_download($obj='',$name)
{
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="'.$name.'.xlsx"');
    header('Cache-Control: max-age=0');
    header('Cache-Control: max-age=1');
    header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); 
    header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); 
    header ('Cache-Control: cache, must-revalidate'); 
    header ('Pragma: public'); 

    $objWriter = PHPExcel_IOFactory::createWriter($obj, 'Excel2007');
    $objWriter->save('php://output');
}
/**
 * Set excel style
 * @return format excel style
 */
function excel_style($type=''){
    switch ($type) {
        case 'title':
            // Buat sebuah variabel untuk menampung pengaturan style dari title
            return  array(
              'font' => array('bold' => true), // Set font nya jadi bold
              'alignment' => array(
                'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, // Set text jadi ditengah secara horizontal (center)
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER // Set text jadi di tengah secara vertical (middle)
              )
            );
            break;
        case 'col':
            // Buat sebuah variabel untuk menampung pengaturan style dari header tabel
            return array(
              'font' => array('bold' => true), // Set font nya jadi bold
              'alignment' => array(
                'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, // Set text jadi ditengah secara horizontal (center)
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER // Set text jadi di tengah secara vertical (middle)
              ),
              'borders' => array(
                'top' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border top dengan garis tipis
                'right' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),  // Set border right dengan garis tipis
                'bottom' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border bottom dengan garis tipis
                'left' => array('style'  => PHPExcel_Style_Border::BORDER_THIN) // Set border left dengan garis tipis
              )
            );
            break;
       case 'row':
            // Buat sebuah variabel untuk menampung pengaturan style dari isi tabel
            return array(
              'alignment' => array(
                'vertical' => PHPExcel_Style_Alignment::VERTICAL_TOP // Set text jadi di tengah secara vertical (middle)
              ),
              'borders' => array(
                'top' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border top dengan garis tipis
                'right' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),  // Set border right dengan garis tipis
                'bottom' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border bottom dengan garis tipis
                'left' => array('style'  => PHPExcel_Style_Border::BORDER_THIN) // Set border left dengan garis tipis
              )
            );
            break;
    }
}

/**cari next string
 * @param  huruf
 * @return huruf selanjutnya
 */
function next_alphabet($letter,$jmlnext=1)
{
    for ($i=0; $i < $jmlnext; $i++) { 
        ++$letter;   
    }
    return $letter;     
}

/**
 * format saat import excel
 * @param  string $value  [data]
 * @param  string $format [format]
 * @return [data terformat]
 */
function excel_format($value='',$format='')
{
    return PHPExcel_Style_NumberFormat::toFormattedString($value,$format);
}

/**
 * untuk mendapatkan range dropdown untuk template
 * @param  string $cell alamat cell
 * @return range alamat cell +14
 */
function excel_dropdown_template_place($cell='')
{
    preg_match_all('/([a-zA-Z]+)([0-9]+)/m', $cell,$regex);

    return $cell.':'.$regex['1']['0'].next_alphabet($regex['2']['0'],14);
}