<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman tags
 * @author 	Anisa Fitri <anisa@deptechdigital.com>
 * 
 */

class Tags extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('Tags_model');
	}

	function index(){
		$data['btn_add'] = btn_add();
		render('apps/tags/index',$data,'main-apps');
	}

	function records(){
		$data = $this->Tags_model->records();
		render('apps/tags/records',$data,'blank');
	}

	function add($id='',$foreign_controller=0){
		$lang_name = lang_data('name');
		if($id){
			$data = $this->Tags_model->findById($id);
			
			if(!$data){ die('404'); } // data not found

			$data['btn_process'] = btn_process(language('update',$lang_name));
		} else {
			$data['btn_process'] = btn_process(language('add',$lang_name));
			$data['name']        = '';
			$data['uri_path']    = '';
			$data['id']          = '';
		}
		$data['foreign_controller'] = $foreign_controller;
		render('apps/tags/add',$data,'main-apps');
	}

	function process($idedit=''){
		$this->layout        = 'none';
		$post                = purify($this->input->post());
		$ret['error']        = 1;
		$where['a.uri_path'] = $post['uri_path'];

		if($idedit){
			$where['a.id !='] = $idedit;
		}

		$unik = $this->Tags_model->findBy($where);
		$this->form_validation->set_rules('name', '"Tag Name"', 'required'); 
		$this->form_validation->set_rules('uri_path', '"Tag Uri Path"', 'required'); 
		if ($this->form_validation->run() == FALSE){
			$ret['message'] = validation_errors(' ',' ');
		} else if($unik){
			$ret['message']	= "Page URL $post[uri_path] already taken";
		} else {
			$foreign_controller = $post['foreign_controller'];
			unset($post['foreign_controller']);
			$this->db->trans_start();   
			if($idedit){
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update Tags";
				$this->Tags_model->update($post,$idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert Tags";
				$idedit = $this->Tags_model->insert($post);
			}

			if($foreign_controller!='0'){
				print_r("expression");exit;
        		redirect(base64_decode($foreign_controller));
			} else {
				print_r("expression123");exit;
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
        $data   = $this->Tags_model->delete($id);
        detail_log();
        insert_log("Delete Tags");
	}

}

/*
 * End of file Tags.php
 * Location: ./application/controllers/apps/Tags.php
 */