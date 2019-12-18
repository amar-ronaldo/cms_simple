<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman dosen
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Dosen extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('dosen_model');
	}

	function index(){
		$lang_name                  = lang_data('name');
		$data['btn_add']            = btn_add_export();
		
		$data['list_dosen_category'] = select_list(array('table'=>'ref_dosen_category','title'=>'Dosen Category','id_ref_delete'=>0,'selected'=>$data['id_ref_dosen_category'],'where'=>"id_ref_delete='0'"));
		$data['list_status']        = select_list(array('table'=>'ref_status_publish','title'=>language('select_status', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_status_publish'],'where'=>"id_ref_delete='0'"));
		$data['list_dosen_status']        = select_list(array('table'=>'ref_dosen_status','title'=>'Pilih Status','id_ref_delete'=>0,'selected'=>$data['id_ref_dosen_status'],'where'=>"id_ref_delete='0'"));
		render('apps/dosen/index',$data,'main-apps');
	}
	
	function records(){
	
		$data = $this->dosen_model->records();
		render('apps/dosen/records',$data,'blank');
	}

	
	function add($id=''){
		$data['index_riwayat_pendidikan'] = $this->index_riwayat_pendidikan($id ? $id :0);
		$data['index_jurnal'] = $this->index_jurnal($id ? $id :0);
		$data['index_buku'] = $this->index_buku($id ? $id :0);
		$data['index_penelitian'] = $this->index_penelitian($id ? $id :0);
		$data['index_penghargaan'] = $this->index_penghargaan($id ? $id :0);
		$data['index_pengabdian'] = $this->index_pengabdian($id ? $id :0);
		$data['index_karya'] = $this->index_karya($id ? $id :0);
		$data['index_kegiatan_ilmiah'] = $this->index_kegiatan_ilmiah($id ? $id :0);
		$data['index_riwayat_mengajar'] = $this->index_riwayat_mengajar($id ? $id :0);
		$data['hide_riwayat_pendidikan'] = $id  ?'' : 'hide';
		$data['hide_jurnal'] = $id  ?'' : 'hide';
		$data['hide_buku'] = $id  ?'' : 'hide';
		$data['hide_penelitian'] = $id  ?'' : 'hide';
		$data['hide_penghargaan'] = $id  ?'' : 'hide';
		$data['hide_pengabdian'] = $id  ?'' : 'hide';
		$data['hide_karya'] = $id  ?'' : 'hide';
		$data['hide_kegiatan_ilmiah'] = $id  ?'' : 'hide';
		$data['hide_riwayat_mengajar'] = $id  ?'' : 'hide';
		$lang_name = lang_data('name');
		if($id){
			$check = $this->dosen_model->findById($id);
			
			if(!$check){ show_404(); } // data not found
			$data = array_merge($data, $check);
			
			$data['btn_process'] = btn_process(language('update',$lang_name));
			$data['lang_back']     = 'Kembali';

			
		} else {
			$data['btn_process']      = btn_process(language('add',$lang_name));
			$data['id']               = '';
			$data['name']             = '';
			$data['uri_path']         = '';
			$data['name']            = '';
			$data['pangkat']            = '';
			$data['nidn']            = '';
			$data['ttl']            = '';
			$data['jabatan']            = '';
			$data['alamat']            = '';
			$data['no_telepon']            = '';
			$data['prodi']            = '';
			$data['publish_date']     = date('Y-m-d');
			$data['page_content']     = '';
			$data['seo_title']        = '';
			$data['meta_description'] = '';
			$data['meta_keywords']    = '';
			$data['youtube_link']     = '';
		}
		
		
		$img_thumb                   = image($data['img'],'small');
		$imagemanager                = imagemanager('img',$img_thumb);
		$data['img']                 = $imagemanager['browse'];
		$data['imagemanager_config'] = $imagemanager['config'];

		$data['list_dosen_category'] = select_list(array('table' => 'ref_dosen_category', 'title' => 'Dosen Category', 'id_ref_delete' => 0, 'selected' => $data['id_ref_dosen_category'], 'where' => "id_ref_delete='0'"));
		$data['list_status']         = select_list(array('table' => 'ref_status_publish', 'title' => language('select_status', $lang_name), 'id_ref_delete' => 0, 'selected' => $data['id_ref_status_publish'], 'where' => "id_ref_delete='0'"));
		$data['list_dosen_status']   = select_list(array('table' => 'ref_dosen_status', 'title' => 'Pilih Status', 'id_ref_delete' => 0, 'selected' => $data['id_ref_dosen_status'], 'where' => "id_ref_delete='0'"));


		render('apps/dosen/add',$data,'main-apps');
	}
	function process($idedit = '')
	{
		$this->layout      = 'none';
		$post              = purify($this->input->post());
		$ret['error']      = 1;
		$where['a.uri_path'] = $post['uri_path'];

		if ($idedit) {
			$where['a.id !='] = $idedit;
		}


		$unik = $this->dosen_model->findBy($where);
		$this->form_validation->set_rules('name', '"Name"', 'required');
		$this->form_validation->set_rules('uri_path', '"Uri Path Name"', 'required');
		$this->form_validation->set_rules('publish_date', '"Publish Date"', 'required');
		$this->form_validation->set_rules('page_content', '"Page Content"', 'required');
		if ($this->form_validation->run() == FALSE) {
			$ret['message'] = validation_errors(' ', ' ');
		} else if ($unik) {
			$ret['message']	= "Page URL $post[uri_path] already taken";
		} else {

			$this->db->trans_start();
			if ($idedit) {
				auth_update();
				if (!$post['img']) {
					unset($post['img']);
				}
				$ret['message'] = 'Update Success';
				$act			= "Update dosen";
				$this->dosen_model->update($post, $idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert dosen";
				$idedit = $this->dosen_model->insert($post);
			}
			detail_log();

			insert_log($act);
			$this->db->trans_complete();
			set_flash_session('message', $ret['message']);
			$ret['error'] = 0;
		}
		echo json_encode($ret);
	}

	function del()
	{
		auth_delete();
		$id     = $this->input->post('iddel');
		$data   = $this->dosen_model->delete($id);
		detail_log();
		insert_log("Delete dosen");
	}
	
	private function generate_form($data){
		$ret = [];
		foreach ($data as $key => $value) {
			$ret[] = [
				'key_custom' =>$key,
				'value_custom' =>$value,
				'data'=>''
			];
		}
		return $ret;
	}
	// 
		private function generate_form_riwayat_pendidikan()
		{
			$_form = [
				'jenjang' => 'Jenjang',
				'instansi' => 'Instansi',
				'bidang' => 'Bidang',
				'tahun' => 'Tahun Ijazah',
				'skripsi_dll' => 'Skripsi/Tesis/Disertasi'
			];
			return $this->generate_form($_form);
		}
		private function index_riwayat_pendidikan($id_dosen)
		{
			$data['id_dosen'] = $id_dosen;
			$data['data_custom'] = $this->generate_form_riwayat_pendidikan();
			$data['data_custom2'] = $data['data_custom'];
			$data['custom_url'] = 'riwayat_pendidikan';
			return render('apps/dosen/riwayat_pendidikan/index', $data, 'blank', true);
		}
		function records_riwayat_pendidikan($id_dosen)
		{
			$this->load->model('dosen_riwayat_pendidikan_model');
			
			
			$data = $this->dosen_riwayat_pendidikan_model->records(['id_ref_dosen'=>$id_dosen]);
			foreach ($data['data'] as $key => &$value) {
				$value['id_dosen'] = $id_dosen;
				$value['custom_url'] = 'riwayat_pendidikan';
			}
			render('apps/dosen/riwayat_pendidikan/records', $data, 'blank');
		}
		function add_riwayat_pendidikan($id_dosen,$id)
		{
			$this->load->model('dosen_riwayat_pendidikan_model');

			$lang_name = lang_data('name');
			if ($id) {
				$data = $this->dosen_riwayat_pendidikan_model->findById($id);

				if (!$data) {
					show_404();
				} // data not found

				$data['btn_process'] = btn_process(language('update', $lang_name),'add/'.$id_dosen);
			} else {
				$data['btn_process']      = btn_process(language('add', $lang_name),'add/'.$id_dosen);
				$data['id']               = '';
				$data['lang_back']     = 'Kembali';
			}

			$data_custom = $this->generate_form_riwayat_pendidikan();
			foreach ($data_custom as $key => &$value) {
				if (!empty($data[$value['key_custom']])) {
					$value['data'] = $data[$value['key_custom']];
				}
			}
			$data['data_custom'] = $data_custom;
			$data['page_title'] = 'Riwayat Pendidikan';
			$data['custom_url'] = 'riwayat_pendidikan';
			$data['id_dosen'] = $id_dosen;
			render('apps/dosen/riwayat_pendidikan/add', $data, 'main-apps');
		}
		function process_riwayat_pendidikan($idedit = '')
		{
			$this->load->model('dosen_riwayat_pendidikan_model');

			$this->layout      = 'none';
			$post              = purify($this->input->post());
			$ret['error']      = 1;

			$this->db->trans_start();

			if ($idedit) {
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update dosen";
				$this->dosen_riwayat_pendidikan_model->update($post, $idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert dosen";
				$idedit = $this->dosen_riwayat_pendidikan_model->insert($post);
			}
			detail_log();

			insert_log($act);
			$this->db->trans_complete();
			set_flash_session('message', $ret['message']);
			$ret['error'] = 0;
			echo json_encode($ret);
		}
		function del_riwayat_pendidikan()
		{
			$this->load->model('dosen_riwayat_pendidikan_model');

			auth_delete();
			$id     = $this->input->post('iddel');
			$data   = $this->dosen_riwayat_pendidikan_model->delete($id);
			detail_log();
			insert_log("Delete dosen");
		}
	// 

	// 
		private function generate_form_jurnal()
		{
			$_form = [
				"jurnal"=>"Jurnal",
				"judul"=>"Judul",
				"tahun"=>"Tahun",
				"deskripsi"=>"Deskripsi",
				"issn"=>"ISSN",
				"volume"=>"Volume"
			];
			return $this->generate_form($_form);
		}
		private function index_jurnal($id_dosen)
		{
			$data['id_dosen'] = $id_dosen;
			$data['data_custom'] = $this->generate_form_jurnal();
			$data['data_custom2'] = $data['data_custom'];
			$data['custom_url'] = 'jurnal';
			return render('apps/dosen/jurnal/index', $data, 'blank', true);
		}
		function records_jurnal($id_dosen)
		{
			$this->load->model('dosen_jurnal_model');
			
			
			$data = $this->dosen_jurnal_model->records(['id_ref_dosen'=>$id_dosen]);
			foreach ($data['data'] as $key => &$value) {
				$value['id_dosen'] = $id_dosen;
				$value['custom_url'] = 'jurnal';
			}
			render('apps/dosen/jurnal/records', $data, 'blank');
		}
		function add_jurnal($id_dosen,$id)
		{
			$this->load->model('dosen_jurnal_model');

			$lang_name = lang_data('name');
			if ($id) {
				$data = $this->dosen_jurnal_model->findById($id);

				if (!$data) {
					show_404();
				} // data not found

				$data['btn_process'] = btn_process(language('update', $lang_name),'add/'.$id_dosen);
			} else {
				$data['btn_process']      = btn_process(language('add', $lang_name),'add/'.$id_dosen);
				$data['id']               = '';
				$data['lang_back']     = 'Kembali';
			}

			$data_custom = $this->generate_form_jurnal();
			foreach ($data_custom as $key => &$value) {
				if (!empty($data[$value['key_custom']])) {
					$value['data'] = $data[$value['key_custom']];
				}
			}
			$data['data_custom'] = $data_custom;
			$data['page_title'] = 'Riwayat Pendidikan';
			$data['custom_url'] = 'jurnal';
			$data['id_dosen'] = $id_dosen;
			render('apps/dosen/jurnal/add', $data, 'main-apps');
		}
		function process_jurnal($idedit = '')
		{
			$this->load->model('dosen_jurnal_model');

			$this->layout      = 'none';
			$post              = purify($this->input->post());
			$ret['error']      = 1;

			$this->db->trans_start();

			if ($idedit) {
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update dosen";
				$this->dosen_jurnal_model->update($post, $idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert dosen";
				$idedit = $this->dosen_jurnal_model->insert($post);
			}
			detail_log();

			insert_log($act);
			$this->db->trans_complete();
			set_flash_session('message', $ret['message']);
			$ret['error'] = 0;
			echo json_encode($ret);
		}
		function del_jurnal()
		{
			$this->load->model('dosen_jurnal_model');

			auth_delete();
			$id     = $this->input->post('iddel');
			$data   = $this->dosen_jurnal_model->delete($id);
			detail_log();
			insert_log("Delete dosen");
		}
	// 

	// 
		private function generate_form_buku()
		{
			$_form = [
				"judul" => "Judul Buku",
				"isbn" => "ISBN",
				"tahun" => "Tahun",
				"penerbit" => "Penerbit",
				"klasifikasi" => "Klasifikasi",
				"tingkat" => "Tingkat"
			];
			return $this->generate_form($_form);
		}
		private function index_buku($id_dosen)
		{
			$data['id_dosen'] = $id_dosen;
			$data['data_custom'] = $this->generate_form_buku();
			$data['data_custom2'] = $data['data_custom'];
			$data['custom_url'] = 'buku';
			return render('apps/dosen/buku/index', $data, 'blank', true);
		}
		function records_buku($id_dosen)
		{
			$this->load->model('dosen_buku_model');
			
			
			$data = $this->dosen_buku_model->records(['id_ref_dosen'=>$id_dosen]);
			foreach ($data['data'] as $key => &$value) {
				$value['id_dosen'] = $id_dosen;
				$value['custom_url'] = 'buku';
			}
			render('apps/dosen/buku/records', $data, 'blank');
		}
		function add_buku($id_dosen,$id)
		{
			$this->load->model('dosen_buku_model');

			$lang_name = lang_data('name');
			if ($id) {
				$data = $this->dosen_buku_model->findById($id);

				if (!$data) {
					show_404();
				} // data not found

				$data['btn_process'] = btn_process(language('update', $lang_name),'add/'.$id_dosen);
			} else {
				$data['btn_process']      = btn_process(language('add', $lang_name),'add/'.$id_dosen);
				$data['id']               = '';
				$data['lang_back']     = 'Kembali';
			}

			$data_custom = $this->generate_form_buku();
			foreach ($data_custom as $key => &$value) {
				if (!empty($data[$value['key_custom']])) {
					$value['data'] = $data[$value['key_custom']];
				}
			}
			$data['data_custom'] = $data_custom;
			$data['page_title'] = 'Riwayat Pendidikan';
			$data['custom_url'] = 'buku';
			$data['id_dosen'] = $id_dosen;
			render('apps/dosen/buku/add', $data, 'main-apps');
		}
		function process_buku($idedit = '')
		{
			$this->load->model('dosen_buku_model');

			$this->layout      = 'none';
			$post              = purify($this->input->post());
			$ret['error']      = 1;

			$this->db->trans_start();

			if ($idedit) {
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update dosen";
				$this->dosen_buku_model->update($post, $idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert dosen";
				$idedit = $this->dosen_buku_model->insert($post);
			}
			detail_log();

			insert_log($act);
			$this->db->trans_complete();
			set_flash_session('message', $ret['message']);
			$ret['error'] = 0;
			echo json_encode($ret);
		}
		function del_buku()
		{
			$this->load->model('dosen_buku_model');

			auth_delete();
			$id     = $this->input->post('iddel');
			$data   = $this->dosen_buku_model->delete($id);
			detail_log();
			insert_log("Delete dosen");
		}
	// 
	// 
		private function generate_form_penelitian()
		{
			$_form = [
				"judul"=>"Judul",
				"jabatan"=>"Jabatan",
				"tahun"=>"Tahun",
				"sumberdana"=>"Sumberdana"
			];
			return $this->generate_form($_form);
		}
		private function index_penelitian($id_dosen)
		{
			$data['id_dosen'] = $id_dosen;
			$data['data_custom'] = $this->generate_form_penelitian();
			$data['data_custom2'] = $data['data_custom'];
			$data['custom_url'] = 'penelitian';
			return render('apps/dosen/penelitian/index', $data, 'blank', true);
		}
		function records_penelitian($id_dosen)
		{
			$this->load->model('dosen_penelitian_model');
			
			
			$data = $this->dosen_penelitian_model->records(['id_ref_dosen'=>$id_dosen]);
			foreach ($data['data'] as $key => &$value) {
				$value['id_dosen'] = $id_dosen;
				$value['custom_url'] = 'penelitian';
			}
			render('apps/dosen/penelitian/records', $data, 'blank');
		}
		function add_penelitian($id_dosen,$id)
		{
			$this->load->model('dosen_penelitian_model');

			$lang_name = lang_data('name');
			if ($id) {
				$data = $this->dosen_penelitian_model->findById($id);

				if (!$data) {
					show_404();
				} // data not found

				$data['btn_process'] = btn_process(language('update', $lang_name),'add/'.$id_dosen);
			} else {
				$data['btn_process']      = btn_process(language('add', $lang_name),'add/'.$id_dosen);
				$data['id']               = '';
				$data['lang_back']     = 'Kembali';
			}

			$data_custom = $this->generate_form_penelitian();
			foreach ($data_custom as $key => &$value) {
				if (!empty($data[$value['key_custom']])) {
					$value['data'] = $data[$value['key_custom']];
				}
			}
			$data['data_custom'] = $data_custom;
			$data['page_title'] = 'Riwayat Pendidikan';
			$data['custom_url'] = 'penelitian';
			$data['id_dosen'] = $id_dosen;
			render('apps/dosen/penelitian/add', $data, 'main-apps');
		}
		function process_penelitian($idedit = '')
		{
			$this->load->model('dosen_penelitian_model');

			$this->layout      = 'none';
			$post              = purify($this->input->post());
			$ret['error']      = 1;

			$this->db->trans_start();

			if ($idedit) {
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update dosen";
				$this->dosen_penelitian_model->update($post, $idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert dosen";
				$idedit = $this->dosen_penelitian_model->insert($post);
			}
			detail_log();

			insert_log($act);
			$this->db->trans_complete();
			set_flash_session('message', $ret['message']);
			$ret['error'] = 0;
			echo json_encode($ret);
		}
		function del_penelitian()
		{
			$this->load->model('dosen_penelitian_model');

			auth_delete();
			$id     = $this->input->post('iddel');
			$data   = $this->dosen_penelitian_model->delete($id);
			detail_log();
			insert_log("Delete dosen");
		}
	// 
	// 
		private function generate_form_penghargaan()
		{
			$_form = [
				"judul"=>"Judul",
				"jenis"=>"Jenis",
				"tahun"=>"Tahun",
				"pendukung"=>"Tingkat Pendukung"
			];
			return $this->generate_form($_form);
		}
		private function index_penghargaan($id_dosen)
		{
			$data['id_dosen'] = $id_dosen;
			$data['data_custom'] = $this->generate_form_penghargaan();
			$data['data_custom2'] = $data['data_custom'];
			$data['custom_url'] = 'penghargaan';
			return render('apps/dosen/penghargaan/index', $data, 'blank', true);
		}
		function records_penghargaan($id_dosen)
		{
			$this->load->model('dosen_penghargaan_model');
			
			
			$data = $this->dosen_penghargaan_model->records(['id_ref_dosen'=>$id_dosen]);
			foreach ($data['data'] as $key => &$value) {
				$value['id_dosen'] = $id_dosen;
				$value['custom_url'] = 'penghargaan';
			}
			render('apps/dosen/penghargaan/records', $data, 'blank');
		}
		function add_penghargaan($id_dosen,$id)
		{
			$this->load->model('dosen_penghargaan_model');

			$lang_name = lang_data('name');
			if ($id) {
				$data = $this->dosen_penghargaan_model->findById($id);

				if (!$data) {
					show_404();
				} // data not found

				$data['btn_process'] = btn_process(language('update', $lang_name),'add/'.$id_dosen);
			} else {
				$data['btn_process']      = btn_process(language('add', $lang_name),'add/'.$id_dosen);
				$data['id']               = '';
				$data['lang_back']     = 'Kembali';
			}

			$data_custom = $this->generate_form_penghargaan();
			foreach ($data_custom as $key => &$value) {
				if (!empty($data[$value['key_custom']])) {
					$value['data'] = $data[$value['key_custom']];
				}
			}
			$data['data_custom'] = $data_custom;
			$data['page_title'] = 'Riwayat Pendidikan';
			$data['custom_url'] = 'penghargaan';
			$data['id_dosen'] = $id_dosen;
			render('apps/dosen/penghargaan/add', $data, 'main-apps');
		}
		function process_penghargaan($idedit = '')
		{
			$this->load->model('dosen_penghargaan_model');

			$this->layout      = 'none';
			$post              = purify($this->input->post());
			$ret['error']      = 1;

			$this->db->trans_start();

			if ($idedit) {
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update dosen";
				$this->dosen_penghargaan_model->update($post, $idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert dosen";
				$idedit = $this->dosen_penghargaan_model->insert($post);
			}
			detail_log();

			insert_log($act);
			$this->db->trans_complete();
			set_flash_session('message', $ret['message']);
			$ret['error'] = 0;
			echo json_encode($ret);
		}
		function del_penghargaan()
		{
			$this->load->model('dosen_penghargaan_model');

			auth_delete();
			$id     = $this->input->post('iddel');
			$data   = $this->dosen_penghargaan_model->delete($id);
			detail_log();
			insert_log("Delete dosen");
		}
	// 
	// 
		private function generate_form_pengabdian()
		{
			$_form = [
				"judul"=>"Judul",
				"jabatan"=>"Jabatan",
				"tahun"=>"Tahun",
				"sumberdana"=>"Sumberdana",
				"pendukung"=>"Tingkat Pendukung"
			];
			return $this->generate_form($_form);
		}
		private function index_pengabdian($id_dosen)
		{
			$data['id_dosen'] = $id_dosen;
			$data['data_custom'] = $this->generate_form_pengabdian();
			$data['data_custom2'] = $data['data_custom'];
			$data['custom_url'] = 'pengabdian';
			return render('apps/dosen/pengabdian/index', $data, 'blank', true);
		}
		function records_pengabdian($id_dosen)
		{
			$this->load->model('dosen_pengabdian_model');
			
			
			$data = $this->dosen_pengabdian_model->records(['id_ref_dosen'=>$id_dosen]);
			foreach ($data['data'] as $key => &$value) {
				$value['id_dosen'] = $id_dosen;
				$value['custom_url'] = 'pengabdian';
			}
			render('apps/dosen/pengabdian/records', $data, 'blank');
		}
		function add_pengabdian($id_dosen,$id)
		{
			$this->load->model('dosen_pengabdian_model');

			$lang_name = lang_data('name');
			if ($id) {
				$data = $this->dosen_pengabdian_model->findById($id);

				if (!$data) {
					show_404();
				} // data not found

				$data['btn_process'] = btn_process(language('update', $lang_name),'add/'.$id_dosen);
			} else {
				$data['btn_process']      = btn_process(language('add', $lang_name),'add/'.$id_dosen);
				$data['id']               = '';
				$data['lang_back']     = 'Kembali';
			}

			$data_custom = $this->generate_form_pengabdian();
			foreach ($data_custom as $key => &$value) {
				if (!empty($data[$value['key_custom']])) {
					$value['data'] = $data[$value['key_custom']];
				}
			}
			$data['data_custom'] = $data_custom;
			$data['page_title'] = 'Riwayat Pendidikan';
			$data['custom_url'] = 'pengabdian';
			$data['id_dosen'] = $id_dosen;
			render('apps/dosen/pengabdian/add', $data, 'main-apps');
		}
		function process_pengabdian($idedit = '')
		{
			$this->load->model('dosen_pengabdian_model');

			$this->layout      = 'none';
			$post              = purify($this->input->post());
			$ret['error']      = 1;

			$this->db->trans_start();

			if ($idedit) {
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update dosen";
				$this->dosen_pengabdian_model->update($post, $idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert dosen";
				$idedit = $this->dosen_pengabdian_model->insert($post);
			}
			detail_log();

			insert_log($act);
			$this->db->trans_complete();
			set_flash_session('message', $ret['message']);
			$ret['error'] = 0;
			echo json_encode($ret);
		}
		function del_pengabdian()
		{
			$this->load->model('dosen_pengabdian_model');

			auth_delete();
			$id     = $this->input->post('iddel');
			$data   = $this->dosen_pengabdian_model->delete($id);
			detail_log();
			insert_log("Delete dosen");
		}
	// 
	// 
		private function generate_form_karya()
		{
			$_form = [
				"judul"=>"Judul",
				"jenis"=>"Jenis",
				"tahun"=>"Tahun",
				"pendukung"=>"Tingkat Pendukung"
			];
			return $this->generate_form($_form);
		}
		private function index_karya($id_dosen)
		{
			$data['id_dosen'] = $id_dosen;
			$data['data_custom'] = $this->generate_form_karya();
			$data['data_custom2'] = $data['data_custom'];
			$data['custom_url'] = 'karya';
			return render('apps/dosen/karya/index', $data, 'blank', true);
		}
		function records_karya($id_dosen)
		{
			$this->load->model('dosen_karya_model');
			
			
			$data = $this->dosen_karya_model->records(['id_ref_dosen'=>$id_dosen]);
			foreach ($data['data'] as $key => &$value) {
				$value['id_dosen'] = $id_dosen;
				$value['custom_url'] = 'karya';
			}
			render('apps/dosen/karya/records', $data, 'blank');
		}
		function add_karya($id_dosen,$id)
		{
			$this->load->model('dosen_karya_model');

			$lang_name = lang_data('name');
			if ($id) {
				$data = $this->dosen_karya_model->findById($id);

				if (!$data) {
					show_404();
				} // data not found

				$data['btn_process'] = btn_process(language('update', $lang_name),'add/'.$id_dosen);
			} else {
				$data['btn_process']      = btn_process(language('add', $lang_name),'add/'.$id_dosen);
				$data['id']               = '';
				$data['lang_back']     = 'Kembali';
			}

			$data_custom = $this->generate_form_karya();
			foreach ($data_custom as $key => &$value) {
				if (!empty($data[$value['key_custom']])) {
					$value['data'] = $data[$value['key_custom']];
				}
			}
			$data['data_custom'] = $data_custom;
			$data['page_title'] = 'Riwayat Pendidikan';
			$data['custom_url'] = 'karya';
			$data['id_dosen'] = $id_dosen;
			render('apps/dosen/karya/add', $data, 'main-apps');
		}
		function process_karya($idedit = '')
		{
			$this->load->model('dosen_karya_model');

			$this->layout      = 'none';
			$post              = purify($this->input->post());
			$ret['error']      = 1;

			$this->db->trans_start();

			if ($idedit) {
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update dosen";
				$this->dosen_karya_model->update($post, $idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert dosen";
				$idedit = $this->dosen_karya_model->insert($post);
			}
			detail_log();

			insert_log($act);
			$this->db->trans_complete();
			set_flash_session('message', $ret['message']);
			$ret['error'] = 0;
			echo json_encode($ret);
		}
		function del_karya()
		{
			$this->load->model('dosen_karya_model');

			auth_delete();
			$id     = $this->input->post('iddel');
			$data   = $this->dosen_karya_model->delete($id);
			detail_log();
			insert_log("Delete dosen");
		}
	// 
	// 
		private function generate_form_kegiatan_ilmiah()
		{
			$_form = [
				"jenis"=>"Jenis Kegiatan",
				"tempat"=>"Tempat",
				"mulai"=>"Mulai",
				"akhir"=>"Berakhir",
				"keterangan"=>"Keterangan"
			];
			return $this->generate_form($_form);
		}
		private function index_kegiatan_ilmiah($id_dosen)
		{
			$data['id_dosen'] = $id_dosen;
			$data['data_custom'] = $this->generate_form_kegiatan_ilmiah();
			$data['data_custom2'] = $data['data_custom'];
			$data['custom_url'] = 'kegiatan_ilmiah';
			return render('apps/dosen/kegiatan_ilmiah/index', $data, 'blank', true);
		}
		function records_kegiatan_ilmiah($id_dosen)
		{
			$this->load->model('dosen_kegiatan_ilmiah_model');
			
			
			$data = $this->dosen_kegiatan_ilmiah_model->records(['id_ref_dosen'=>$id_dosen]);
			foreach ($data['data'] as $key => &$value) {
				$value['id_dosen'] = $id_dosen;
				$value['custom_url'] = 'kegiatan_ilmiah';
			}
			render('apps/dosen/kegiatan_ilmiah/records', $data, 'blank');
		}
		function add_kegiatan_ilmiah($id_dosen,$id)
		{
			$this->load->model('dosen_kegiatan_ilmiah_model');

			$lang_name = lang_data('name');
			if ($id) {
				$data = $this->dosen_kegiatan_ilmiah_model->findById($id);

				if (!$data) {
					show_404();
				} // data not found

				$data['btn_process'] = btn_process(language('update', $lang_name),'add/'.$id_dosen);
			} else {
				$data['btn_process']      = btn_process(language('add', $lang_name),'add/'.$id_dosen);
				$data['id']               = '';
				$data['lang_back']     = 'Kembali';
			}

			$data_custom = $this->generate_form_kegiatan_ilmiah();
			foreach ($data_custom as $key => &$value) {
				if (!empty($data[$value['key_custom']])) {
					$value['data'] = $data[$value['key_custom']];
				}
			}
			$data['data_custom'] = $data_custom;
			$data['page_title'] = 'Riwayat Pendidikan';
			$data['custom_url'] = 'kegiatan_ilmiah';
			$data['id_dosen'] = $id_dosen;
			render('apps/dosen/kegiatan_ilmiah/add', $data, 'main-apps');
		}
		function process_kegiatan_ilmiah($idedit = '')
		{
			$this->load->model('dosen_kegiatan_ilmiah_model');

			$this->layout      = 'none';
			$post              = purify($this->input->post());
			$ret['error']      = 1;

			$this->db->trans_start();

			if ($idedit) {
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update dosen";
				$this->dosen_kegiatan_ilmiah_model->update($post, $idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert dosen";
				$idedit = $this->dosen_kegiatan_ilmiah_model->insert($post);
			}
			detail_log();

			insert_log($act);
			$this->db->trans_complete();
			set_flash_session('message', $ret['message']);
			$ret['error'] = 0;
			echo json_encode($ret);
		}
		function del_kegiatan_ilmiah()
		{
			$this->load->model('dosen_kegiatan_ilmiah_model');

			auth_delete();
			$id     = $this->input->post('iddel');
			$data   = $this->dosen_kegiatan_ilmiah_model->delete($id);
			detail_log();
			insert_log("Delete dosen");
		}
	// 	
	// 
		private function generate_form_riwayat_mengajar()
		{
			$_form = [
				"program_studi"=>"Program Studi",
				"mata_kuliah"=>"Mata Kuliah",
				"tahun_akademik"=>"Tahun Akhir Akademik",
				"semester"=>"Semester",
				"jumlah_sks"=>"Jumlah SKS",
				"kelas"=>"Kelas",
			];
			return $this->generate_form($_form);
		}
		private function index_riwayat_mengajar($id_dosen)
		{
			$data['id_dosen'] = $id_dosen;
			$data['data_custom'] = $this->generate_form_riwayat_mengajar();
			$data['data_custom2'] = $data['data_custom'];
			$data['custom_url'] = 'riwayat_mengajar';
			return render('apps/dosen/riwayat_mengajar/index', $data, 'blank', true);
		}
		function records_riwayat_mengajar($id_dosen)
		{
			$this->load->model('dosen_riwayat_mengajar_model');
			
			
			$data = $this->dosen_riwayat_mengajar_model->records(['id_ref_dosen'=>$id_dosen]);
			foreach ($data['data'] as $key => &$value) {
				$value['id_dosen'] = $id_dosen;
				$value['custom_url'] = 'riwayat_mengajar';
			}
			render('apps/dosen/riwayat_mengajar/records', $data, 'blank');
		}
		function add_riwayat_mengajar($id_dosen,$id)
		{
			$this->load->model('dosen_riwayat_mengajar_model');

			$lang_name = lang_data('name');
			if ($id) {
				$data = $this->dosen_riwayat_mengajar_model->findById($id);

				if (!$data) {
					show_404();
				} // data not found

				$data['btn_process'] = btn_process(language('update', $lang_name),'add/'.$id_dosen);
			} else {
				$data['btn_process']      = btn_process(language('add', $lang_name),'add/'.$id_dosen);
				$data['id']               = '';
				$data['lang_back']     = 'Kembali';
			}

			$data_custom = $this->generate_form_riwayat_mengajar();
			foreach ($data_custom as $key => &$value) {
				if (!empty($data[$value['key_custom']])) {
					$value['data'] = $data[$value['key_custom']];
				}
			}
			$data['data_custom'] = $data_custom;
			$data['page_title'] = 'Riwayat Pendidikan';
			$data['custom_url'] = 'riwayat_mengajar';
			$data['id_dosen'] = $id_dosen;
			render('apps/dosen/riwayat_mengajar/add', $data, 'main-apps');
		}
		function process_riwayat_mengajar($idedit = '')
		{
			$this->load->model('dosen_riwayat_mengajar_model');

			$this->layout      = 'none';
			$post              = purify($this->input->post());
			$ret['error']      = 1;

			$this->db->trans_start();

			if ($idedit) {
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update dosen";
				$this->dosen_riwayat_mengajar_model->update($post, $idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert dosen";
				$idedit = $this->dosen_riwayat_mengajar_model->insert($post);
			}
			detail_log();

			insert_log($act);
			$this->db->trans_complete();
			set_flash_session('message', $ret['message']);
			$ret['error'] = 0;
			echo json_encode($ret);
		}
		function del_riwayat_mengajar()
		{
			$this->load->model('dosen_riwayat_mengajar_model');

			auth_delete();
			$id     = $this->input->post('iddel');
			$data   = $this->dosen_riwayat_mengajar_model->delete($id);
			detail_log();
			insert_log("Delete dosen");
		}
	// 
	
	function select_category(){
		$this->load->model('dosen_category_model');
		$data = $this->dosen_category_model->records();
		render('apps/dosen/records-module',$data,'blank');
	}

	function export_to_xls(){
		$basedir = UPLOAD_DIR;
		if($_GET['download']) {
			$fileDir = $basedir.$_GET['download'];
			header('Content-Description: File Transfer');
			header('Content-Type: application/octet-stream');
			header('Content-Length: ' . filesize($fileDir));
			header('Content-Disposition: attachment; filename='.basename($fileDir));
			readfile($fileDir);unlink($fileDir);exit;
		} else {
			$post                          = $this->input->post();
			$alias['search_id']            = 'a.id';
			$alias['search_dosen_category'] = 'b.id';
			$alias['search_status']        = 'c.id';
			$alias['search_writer']        = 'd.fullname';
			$alias['search_language']      = 'e.id';
			where_grid($post, $alias);
			
			$this->load->library("PHPExcel");
			$objPHPExcel = new PHPExcel();
			$objPHPExcel->setActiveSheetIndex(0);    
			$objPHPExcel->getActiveSheet()->setCellValue('A1', 'NO');
			$objPHPExcel->getActiveSheet()->setCellValue('B1', 'ID');
			$objPHPExcel->getActiveSheet()->setCellValue('C1', 'dosen CATEGORY');
			$objPHPExcel->getActiveSheet()->setCellValue('D1', 'dosen TITLE');
			$objPHPExcel->getActiveSheet()->setCellValue('E1', 'TEASER');
			$objPHPExcel->getActiveSheet()->setCellValue('F1', 'URL');
			$objPHPExcel->getActiveSheet()->setCellValue('G1', 'CREATEDATE')->getStyle('H1:H1000')->getNumberFormat()->setFormatCode('[$-C09]d mmm yyyy;@');
			$objPHPExcel->getActiveSheet()->setCellValue('H1', 'PUBLISHDATE')->getStyle('H1:H1000')->getNumberFormat()->setFormatCode('[$-C09]d mmm yyyy;@');
			$objPHPExcel->getActiveSheet()->setCellValue('I1', 'STATUS PUBLISH');
			$objPHPExcel->getActiveSheet()->setCellValue('J1', 'HITS');
			$objPHPExcel->getActiveSheet()->setCellValue('K1', 'YOUTUBE LINK');
			$objPHPExcel->getActiveSheet()->setCellValue('L1', 'WRITER');
			$objPHPExcel->getActiveSheet()->setCellValue('M1', 'LANGUAGE');

			$data['data'] = $this->dosen_model->findBy();
			$filename     = 'dosen-report-'.date('Y-m-d-h-i-s').'.xlsx';
			$d = 2; $n = 0;
			foreach ($data['data'] as $key => $value){
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, ++$no);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['id']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['dosen_category']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['title']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['teaser']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, base_url().'article'.$value['uri_path_category'].'/'.$value['uri_path']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, date('Y-m-d H:i:s', strtotime($value['create_date'])));
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, date('Y-m-d', strtotime($value['publish_date'])));
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['status']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['hits']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['youtube_link']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['writer']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['language']);
				$d++;$n=0;
			}

			$objWriter 	= PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
			$dt 		= $objWriter->save($basedir.$filename);
			$ret['file_name'] 	= $filename;
			$ret['status'] 		= 'File Generated.';
		}
		echo json_encode($ret);
		exit;
	}
	
}

/*
 * End of file dosen.php
 * Location: ./application/controllers/dosen.php
 */