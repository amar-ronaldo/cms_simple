<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Controller untuk handle halaman login
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Login extends CI_Controller {
	
	function __construct(){
		parent::__construct();
	}

	function index(){
		$lang_name 			= lang_data('name');
		$data['title_page'] = language('login_page',$lang_name);
		render('apps/login/login',$data,'main-login');
	}

	function check_login(){
        $this->load->model('Auth_user_model');
		$ret['error'] = 1;
		$post = $this->input->post();
		if($post){
        	$check = $this->Auth_user_model->check_login($post['username'],$post['password']);
        	if($check['status']==1){ // success
        		$ret['redirect']= $check['redirect'];
				$ret['error'] 	= 0;
        		$ret['msg'] 	= $check['msg'];
        	} else { // error
        		$ret['msg'] = $check['msg'];
        	}
		} else {
			$lang_name 	= lang_data('name');
			$ret['msg'] = language('userid_pw_required',$lang_name);
		}
		echo json_encode($ret);exit;
	}

	function request_forgot_pw(){
		$lang_name 	= lang_data('name');
		$post 		= $this->input->post();
		if($post){
			$ret['error'] = 1;
        	$this->load->model('Auth_user_model');
			$email = $post['email'];
        	$check = $this->Auth_user_model->findBy(array('email'=>$email),1);
        	if(!$check){
        		$ret['msg'] = language('email_not_registered',$lang_name);;
        	} else {
        		$button_title 		= language('change_pw',$lang_name);
        		$base_url 			= base_url();
        		$activation_code 	= md5(date('Y-m-d H:i:s').'-'.$email.'-'.$check['id']);
        		$content_sent = array(
        			'fullname' => $check['fullname'],
        			'click_btn' => "<a href='".$base_url."change-password/$activation_code' class='btn-click'>$button_title</a>",
        		);
        		$this->Auth_user_model->update(array('activation_code'=>$activation_code),$check['id']);
	            $send_email 	= sent_email_with_template('RFP',$content_sent,$email);
				$ret['error'] 	= 0;
	            $ret['msg'] 	= language('success_request_forgot_pw',$lang_name);
        	}
			echo json_encode($ret);exit;
		}
		$data['have_an_account'] 	= have_an_account_login_here();
		$data['title_page'] 		= language('request_forgot_pw_page',$lang_name);
		render('apps/login/request-forgot-pw',$data,'main-login');
	}

	function change_pw($change_code=''){
		$lang_name 	= lang_data('name');
		if($change_code){
        	$this->load->model('Auth_user_model');
        	$check = $this->Auth_user_model->findBy(array('activation_code'=>$change_code),1);
        	if($check){
				$post = $this->input->post();
				if($post){
					$ret['error'] 	= 1;
					$new_pass		= $post['password'];
					$re_type		= $post['re_password'];
		        	
					$old_pass 	= md5($post['old_pass']);

					if(strtolower($re_type)!=strtolower($new_pass)){
						$ret['msg'] = language('retype_pw_doesnt_match',$lang_name);
					} else if(strlen($new_pass)<MIN_LENGTH_PASS){
						$ret['msg'] = language('min_pw',$lang_name);
					} else {
		        		$base_url 		= base_url();
		        		$button_title 	= language('login',$lang_name);
		        		$content_sent 	= array(
		        			'fullname' => $check['fullname'],
		        			'click_btn' => "<a href='".$base_url."apps/login' class='btn-click'>$button_title</a>",
		        		);
        				$this->Auth_user_model->update(array('password'=>md5($new_pass),'activation_code'=>NULL),$check['id']);
			            $send_email 	= sent_email_with_template('SCP',$content_sent,$check['email']);
						$ret['error'] 	= 0;
			            $ret['msg'] 	= language('success_change_pw',$lang_name);
					}
					echo json_encode($ret);exit;
				}
        		$form 	= form_change_pw($change_code);
        	} else {
        		$notif 	= language('request_code_not_valid',$lang_name);
        		$form 	= form_change_pw('',$notif);
        	}
			$data['form']	= $form;
		} else { // change code is not empty
    		$notif 			= language('request_code_not_valid',$lang_name);
			$form 			= form_change_pw('',$notif);
			$data['notif'] 	= language('request_code_empty',$lang_name);
			$data['form']	= $form;
		}
		$data['title_page'] = language('change_pw_page',$lang_name);
		render('apps/login/change-pw',$data,'main-login');
	}

	function logout(){
		$user_sess_data = $this->session->userdata('ADM_SESS');
		if($user_sess_data){
			$data['ip'] 		    = $_SERVER['REMOTE_ADDR'];
	    	$data['activity']       = 'Logout';
	    	$data['id_ref_auth_user']   = $user_sess_data['admin_id'];
	    	$access_log = access_log_user($data);
        	$this->session->sess_destroy();

	        $this->load->model('Login_transaction_model');
	        $this->Login_transaction_model->update($data['id_ref_auth_user'],array('lock_date'=>$access_log['log_date'],'id_ref_active'=>2), array('ip_address'=>$data['ip']));
		}
        redirect('apps/login');
	}
	
}

/*
 * End of file Login.php
 * Location: ./application/controllers/Login.php
 */