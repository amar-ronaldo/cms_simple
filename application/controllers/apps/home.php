<?php defined('BASEPATH') OR exit('No direct script access allowed');


/**
 * Controller untuk handle halaman home
 * @author 	Anisa Fitri <anisa@deptechdigital.com>
 * 
 */


class Home extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('File_manager_model');
    }

	function index(){
		$data['home'] = 'home';
		render('home/home',$data,'main-apps');
	}

	function imagemanager(){
		$post 		= purify($this->input->post());
		$tglsearch 	= $post['searchDate'];
		$file 		= $_FILES;
		if($file){
			$file 	= $_FILES['img'];
	        $fname 	= $file['name'];
	        
			$maxFileSize = MAX_UPLOAD_SIZE_COSTUM * 1024 * 1024;
	        if(!is_writable(UPLOAD_DIR)){//kalo ga bisa upload
	            $ret['error']   = 1;
	            $ret['message'] = "Directory is readonly";
	        } else if($file['size']>=$maxFileSize){
				$ret['error']   = 1;
	            $ret['message'] = "Max File size is ".MAX_UPLOAD_SIZE_COSTUM." MB";
			} else if($fname){
	            $upload 			= upload_file('img','temp');
	            $ret['filename'] 	= base_url().UPLOAD_DIR_TEMP.$upload['file_name'];
	            $ret['file'] 		= $upload['file_name'];
				$ret['size'] 		= $upload['file_size'];
	            $ret['width'] 		= $upload['image_width'];
	            $ret['height'] 		= $upload['image_height'];
	            $ret['message'] 	= 'success';
	        }
	        echo json_encode($ret);exit;
		}

		if($post['id']){ //delete image
			$this->File_manager_model->delete($post['id'], array('id_ref_auth_user_modify'=>id_user(),'modify_date'=>date('Y-m-d H:i:s')));
		}

		$total_records 	= $this->File_manager_model->getTotal("(id_ref_auth_user_create = ".id_user() ." or is_public = 1) and name LIKE '%".$post['searchPicture']."%' and create_date LIKE '%".$tglsearch."%'");
		$per_page 		= 12;
		$data['pages'] 	= ceil($total_records/$per_page);
		$data['load'] 	= base_url().'apps/home/imagemanager';
		
		//sanitize post value
		if(isset($post['page'])){
			$page_number = filter_var($post["page"], FILTER_SANITIZE_NUMBER_INT, FILTER_FLAG_STRIP_HIGH);
			if(!is_numeric($page_number)){die('Invalid page number!');} //incase of invalid page number
		} else {
			$page_number = 1;
		}

		//get current starting point of records
		$offset = (($page_number-1) * $per_page);
		$data['list_data'] = $this->File_manager_model->getAll("(id_ref_auth_user_create = ".id_user() ." or is_public = 1) and name LIKE '%".$post['searchPicture']."%' and create_date LIKE '%".$tglsearch."%'", $per_page, $offset);
		render('apps/file-manager/filemanager',$data,'blank');
	}
	
	function imagemanager_save(){
		$post		= $this->input->post();
		$tmp 		= $_SERVER['DOCUMENT_ROOT'].$this->baseUrl.'external/'.$post['tmp'];
		$thumbs 	= UPLOAD_DIR.'small/'.$post['name'];
		$ori_tmp 	= UPLOAD_DIR.'temp/'.$post['name'];
		$ori 		= UPLOAD_DIR.'large/'.$post['name'];
		rename($tmp,$thumbs);
		rename($ori_tmp,$ori);
		unset($post['tmp']);

		if(UPLOAD_DIR_CONTENT_BACKUP){
			copy($thumbs,UPLOAD_DIR_CONTENT_BACKUP.'small/'.$post['name']);
			copy($ori,UPLOAD_DIR_CONTENT_BACKUP.'large/'.$post['name']);
		}
		$post['id_ref_auth_user_create'] = id_user();
		$this->File_manager_model->insert($post);
	}
}

/*
 * End of file Home.php
 * Location: ./application/controllers/Home.php
 */