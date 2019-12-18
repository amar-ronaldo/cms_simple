<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Controller untuk handle halaman home
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Akreditasi  extends CI_Controller
{

	function index()
	{
		render_front('front/akreditasi/index', [], 'main-front');
	}

	public function records()
	{
		$this->load->model('akreditasi_model');

		$this->db->order_by('kurun_waktu_awal', 'desc');
		$data = $this->akreditasi_model->findBy();
		
		if (!$data) {
			show_404();
		}
		foreach ($data as $key => &$value) {
			$value['title'] = str_replace(PHP_EOL, "<br>", $value["title"]);
			$value['file'] = '<a href="' . $value['file'] . '" target="_blank"><i class="fa fa-download"></i> &nbsp; Dokumen</a>';
			$value['kurun_waktu'] = iso_date_custom_format($value['kurun_waktu_awal'], 'd F Y') . ' s.d. ' . iso_date_custom_format($value['kurun_waktu_akhir'], 'd F Y');
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
