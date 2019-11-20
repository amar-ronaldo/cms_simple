<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Controller untuk menghandle modul pages
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Pages extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('Pages_model');
	}

	function index(){
		$data['btn_add'] = btn_add();
		render('apps/pages/index',$data,'main-apps');
	}

	function records(){
		$data = $this->Pages_model->records();
		render('apps/pages/records',$data,'blank');
	}

	function add($id=''){
		$lang_name = lang_data('name');
		if($id){
			$data = $this->Pages_model->findById($id);
			
			if(!$data){ die('404'); } // data not found

			$data['btn_process'] = btn_process(language('update',$lang_name));
		} else {
			$data['btn_process']      = btn_process(language('add',$lang_name));
			$data['id']               = '';
			$data['page_name']        = '';
			$data['teaser']           = '';
			$data['page_content']     = '';
			$data['uri_path']         = '';
			$data['img']              = '';
			$data['seo_title']        = '';
			$data['meta_description'] = '';
			$data['meta_keywords']    = '';
		}
		$img_thumb                   = image($data['img'],'small');
		$imagemanager                = imagemanager('img',$img_thumb);
		$data['img']                 = $imagemanager['browse'];
		$data['imagemanager_config'] = $imagemanager['config'];
		$data['list_language']       = select_list(array('table'=>'ref_language','title'=>language('select_language', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_language']));
		render('apps/pages/add',$data,'main-apps');
	}

	function process($idedit=''){
		$this->layout 	= 'none';
		$post 			= purify($this->input->post());
		$ret['error']	= 1;
		$lang_name 		= lang_data('name');
		$this->form_validation->set_rules('page_name', language('pages_name',$lang_name), 'required'); 
		$this->form_validation->set_rules('teaser', language('teaser',$lang_name), 'required'); 
		if ($this->form_validation->run() == FALSE){
			$ret['message']  = validation_errors(' ',' ');
		} else {
			$this->db->trans_start();   
			if($idedit){
				auth_update();
				if (!$post['img']) {
					unset($post['img']);
				}
				$ret['message'] = 'Update Success';
				$act			= "Update Auth Group";
				$this->Pages_model->update($post,$idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert Auth Group";
				$this->Pages_model->insert($post);
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
        $data   = $this->Pages_model->delete($id);
        detail_log();
        insert_log("Delete Auth Group");
	}

	function select_pages(){
		$data = $this->Pages_model->records();
		render('apps/pages/records-module',$data,'blank');
	}

}

/*
 * End of file Pages.php
 * Location: ./application/controllers/Pages.php
 */