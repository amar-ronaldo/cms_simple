<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman user
 * @author 	Anisa Fitri <anisa@deptechdigital.com>
 * 
 */

class Auth_user extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->layout = 'none';
		$this->load->model('Auth_user_model');
	}

	function index(){
		$data['btn_add'] 		= btn_add();
		$data['list_grup']  = select_list(
										array('table'=>'ref_auth_user_group',
											 'title'=>language('select_group', $lang_name),
											 'where'=>array('id_ref_delete'=>0)
										     )
										);
		$data['list_genders']  = select_list(
										array('table'=>'ref_gender',
											 'title'=>language('select_gender', $lang_name),
											 'where'=>array('id_ref_delete'=>0)
										     )
										);

		render('apps/auth-user/index',$data,'main-apps');
	}

	function records() {
		$data = $this->Auth_user_model->records();
		$from_auth_group = $_SERVER['HTTP_REFERER'];
		if (strpos($from_auth_group, 'auth_group') !== false) {
		   $hide = 'hide';
		} else {
		   $hide = 'hide';
		}
		foreach ($data['data'] as $key => $value) {
			$data['data'][$key]['hide_group_name'] = $hide;
		}
		render('apps/auth-user/records',$data,'blank');
	}

	public function add($id=''){
		$lang_name = lang_data('name');
		if($id){
			$data = $this->Auth_user_model->findById($id);
			if(!$data){
				die('404');
			}
			$data['btn_process'] = btn_process(language('update',$lang_name));
			$data['label_required_pass'] = 'hidden';
			$data['required_pass']       = 'false';
		}
		else{
			$data['btn_process']      = btn_process(language('add',$lang_name));
			$data['id']                     = '';
			$data['id_ref_auth_user_group'] = '';
			$data['id_ref_gender']          = '';
			$data['fullname']               = '';
			$data['username']               = '';
			$data['email']                  = '';
			$data['phone']                  = '';
		}

		$data['list_group']  = select_list(
										array('table'=>'ref_auth_user_group',
											 'title'=>language('select_group', $lang_name),
											 'selected' => $data['id'],
											 'where'=>array('id_ref_delete'=>0)
										     )
										);
		$data['list_genders'] 	=   select_list(
										array('table'=>'ref_gender',
											  'title'=>language('select_gender', $lang_name),
											  'id_ref_delete'=>0,
											  'selected'=>$data['id_ref_gender'])
									);


		render('apps/auth-user/add',$data,'main-apps');
	}

	function process(){
		$post 					= $this->input->post();

		$idedit					= $this->uri->segment(4);
		$ret['error']			= 1;

		$this->form_validation->set_rules('username', 'User Name', 'required');
		$this->form_validation->set_rules('id_ref_auth_user_group', 'Group', 'required');
		$this->form_validation->set_rules('email', 'Email', 'required|valid_email');
		
		if ($this->form_validation->run() == FALSE){
			$ret['message']  = validation_errors(' ',' ');
		}
		else{
			$this->db->trans_start(); 
			$where 				= ($idedit) ? "and id not in ($idedit)" : '';

			$cek_code 			= db_get_one('ref_auth_user',"username","username = '".$post['username']."' and id_ref_delete = 0 $where");
			if($cek_code){
				$ret['error']			= 1;
				$ret['message']			=  " Username $post[account_name] already exist";
				echo json_encode($ret);
				exit;
			}

			if($idedit){
				$ret['message'] = 'Update Success';
				$act			= "Update User";
				$this->Auth_user_model->update($post,$idedit);
			}
			else{
				// $post['code_activation'] = uniqid();
				$post['password'] = generate_password();

				$ret['message'] = 'Insert Success';
				$act			= "Insert User"; 
				$this->Auth_user_model->insert($post); 
				// kirim email aktivasi 
				// $data_sent = array(
				//     'username'=> $post['username'],
				//     'userid'  => $post['userid'],
				//     'userpass'=> $userpass_real,
				//     'link'=> base_url().'activation/'.$post['code_activation'],
				// );
				// $mail_tpt = mail_tpt(4,$data_sent);

				// $email = $post['email'];
				
				// $conf['subject'] = $mail_tpt['judul'];
				// $conf['content'] = $mail_tpt['content'];
				// $conf['to']      = $email;   
				// sent_mail($conf);
			}
			detail_log();
			insert_log($act);
			$this->db->trans_complete();
			$this->session->set_flashdata('message',$ret['message']);
			$ret['error'] = 0;
		}
		echo json_encode($ret);
	}
	function del(){
		auth_delete();
		$post		= $this->input->post();
		$iddel	= $post['iddel'];
		if ($iddel == 1){
			echo 'User Administrator Tidak Dapat Dihapus';
		}
		else{
			$id = $this->input->post('iddel');
			$this->Auth_user_model->delete($iddel);
			detail_log();
        	insert_log("Delete Auth User");
		}
	}

	function check_username(){
		$post         = $this->input->post();
		$lang_name    = lang_data('name');
		$ret['error'] = 1;
		if($post){
			if(strlen($post['username'])<MIN_USERNAME){ // less than 7 characters
				$ret['msg'] = language('minimum_username',$lang_name);
			} else {
				$check = check_username($post['username']);
				if($check==1){ // username does
					$ret['msg'] = language('username_does',$lang_name);
				} else { // doesnt
					$ret['error'] = 0;
					$ret['msg']   = language('success',$lang_name);
				}
			}
		} else {
			$ret['msg'] = language('username_empty',$lang_name);
		}
		echo json_encode($ret);exit;
	}

}
