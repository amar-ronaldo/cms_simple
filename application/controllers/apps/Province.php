<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Controller untuk menghandle modul province
 * @author 	Anisa Fitri <anisa@deptechdigital.com>
 * 
 */

class Province extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('Province_model');
	}

	function index(){
		$data['btn_add'] = btn_add();
		render('apps/province/index',$data,'main-apps');
	}

	function records(){
		$data = $this->Province_model->records();
		render('apps/province/records',$data,'blank');
	}

	function add($id = '')
    {
        if ($id)
        {
            $data = $this->Province_model->findById($id);
            if (!$data)
            {
                die('404');
            }

            $data                   = quote_form($data);
            $data['judul']          = 'Sunting';
            $data['proses']         = 'Update';
            // $data['page_name_data'] = $data['page_name'];
        	$data['btn_process'] 	= btn_process(language('update',$lang_name));
		} else {
			$data['btn_process']           = btn_process(language('add',$lang_name));
			$data['judul']                 = 'Tambah';
			$data['proses']                = 'Simpan';
			$data['code_prov']               = '';
			$data['code_province']         = '';
			$data['name']                  = '';
			$data['id_ref_status_publish'] = '';
			$data['modify_date']           = date("m/d/Y g:i A", strtotime(date('h:i')));
			$data['id']           = '';
			// $data['uri_path']              = '';
        }

        $img_thumb                      = image($data['img'],'small');
        $imagemanager                   = imagemanager('img',$img_thumb,277,150);
        $data['img']                    = $imagemanager['browse'];
        $data['imagemanager_config']    = $imagemanager['config'];

        $data['list_status_publish'] = select_list(array('table'=>'ref_status_publish','title'=>language('select_status_publish', $lang_name),'selected'=>$data['id_ref_status_publish']));

        render('apps/province/add', $data, 'main-apps');
    }
	function process($idedit=''){
		$this->layout 	= 'none';
		$post 			= purify($this->input->post());
		$ret['error']	= 1;
		$lang_name 		= lang_data('name');
		$this->form_validation->set_rules('code_prov', language('cd_province',$lang_name), 'required');
		$this->form_validation->set_rules('code_province', language('code_province',$lang_name), 'required'); 
		$this->form_validation->set_rules('name', language('name',$lang_name), 'required'); 
		// $this->form_validation->set_rules('name', language('name',$lang_name), 'required'); 
		// $this->form_validation->set_rules('teaser', language('teaser',$lang_name), 'required'); 
		if ($this->form_validation->run() == FALSE){
			$ret['message']  = validation_errors(' ',' ');
		} else {
			$this->db->trans_start();   
			if($idedit){
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update Auth Group";
				$this->Province_model->update($post,$idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert Auth Group";
				$this->Province_model->insert($post);
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
        $data   = $this->Province_model->delete($id);
        detail_log();
        insert_log("Delete Auth Group");
	}

	function select_pages(){
		$data = $this->Province_model->records();
		render('apps/province/records-module',$data,'blank');
	}

}

/*
 * End of file Pages.php
 * Location: ./application/controllers/Pages.php
 */