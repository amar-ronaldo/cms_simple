<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman email_tmp
 * @author 	Anisa Fitri <anisa@deptechdigital.com>
 * 
 */

class Email_tmp extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('Email_tmp_model');
	}


	function index(){
		$data['btn_add'] = btn_add();
		$data['list_status_publish'] = select_list(array('table'=>'ref_status_publish','title'=>'Select Status','id_ref_delete'=>0));

		render('apps/email-tmp/index',$data,'main-apps');
	}

	function records(){
		$data = $this->Email_tmp_model->records();
		foreach ($data['data'] as $key => $value) {
			$data['data'][$key]['slideshow_title'] 		= quote_form($value['slideshow_title']);
			$data['data'][$key]['publish_date'] 	= iso_date($value['publish_date']);
			$data['data'][$key]['approval_level'] 	= $approval;
		}
		render('apps/email-tmp/records',$data,'blank');
	}
		

	function add($id=''){
		$lang_name = lang_data('name');
		if($id){
			$data = $this->Email_tmp_model->findById($id);
			if(!$data){
				die('404');
			}
			$data['btn_process'] = btn_process(language('update',$lang_name));
		}
		else{
			$data['btn_process']      = btn_process(language('add',$lang_name));
			$data['id']            = '';
			$data['template_name'] = '';
			$data['subject']       = '';
			$data['code']          = '';
			$data['name']          = '';
			$data['page_content']  = '';
		}

		$data['list_status_publish'] = select_list(array('table'=>'ref_status_publish','title'=>language('select_status_publish', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_status_publish']));
		$data['list_language'] = select_list(array('table'=>'ref_language','title'=>language('select_language', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_language']));
		
		render('apps/email-tmp/add',$data,'main-apps');
	}
	
	function proses($idedit=''){
		$id_user =  id_user();
		$this->layout 			= 'none';
		$page_content 			= $this->input->post('page_content');
		$post 					= purify($this->input->post());
		$post['page_content']	= $page_content;
		$ret['error']			= 1;
		
		// $this->form_validation->set_rules('template_name', '"Template Name"', 'required'); 
		// $this->form_validation->set_rules('subject', '"Subject"', 'required'); 
		// $this->form_validation->set_rules('page_content', '"Content"', 'required');
  //       $this->form_validation->set_rules('id_ref_status_publish', '"Status Publish"', 'required'); 

		// if ($this->form_validation->run() == FALSE){
		// 	$ret['message']  = validation_errors(' ',' ');
		// }
		// else{   
			$this->db->trans_start();
			$post['page_content'] = urldecode($post['page_content']);
			$post['page_content'] = str_replace(
						array('%7B', '%7D'), 
						array('{', '}'), 
						$post['page_content']
					    );
				if($idedit){
                    auth_update();
					$ret['message'] = 'Update Success';
					$act			= "Update Email Template";
					$this->Email_tmp_model->update($post,$idedit);
				}
				else{
					auth_insert();
					$ret['message'] = 'Insert Success';
					$act			= "Insert News";
					$idedit = $this->Email_tmp_model->insert($post);
				}
			$this->db->trans_complete();
			set_flash_session('message',$ret['message']);
			$ret['error'] = 0;
		// }
		echo json_encode($ret);
	}

	function del(){
		$this->db->trans_start();   
		$id = $this->input->post('iddel');
		$this->Email_tmp_model->delete($id);
		$this->db->trans_complete();
	}
}

/* End of file email_tmp.php */
/* Location: ./application/controllers/apps/email_tmp.php */