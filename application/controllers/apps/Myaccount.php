<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Controller untuk handle halaman ubah profil akun
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Myaccount extends CI_Controller {
	
	function __construct(){
		parent::__construct();
        $this->load->model('Auth_user_model');
	}

	function index(){
		$user_sess = $this->session->userdata('ADM_SESS');
		if(!$user_sess){
        	redirect('apps/login');
		}
		$data                        = $this->Auth_user_model->findById($user_sess['admin_id']);
		$data['list_auth_group']     = select_list(array('table'=>'ref_auth_user_group','title'=>language('select_auth_group', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_auth_user_group']));
		$data['list_genders']        = select_list(array('table'=>'ref_gender','title'=>language('select_gender', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_gender']));
		$img_thumb                   = image($data['img'],'small');
		$imagemanager                = imagemanager('img',$img_thumb);
		$data['img']                 = $imagemanager['browse'];
		$data['imagemanager_config'] = $imagemanager['config'];
		render('apps/myaccount/add',$data,'main-apps');
	}

	function process($idedit=''){
		$this->layout 	= 'none';
		$post 			= purify($this->input->post());
		$ret['error']	= 1;
		$this->form_validation->set_rules('fullname', 'Full name', 'required');
		$this->form_validation->set_rules('id_ref_gender', 'Gender', 'required');
		$this->form_validation->set_rules('phone', 'Phone Number', 'required');
		$this->form_validation->set_rules('email', 'Email', 'required|valid_email'); 
		if ($this->form_validation->run() == FALSE){
			$ret['message']  = validation_errors(' ',' ');
		} else {
			$this->db->trans_start();   
			if($idedit){
				auth_update();
				if(!$post['img']){
					unset($post['img']);
				}
				$ret['message'] = 'Update Success';
				$act			= "Update Myaccount";
				$this->Auth_user_model->update($post,$idedit);
				update_profile_session($idedit);
			}
			detail_log();
			insert_log($act);
			$this->db->trans_complete();
			set_flash_session('message',$ret['message']);
			$ret['error'] = 0;
		}
		echo json_encode($ret);
	}

}

/*
 * End of file Myaccount.php
 * Location: ./application/controllers/Myaccount.php
 */