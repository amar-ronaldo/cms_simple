<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman auth pages
 * @author 	Anisa Fitri <anisa@deptechdigital.com>
 * 
 */

class Language extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('Language_model');
	}

	function index(){
		$data['btn_add'] 		= btn_add();
		$data['list_genders'] 	= select_list(array('table'=>'ref_gender','title'=>language('select_gender', $lang_name),'id_ref_delete'=>0));
		render('apps/language/index',$data,'main-apps');
	}

	function records(){
		$data = $this->Language_model->records();
		foreach ($data['data'] as $key => $value) {
			$id_lang = $value['id'];
			$data['data'][$key]['status_lang'] = ($value['status_lang'] == 1) ? 'Default' : "<a class='text-primary' style=' cursor: pointer;'  id='change-status' data-id='$id_lang'>Change Default</a>";  
		}
		render('apps/language/records',$data,'blank');
	}

	function add($id=''){
		$lang_name = lang_data('name');
		if($id){
			$data = $this->Language_model->findById($id);
			
			if(!$data){ die('404'); } // data not found

			$data['btn_process'] = btn_process(language('update',$lang_name));
		} else {
			$data['btn_process'] = btn_process(language('add',$lang_name));
			$data['id']          = '';
			$data['name']        = '';
			$data['code']        = '';
		}
		render('apps/language/add',$data,'main-apps');
	}

	function process($idedit=''){
		$this->layout 	= 'none';
		$post 			= $this->input->post();
		
		$ret['error']	= 1;
		
		$this->form_validation->set_rules('name', '"Language Name"', 'required'); 
		if ($this->form_validation->run() == FALSE){
			$ret['message']  = validation_errors(' ',' ');
		} else {
			$this->db->trans_start();   
			if($idedit){
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update Language";
				$this->Language_model->update($post,$idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert Language";
				$this->Language_model->insert($post);
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
        $data   = $this->Language_model->delete($id);
        detail_log();
        insert_log("Delete Language");
	}

	function change_status(){

		$this->layout        = 'none';
		$post                = purify($this->input->post());
		$id                  = $post['id'];
		$ret['error']        = 1;

		unset($post['id']);

		$this->db->trans_start();   
		if($id){
			$post['status_lang']        = 1;
			$update_lang['status_lang'] = 0;
			
			$cek_lang      = $this->Language_model->check_status_lang(1);
			$id_lang_aktif = $cek_lang['id'];

			if($id_lang_aktif){
				auth_update();
				$ret['message'] = 'Update Success';
				$act            = "Update Language";

				$this->Language_model->update($update_lang,$id_lang_aktif); // update lang aktif menjadi tidak aktif
				$this->Language_model->update($post,$id); // update lang aktif	
				clear_data_cache(); // clear cache default language
			} 

		} else {
			auth_insert();
			$ret['message'] = 'Gagal Update';
			$act			= "Gagal Update Language";
		}

		detail_log();
		insert_log($act);
		$this->db->trans_complete();
		set_flash_session('message',$ret['message']);
		$ret['error'] = 0;

		echo json_encode($ret);

	}
	
}

/*
 * End of file Language.php
 * Location: ./application/controllers/Language.php
 */