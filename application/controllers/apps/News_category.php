<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman kategori news
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class News_category extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('News_category_model');
	}

	function index(){
		$data['btn_add'] 		= btn_add();
		$data['list_genders'] 	= select_list(array('table'=>'ref_gender','title'=>language('select_gender', $lang_name),'id_ref_delete'=>0));
		render('apps/news-category/index',$data,'main-apps');
	}

	function records(){
		$data = $this->News_category_model->records();
		render('apps/news-category/records',$data,'blank');
	}

	function add($id=''){
		$lang_name = lang_data('name');
		if($id){
			$data = $this->News_category_model->findById($id);
			
			if(!$data){ die('404'); } // data not found

			$data['btn_process'] = btn_process(language('update',$lang_name));
		} else {
			$data['btn_process'] = btn_process(language('add',$lang_name));
			$data['id']          = '';
			$data['name']        = '';
			$data['uri_path']    = '';
		}

		$img_thumb                   = image($data['img'],'small');
		$imagemanager                = imagemanager('img',$img_thumb);
		$data['img']                 = $imagemanager['browse'];
		$data['imagemanager_config'] = $imagemanager['config'];
		$data['list_language']       = select_list(array('table'=>'ref_language','title'=>language('select_language', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_language']));
		render('apps/news-category/add',$data,'main-apps');
	}

	function process($idedit=''){
		$this->layout      = 'none';
		$post              = purify($this->input->post());
		$ret['error']      = 1;
		$where['uri_path'] = $post['uri_path'];

		if($idedit){
			$where['id !=']		= $idedit;
		}

		$unik = $this->News_category_model->findBy($where);
		$this->form_validation->set_rules('name', '"Group Name"', 'required'); 
		$this->form_validation->set_rules('uri_path', '"Uri Path Name"', 'required'); 
		if ($this->form_validation->run() == FALSE){
			$ret['message']  = validation_errors(' ',' ');
		} else if($unik){
			$ret['message']	= "Page URL $post[uri_path] already taken";
		} else {
			$this->db->trans_start();   
			if($idedit){
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update News Category";
				$this->News_category_model->update($post,$idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert News Category";
				$this->News_category_model->insert($post);
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
        $data   = $this->News_category_model->delete($id);
        detail_log();
        insert_log("Delete News Category");
	}
	
}

/*
 * End of file News_category.php
 * Location: ./application/controllers/News_category.php
 */