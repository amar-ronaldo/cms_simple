<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk menghandle modul frontend menu
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Frontend_menu extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('Frontend_menu_model');
	}

	function index(){
		$data['btn_add'] = btn_add();
		render('apps/frontend-menu/index',$data,'main-apps');
	}
	
	function add($id=''){
		$lang_name = lang_data('name');

		if($id){
			$data = $this->Frontend_menu_model->findById($id);

			if(!$data){ die('404'); } // data not found

			switch ($data['id_ref_frontend_menu_type']) {
				case '1': // modul
					$data['hide_module']      = '';
					$data['hide_extra_param'] = 'hide';
					break;
				case '2': // modul
					$data['hide_module']      = 'hide';
					$data['hide_extra_param'] = '';
					break;
				default: // extra param
					$data['hide_module']      = 'hide';
					$data['hide_extra_param'] = 'hide';
					break;
			}

			$data['btn_process']  = btn_process(language('update',$lang_name));
			$data['publish_date'] = date('Y-m-d', strtotime($data['publish_date']));
		} else {
			$data['btn_process']      = btn_process(language('add',$lang_name));
			$data['name']             = '';
			
			$data['teaser']           = '';
			$data['page_content']     = '';
			$data['extra_param']      = '';
			$data['name']             = '';
			$data['seo_title']        = '';
			$data['meta_description'] = '';
			$data['meta_keywords']    = '';
			$data['description']      = '';
			$data['publish_date']     = date('Y-m-d');
			$data['hide_module']      = 'hide';
			$data['hide_extra_param'] = 'hide';
			$data['id']               = '';
		}


		$img_thumb						= image($data['img'],'small');
		$imagemanager					= imagemanager('img',$img_thumb);
		$data['img']					= $imagemanager['browse'];
		$data['imagemanager_config'] 	= $imagemanager['config'];
		
		$data['list_menu_position'] 		= select_list(array('table'=>'menu_position','title'=>language('menu_position', $lang_name),'selected'=>$data['id_menu_position']));
		$data['list_parent'] 				= select_list(array('table'=>'frontend_menu','title'=>language('parent_menu', $lang_name),'selected'=>$data['id_parent']));
		$data['list_frontend_menu_type'] 	= select_list(array('table'=>'ref_frontend_menu_type','title'=>language('frontend_menu_type', $lang_name),'selected'=>$data['id_ref_frontend_menu_type'],'not_where'=>1));
		$data['list_status_publish']		= select_list(array('table'=>'ref_status_publish','title'=>language('status_publish', $lang_name),'selected'=>$data['id_ref_status_publish']));
		

		$data['list_languages'] 			= select_list(array('table'=>'ref_language','title'=>language('select_language', $lang_name),'selected'=>$data['id_ref_language'],'where'=>"id_ref_delete='0'"));

		$data['list_module']			 	= select_list(array('table'=>'ref_module','title'=>language('select_module', $lang_name),'selected'=>$data['id_ref_module'],'custome'=>'controller'));

		$data['grid_modules'] = $this->get_modules();
		render('apps/frontend-menu/add',$data,'main-apps');
	}

	function get_modules(){
		$this->load->model('Module_model');
		$module = $this->Module_model->findBy();
		foreach ($module as $key => $value) {
			$data .= module_detail($value['controller'],$value['callback']);
		}
		return $data;
	}
	
	function view($id=''){
		if($id){
			$data = $this->Frontend_menu_model->findById($id);
			$data['img_thumb'] = image($data['img'],'small');
			$data['img_ori'] =image($data['img'],'ori'); 
			if(!$data){
				die('404');
			}
			$data['page_name'] = quote_form($data['page_name']);
			$data['teaser'] = quote_form($data['teaser']);
		}
		render('apps/frontend-menu/view',$data,'main-apps');
	}

	function records(){
		$data = $this->Frontend_menu_model->records();
		foreach ($data['data'] as $key => $value) {
			$data['data'][$key]['publish_date'] = iso_date($value['publish_date']);
		}
		render('apps/frontend-menu/records',$data,'blank');
	}	
	
	function process($idedit=''){
		$this->layout      = 'none';
		$post              = purify($this->input->post());
		$ret['error']      = 1;
		$where['uri_path'] = $post['uri_path'];
		if($idedit){
			$where['id !=']= $idedit;
		}
		// $unik 					= $this->Frontend_menu_model->findBy($where);
		
		switch ($data['id_frontend_menu_type']) {
			case '1': // modul
				$this->form_validation->set_rules('id_ref_module', '"Module"', 'required'); 
				break;
			case '2': // extra param
				$this->form_validation->set_rules('extra_param', '"URL"', 'required'); 
				break;
			default: // no choice
				break;
		}
			
		$this->form_validation->set_rules('name', '"Menu Name"', 'required'); 
		$this->form_validation->set_rules('id_menu_position', '"Position"', 'required'); 
		$this->form_validation->set_rules('id_ref_frontend_menu_type', '"Menu Type"', 'required'); 
		$this->form_validation->set_rules('id_ref_status_publish', '"Status Publish"', 'required'); 
		if ($this->form_validation->run() == FALSE){
			$ret['message']  = validation_errors(' ',' ');
		}
		// else if($unik){
		// 	$ret['message']	= "Page URL $post[uri_path] already taken";
		// }
		else{   
			if(empty($post['id_parent'])){
				unset($post['id_parent']);
			}
			$this->db->trans_start();   
			$post['publish_date']     = date('Y-m-d',strtotime($post['publish_date'])).' 00:00:00';
			$post['description']      = htmlspecialchars_decode(urldecode($post['description']));
			$post['meta_description'] = htmlspecialchars_decode(urldecode($post['meta_description']));
			if($idedit){
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update Frontend Menu";
				if(!$post['img']){
					unset($post['img']);
				}
				$this->Frontend_menu_model->update($post,$idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert Frontend Menu";
				$this->Frontend_menu_model->insert($post);
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
		$id = $this->input->post('iddel');
		$this->Frontend_menu_model->delete($id);
		detail_log();
		insert_log("Delete Frontend menu");
	}

	function get_callback($id=0){
		echo db_get_one('module','callback',array('id'=>$id));
	}

	function get_module_detail(){
		$lang_name    = lang_data('name');
		$post         = $this->input->post();
		$ret['error'] = 1;
		if($post){
			$ref_module_id = $post['ref_module_id'];
			$selected      = search_module_by_id($ref_module_id);
			
			$ret['data']   = module_detail($selected['controller'],$selected['callback']);
			$ret['error']  = 0;
			$ret['msg']    = language('no_module_selected',$lang_name);
		} else {
			$ret['msg'] = language('success',$lang_name);
		}
		echo json_encode($ret);exit;
	}

}

/* End of file Frontend_menu.php */
/* Location: ./aplikasi/controllers/apps/Frontend_menu.php */