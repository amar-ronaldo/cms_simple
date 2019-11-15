<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman auth pages
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Auth_group extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('Auth_group_model');
	}

	function index(){
		$data['btn_add'] 		= btn_add();
		$data['list_genders'] 	= select_list(array('table'=>'ref_gender','title'=>language('select_gender', $lang_name),'id_ref_delete'=>0));
		render('apps/auth-group/index',$data,'main-apps');
	}

	function records(){
		$this->load->model('Auth_user_model');
		$data = $this->Auth_group_model->records();
		foreach ($data['data'] as $key => $value) {
			$total_user = $this->Auth_user_model->findBy(array('id_ref_auth_user_group'=>$value['id']),0,1);
			$data['data'][$key]['group_name'] 	= $value['group_name'];
			$data['data'][$key]['total_users'] 	= $total_user;
		}
		render('apps/auth-group/records',$data,'blank');
	}

	function add($id=''){
		$lang_name = lang_data('name');
		if($id){
			$data = $this->Auth_group_model->findById($id);
			
			if(!$data){ die('404'); } // data not found

			$data['btn_process'] = btn_process(language('update',$lang_name));
		} else {
			$data['btn_process'] = btn_process(language('add',$lang_name));
			$data['id']          = '';
			$data['name']        = '';
		}
		
		render('apps/auth-group/add',$data,'main-apps');
	}

	function process($idedit=''){
		$this->layout 	= 'none';
		$post 			= purify($this->input->post());
		$ret['error']	= 1;
		$this->form_validation->set_rules('name', '"Group Name"', 'required'); 
		if ($this->form_validation->run() == FALSE){
			$ret['message']  = validation_errors(' ',' ');
		} else {
			$this->db->trans_start();   
			if($idedit){
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update Auth Group";
				$this->Auth_group_model->update($post,$idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert Auth Group";
				$this->Auth_group_model->insert($post);
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
        $data   = $this->Auth_group_model->delete($id);
        detail_log();
        insert_log("Delete Auth Group");
	}

}

/*
 * End of file Auth_group.php
 * Location: ./application/controllers/Auth_group.php
 */