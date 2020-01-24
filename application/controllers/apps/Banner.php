<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman news
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Banner extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('Banner_model');
	}

	function index(){
		$lang_name                  = lang_data('name');
		$data['btn_add']            = btn_add_export();
		$data['list_language']      = select_list(array('table'=>'ref_language','title'=>language('select_language', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_language'],'where'=>"id_ref_delete='0'"));
		$data['list_status']        = select_list(array('table'=>'ref_status_publish','title'=>language('select_status', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_status_publish'],'where'=>"id_ref_delete='0'"));
		render('apps/banner/index',$data,'main-apps');
	}

	function records(){
		$data = $this->Banner_model->records();
		render('apps/banner/records',$data,'blank');
	}

	function add($id=''){
		$lang_name = lang_data('name');
		if($id){
			$data = $this->Banner_model->findById($id);
			
			if(!$data){ die('404'); } // data not found

			$data['btn_process'] = btn_process(language('update',$lang_name));

		} else {
			$data['btn_process']      = btn_process(language('add',$lang_name));
			$data['id']               = '';
			$data['name']             = '';
			$data['title']            = '';
			$data['teaser']           = '';
			$data['publish_date']     = date('Y-m-d');
			$data['page_content']     = '';
			$data['seo_title']        = '';
			$data['meta_description'] = '';
			$data['youtube_link']     = '';
			$data['meta_keywords']    = '';
			$data['link']    = '';
		}


		$img_thumb                   = image($data['img'],'small');
		$imagemanager                = imagemanager('img',$img_thumb);
		$data['img']                 = $imagemanager['browse'];
		$data['imagemanager_config'] = $imagemanager['config'];

		$data['list_language']      = select_list(array('table'=>'ref_language','title'=>language('select_language', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_language'],'where'=>"id_ref_delete='0'"));
		$data['list_status']        = select_list(array('table'=>'ref_status_publish','title'=>language('select_status', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_status_publish'],'where'=>"id_ref_delete='0'"));

		render('apps/banner/add',$data,'main-apps');
	}

	function process($idedit=''){
		$this->layout      = 'none';
		$post              = purify($this->input->post());
		$ret['error']      = 1;

		$unik = $this->Banner_model->findBy($where);
		$this->form_validation->set_rules('title', '"Group Name"', 'required'); 
		$this->form_validation->set_rules('teaser', '"Teaser"', 'required'); 
		$this->form_validation->set_rules('publish_date', '"Publish Date"', 'required'); 
		if ($this->form_validation->run() == FALSE){
			$ret['message'] = validation_errors(' ',' ');
		}  else {

			$this->db->trans_start();   
			if($idedit){
				auth_update();
				if (!$post['img']) {
					unset($post['img']);
				}
				$ret['message'] = 'Update Success';
				$act			= "Update News";
				$this->Banner_model->update($post,$idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert News";
				$idedit = $this->Banner_model->insert($post);
			}
			detail_log();

			insert_log($act);
			$this->db->trans_complete();
			set_flash_session('message',$ret['message']);
			$ret['error'] = 0;
		}
		echo json_encode($ret);
	}

	function del(){
		auth_delete();
        $id     = $this->input->post('iddel');
        $data   = $this->Banner_model->delete($id);
        detail_log();
        insert_log("Delete News");
	}

	function export_to_xls(){
		$basedir = UPLOAD_DIR;
		if($_GET['download']) {
			$fileDir = $basedir.$_GET['download'];
			header('Content-Description: File Transfer');
			header('Content-Type: application/octet-stream');
			header('Content-Length: ' . filesize($fileDir));
			header('Content-Disposition: attachment; filename='.basename($fileDir));
			readfile($fileDir);unlink($fileDir);exit;
		} else {
			$post                          = $this->input->post();
			$alias['search_id']            = 'a.id';
			$alias['search_news_category'] = 'b.id';
			$alias['search_status']        = 'c.id';
			$alias['search_writer']        = 'd.fullname';
			$alias['search_language']      = 'e.id';
			where_grid($post, $alias);
			
			$this->load->library("PHPExcel");
			$objPHPExcel = new PHPExcel();
			$objPHPExcel->setActiveSheetIndex(0);    
			$objPHPExcel->getActiveSheet()->setCellValue('A1', 'NO');
			$objPHPExcel->getActiveSheet()->setCellValue('B1', 'ID');
			$objPHPExcel->getActiveSheet()->setCellValue('C1', 'NEWS CATEGORY');
			$objPHPExcel->getActiveSheet()->setCellValue('D1', 'NEWS TITLE');
			$objPHPExcel->getActiveSheet()->setCellValue('E1', 'TEASER');
			$objPHPExcel->getActiveSheet()->setCellValue('F1', 'URL');
			$objPHPExcel->getActiveSheet()->setCellValue('G1', 'CREATEDATE')->getStyle('H1:H1000')->getNumberFormat()->setFormatCode('[$-C09]d mmm yyyy;@');
			$objPHPExcel->getActiveSheet()->setCellValue('H1', 'PUBLISHDATE')->getStyle('H1:H1000')->getNumberFormat()->setFormatCode('[$-C09]d mmm yyyy;@');
			$objPHPExcel->getActiveSheet()->setCellValue('I1', 'STATUS PUBLISH');
			$objPHPExcel->getActiveSheet()->setCellValue('J1', 'HITS');
			$objPHPExcel->getActiveSheet()->setCellValue('K1', 'YOUTUBE LINK');
			$objPHPExcel->getActiveSheet()->setCellValue('L1', 'WRITER');
			$objPHPExcel->getActiveSheet()->setCellValue('M1', 'LANGUAGE');

			$data['data'] = $this->Banner_model->findBy();
			$filename     = 'news-report-'.date('Y-m-d-h-i-s').'.xlsx';
			$d = 2; $n = 0;
			foreach ($data['data'] as $key => $value){
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, ++$no);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['id']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['news_category']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['title']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['teaser']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, base_url().'article'.$value['uri_path_category'].'/'.$value['uri_path']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, date('Y-m-d H:i:s', strtotime($value['create_date'])));
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, date('Y-m-d', strtotime($value['publish_date'])));
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['status']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['hits']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['youtube_link']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['writer']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['language']);
				$d++;$n=0;
			}

			$objWriter 	= PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
			$dt 		= $objWriter->save($basedir.$filename);
			$ret['file_name'] 	= $filename;
			$ret['status'] 		= 'File Generated.';
		}
		echo json_encode($ret);
		exit;
	}
	
}

/*
 * End of file News.php
 * Location: ./application/controllers/News.php
 */