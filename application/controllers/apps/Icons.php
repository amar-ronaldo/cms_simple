<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Controller untuk menampilkan icon-icon pada template yg baru ini
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Icons extends CI_Controller {
	
	function __construct(){
		parent::__construct();
	}

	function index(){
		render('apps/myaccount/icons-view','','main-apps');
	}

}

/*
 * End of file Icons.php
 * Location: ./application/controllers/Icons.php
 */