<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Controller untuk handle halaman home
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Dosen extends CI_Controller {
	var $id_dosen;
	
	public function __construct()
	{
		parent::__construct();
		$this->id_dosen = $this->session->userdata('detail_id_dosen');
	}
	
	function index($uri_path_category)
	{
		$this->load->model('dosen_model');
		$this->load->model('Pages_model');
		$data_page = $this->Pages_model->findBy([
			'uri_path' => 'staf-dosen-'.$uri_path_category,
			'id_ref_delete' => 0
		], 1);
		if (!$data_page) {
			return $this->$uri_path_category();exit;
		}
		$data['dosen_title'] = $data_page['teaser'];
		$data['dosen_desc'] = $data_page['page_content'];
		
		$get = $this->input->get();

		$page = $get['page']  ? $get['page']  : 0;
		$this->db->limit(4, $page * 4);

		$data['list_item'] = $this->dosen_model->findBy([
			'b.uri_path' => $uri_path_category
		]);
		if (!$data['list_item']) {
			show_404();
		}
		foreach ($data['list_item'] as $key => &$value) {
			$value['img'] = image($value['img'],'small');				
			$value['link'] = base_url('dosen/detail/').$value['uri_path_category'].'/'.$value['uri_path'];
		}

		$this->db->limit(4, ($page + 1) * 4);
		$check = $this->dosen_model->findBy([
			'b.uri_path' => $uri_path_category
		]);
		$uri_path_category = $data['list_item'][0]['uri_path_category'] ? $data['list_item'][0]['uri_path_category'] : '-';
		$data['more']  = $check ? '' : 'hide';
		$data['link_more']  = $check ? base_url('dosen/detail/'). $uri_path_category.'?=page='.$page : '#';

		$ret['name']  = $data['list_item'][0]['category'];

		$ret['content'] = render_front('front/dosen/list_item', $data,'blank',true);
		if ($get) {
			echo $ret['content_dosen'];exit;
		}else{
			return  render_front('front/dosen/index', $ret,'main-front');
		}
	}
	function detail($uri_path_category,$uri_path){
		$this->load->model('dosen_model');
		$data = $this->dosen_model->findBy([
			'a.uri_path'=>$uri_path,
			'b.uri_path'=> $uri_path_category
		],1);
		if (!$data) {
			show_404();
		}
		
		$this->session->set_userdata(['detail_id_dosen'=>$data['id']]);
		
		
		
		
		
		$data['pangkat_date'] = iso_date_custom_format($data['pangkat_date'],'d F Y');
		$data['img'] = image($data['img'],'large');
		render_front('front/dosen/detail', $data,'main-front');
	}
	public function records_buku()
	{
		$this->load->model('dosen_model');
		$data = $this->dosen_model->records_buku($this->id_dosen);
		if (!$data) {
			echo \json_encode(['data' => []]);exit;
		}
		$ret['data'] = $data;
		echo \json_encode($ret);exit;
	}
	public function records_jurnal()
	{
		$this->load->model('dosen_model');
		$data = $this->dosen_model->records_jurnal($this->id_dosen);
		if (!$data) {
			echo \json_encode(['data' => []]);exit;
		}
		$ret['data'] = $data;
		echo \json_encode($ret);exit;
	}
	public function records_karya()
	{
		$this->load->model('dosen_model');
		$data = $this->dosen_model->records_karya($this->id_dosen);
		if (!$data) {
			echo \json_encode(['data' => []]);exit;
		}
		$ret['data'] = $data;
		echo \json_encode($ret);exit;
	}
	public function records_kegiatan_ilmiah()
	{
		$this->load->model('dosen_model');
		$data = $this->dosen_model->records_kegiatan_ilmiah($this->id_dosen);
		if (!$data) {
			echo \json_encode(['data' => []]);exit;
		}
		$ret['data'] = $data;
		echo \json_encode($ret);exit;
	}
	public function records_penelitian()
	{
		$this->load->model('dosen_model');
		$data = $this->dosen_model->records_penelitian($this->id_dosen);
		if (!$data) {
			echo \json_encode(['data' => []]);exit;
		}
		$ret['data'] = $data;
		echo \json_encode($ret);exit;
	}
	public function records_pengabdian()
	{
		$this->load->model('dosen_model');
		$data = $this->dosen_model->records_pengabdian($this->id_dosen);
		if (!$data) {
			echo \json_encode(['data' => []]);exit;
		}
		$ret['data'] = $data;
		echo \json_encode($ret);exit;
	}
	public function records_penghargaan()
	{
		$this->load->model('dosen_model');
		$data = $this->dosen_model->records_penghargaan($this->id_dosen);
		if (!$data) {
			echo \json_encode(['data' => []]);exit;
		}
		$ret['data'] = $data;
		echo \json_encode($ret);exit;
	}
	public function records_riwayat_mengajar()
	{
		$this->load->model('dosen_model');
		$data = $this->dosen_model->records_riwayat_mengajar($this->id_dosen);
		if (!$data) {
			echo \json_encode(['data' => []]);exit;
		}
		$ret['data'] = $data;
		echo \json_encode($ret);exit;
	}
	public function records_riwayat_pendidikan()
	{
		$this->load->model('dosen_model');
		
		$data = $this->dosen_model->records_riwayat_pendidikan($this->id_dosen);
		if (!$data) {
			echo \json_encode(['data' => []]);exit;
		}
		$ret['data'] = $data;
		echo \json_encode($ret);exit;
	}
}

/*
 * End of file Home.php
 * Location: ./application/controllers/Home.php
 */