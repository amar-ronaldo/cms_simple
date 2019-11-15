<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Controller untuk handle halaman ubah password
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Change_pw extends CI_Controller {
	
	function __construct(){
		parent::__construct();
        $this->load->model('Auth_user_model');
	}

	function index(){
		$user_sess = $this->session->userdata('ADM_SESS');
		if(!$user_sess){
        	redirect('apps/login');
		}
		$data['id'] 		= $user_sess['admin_id'];
		$data['old_pass'] 	= '';
		$data['new_pass'] 	= '';
		$data['re_pass'] 	= '';
		render('apps/myaccount/change-pw',$data,'main-apps');
	}

	function process($idedit=''){
		$this->layout 	= 'none';
		$post 			= purify($this->input->post());
		$ret['error']	= 1;
		$this->form_validation->set_rules('old_pass', 'Old password', 'required');
		$this->form_validation->set_rules('new_pass', 'New password', 'required');
		$this->form_validation->set_rules('re_pass', 'Retype password', 'required');
		if ($this->form_validation->run() == FALSE){
			$ret['message']  = validation_errors(' ',' ');
		} else {
			$check 		= $this->Auth_user_model->findById($idedit);
			$old_pass 	= md5($post['old_pass']);

			if($old_pass!=$check['password']){ // 
				$ret['message'] = "Old password doesn't match.";
			} else if(strtolower($post['re_pass'])!=strtolower($post['new_pass'])){
				$ret['message'] = "Retype password doesn't match with new password.";
			} else if(strlen($post['new_pass'])<MIN_LENGTH_PASS){
				$ret['message'] = "Minimum password is 7 characters.";
			} else {
				$this->db->trans_start();   
				if($idedit){
					auth_update();
					$ret['message'] = 'Update Success';
					$act			= "Update Myaccount";
					$this->Auth_user_model->update(array('password'=>md5($post['new_pass'])),$idedit);
					update_profile_session($idedit);
				}
				detail_log();
				insert_log($act);
				$this->db->trans_complete();
				set_flash_session('message',$ret['message']);
				$ret['error'] = 0;
			}
		}
		echo json_encode($ret);
	}

}

/*
 * End of file Change_pw.php
 * Location: ./application/controllers/Change_pw.php
 */