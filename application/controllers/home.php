<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Controller untuk handle halaman home
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Home extends CI_Controller {
	
	function index(){
		$lang_name = lang_data('name');
		echo language('go_to_cms_login',$lang_name);exit;
		$data['home'] = 'home';
		render('home',$data);
	}

}

/*
 * End of file Home.php
 * Location: ./application/controllers/Home.php
 */