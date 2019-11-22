<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Controller untuk handle halaman home
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Pages extends CI_Controller {
	
	function detail($uri_path){
		$this->load->model('Pages_model');
		$data = $this->Pages_model->findBy([
			'uri_path'=>$uri_path,
			'id_ref_delete'=> 0
		],1);
		
		if (!$data) {
			return $this->$uri_path();exit;
			show_404();
		}
		$data['content'] = $data['page_content'];
		render_front('layout/blank',$data,'main-front');
	}
	function contact()
	{
		render_front('front/contact/index', [], 'main-front');
	}
	function proses_contact()
	{
		$data = $this->input->post();
		
		print_r(
			$data);
		exit;
	}
}

/*
 * End of file Home.php
 * Location: ./application/controllers/Home.php
 */