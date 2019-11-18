<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman news
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Sejarah extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('News_model');
	}

	function index(){
		$this->add(10);
	}
	function add($id=''){
		$lang_name = lang_data('name');
		if($id){
			$data = $this->News_model->findById($id);
			
			if(!$data){ die('404'); } // data not found

			$data['btn_process'] = btn_process(language('update',$lang_name));

		} else {
			$data['btn_process']      = btn_process(language('add',$lang_name));
			$data['id']               = '';
			$data['name']             = '';
			$data['uri_path']         = '';
			$data['title']            = '';
			$data['teaser']           = '';
			$data['publish_date']     = date('Y-m-d');
			$data['page_content']     = '';
			$data['seo_title']        = '';
			$data['meta_description'] = '';
			$data['meta_keywords']    = '';
			$data['youtube_link']     = '';
		}


		$img_thumb                   = image($data['img'],'small');
		$imagemanager                = imagemanager('img',$img_thumb);
		$data['img']                 = $imagemanager['browse'];
		$data['imagemanager_config'] = $imagemanager['config'];

		$imagemanager                = imagemanager('img_multi[]',$img_thumb);
		$data['img_multi']			= $imagemanager['browse'];
		$this->load->model('News_image_model');

		$data_img_multi = $this->News_image_model->findById($data['id']);
		$data['data_img_multi'] = json_encode($data_img_multi);



		$data['list_language']      = select_list(array('table'=>'ref_language','title'=>language('select_language', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_language'],'where'=>"id_ref_delete='0'"));
		$data['list_status']        = select_list(array('table'=>'ref_status_publish','title'=>language('select_status', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_status_publish'],'where'=>"id_ref_delete='0'"));

		render('apps/sejarah/add',$data,'main-apps');
	}

	function process($idedit=''){
		$this->layout      = 'none';
		$post              = purify($this->input->post());
		$ret['error']      = 1;
		$where['a.uri_path'] = $post['uri_path'];
		
		if($idedit){
			$where['a.id !='] = $idedit;
		}
		
		
		$unik = $this->News_model->findBy($where);
		$this->form_validation->set_rules('title', '"Group Name"', 'required'); 
		$this->form_validation->set_rules('teaser', '"Teaser"', 'required'); 
		$this->form_validation->set_rules('page_content', '"Page Content"', 'required'); 
		if ($this->form_validation->run() == FALSE){
			$ret['message'] = validation_errors(' ',' ');
		} else if($unik){
			$ret['message']	= "Page URL $post[uri_path] already taken";
		} else {
			
			$this->db->trans_start();   
			$img_multi = array_filter($post['img_multi']);
			
			unset($post['img_multi']);
			if($idedit){
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update News";
				$this->News_model->update($post,$idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert News";
				$idedit = $this->News_model->insert($post);
			}
			$this->load->model('News_image_model');
			
			if ($img_multi) {
				$this->News_image_model->insert_all($idedit, $img_multi);
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
 * End of file News.php
 * Location: ./application/controllers/News.php
 */