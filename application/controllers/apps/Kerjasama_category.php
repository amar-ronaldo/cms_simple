<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman kategori kerjasama
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class kerjasama_category extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('kerjasama_category_model');
	}

	function index(){
		$data['btn_add'] 		= btn_add();
		render('apps/kerjasama_category/index',$data,'main-apps');
	}

	function records(){
		$this->db->where('id !=', 5);
		
		$data = $this->kerjasama_category_model->records();
		render('apps/kerjasama_category/records',$data,'blank');
	}

	function add($id=''){
		$lang_name = lang_data('name');
		if($id){
			$data = $this->kerjasama_category_model->findById($id);
			
			if(!$data){ die('404'); } // data not found

			$data['btn_process'] = btn_process(language('update',$lang_name));
		} else {
			$data['btn_process'] = btn_process(language('add',$lang_name));
			$data['id']          = '';
			$data['name']        = '';
		}
		render('apps/kerjasama_category/add',$data,'main-apps');
	}

	function process($idedit=''){
		$this->layout      = 'none';
		$post              = purify($this->input->post());
		$ret['error']      = 1;

		$this->form_validation->set_rules('name', '"Group Name"', 'required'); 
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
				$act			= "Update kerjasama Category";
				$this->kerjasama_category_model->update($post,$idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert kerjasama Category";
				$this->kerjasama_category_model->insert($post);
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
        $data   = $this->kerjasama_category_model->delete($id);
        detail_log();
        insert_log("Delete kerjasama Category");
	}
	
}

/*
 * End of file kerjasama_category.php
 * Location: ./application/controllers/kerjasama_category.php
 */