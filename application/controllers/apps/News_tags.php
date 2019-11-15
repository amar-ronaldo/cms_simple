<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman news tag
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class News_tags extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('News_tags_model');
	}

	function index(){
		render('apps/news-tags/index',$data,'main-apps');
	}

	function records(){
		$data = $this->News_tags_model->records();
		foreach ($data['data'] as $key => $value) {
			$data['data'][$key]['foreign_controller'] = base64_encode('news_tags/index');
		}
		render('apps/news-tags/records',$data,'blank');
	}

}

/*
 * End of file News_tags.php
 * Location: ./application/controllers/News_tags.php
 */