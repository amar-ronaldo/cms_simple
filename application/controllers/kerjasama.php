<?php

use function GuzzleHttp\json_encode;

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Controller untuk handle halaman home
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Kerjasama extends CI_Controller {
	
	function index(){
		render_front('front/kerjasama/index',[],'main-front');
	}

	function records()
	{
		$this->load->model('Kerjasama_model');

		$this->db->order_by('kurun_waktu_awal', 'desc');
		
		$data = $this->Kerjasama_model->findBy();
		if (!$data) {
			show_404();
		}
		foreach ($data as $key => &$value)  {
			$value['kurun_waktu'] = $value['kurun_waktu_awal'] . " S/d ". $value['kurun_waktu_akhir'];
		}
		$ret['data'] = $data;
		echo \json_encode($ret);
		exit;
	}

}

/*
 * End of file Home.php
 * Location: ./application/controllers/Home.php
 */