<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class City extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('City_model');
	}

	function index(){
		$data['btn_add'] = btn_add();
		render('apps/city/index',$data,'main-apps');
	}

	function records(){
		
		$data = $this->City_model->records();

		render('apps/city/records',$data,'blank');
	}	

	function add($id=''){

		if($id){
			$data = $this->City_model->findById($id);
			if(!$data){
				die('404');
			}
			$data['judul']		= 'Edit';
			$data['proses']		= 'Update'; 
			$data['btn_process'] = btn_process(language('update',$lang_name));
		}
		else{
			$data['judul']                 = 'Tambah';
			$data['btn_process'] 		   = btn_process(language('add',$lang_name));
			$data['id']                    = '';
			$data['code_province']         = '';
			$data['code_city']             = '';
			$data['code_city_note']        = '';
			$data['name']                  = '';
			$data['id_ref_status_publish'] = '';
			$data['uri_path']              = '';
		}

		$data['list_provinsi']	= select_list(array('table'=>'ref_province',
													'id'=>'code_province',
													'name'=>'name',
													'where'=>'code_province !=99 and id_ref_delete =0',
													'selected'=>$data['code_province'],
													'title'=>language('select_province', $lang_name))
		);

        $data['list_status_publish'] = select_list(array('table'=>'ref_status_publish','title'=>language('select_status_publish', $lang_name),'selected'=>$data['id_ref_status_publish']));

		render('apps/city/add',$data,'main-apps');
	} 

	// function filter_city_note($id=''){
	// 	if ($id == 100){
	// 	echo select_list(array('table'=>'ref_city',
	// 							'id'=>'id_ref_city',
	// 							'name'=>'city',
	// 							'title'=>'select'
	// 						)
	// 					);

	// 	}
	// 	else {
	// 	echo select_list(array('table'=>'ref_city',
	// 							'id'=>'id_ref_city',
	// 							'name'=>'city',
	// 							'where'=>"id_ref_province = $id",
	// 							'title'=>'select'
	// 						)
	// 					);

	// 	}
	// }

	function process($idedit=''){
		$this->layout       = 'none';
		$post               = array_filter($this->input->post());
		$ret['error']       = 1;
		$where['city'] = $post['city'];
		if($idedit){
			$where['id_ref_city !='] = $idedit;
		}
		// $unik				= $this->City_model->findBy($where);
		
		$this->form_validation->set_rules('code_province', 'province', 'required');
		$this->form_validation->set_rules('code_city_note', 'Kode Kabupaten', 'required');
		$this->form_validation->set_rules('name', 'Nama Kabupaten', 'required');
		$this->form_validation->set_rules('id_ref_status_publish', 'Status Publish', 'required');

		if ($this->form_validation->run() == FALSE){
			$ret['message']  = validation_errors(' ',' ');
		}
		else{   
				$this->db->trans_start(); 
				if($idedit){
					auth_update();
					$ret['message'] = 'Update Success';
					$act			= "Update city/Kota";
					$this->City_model->update($post,$idedit);
				}
				else{
						auth_insert();
						$ret['message'] = 'Insert Success';
						$act			= "Insert city/Kota"; 
						$this->City_model->insert($post); 
					}
					detail_log();
					insert_log($act);
					$this->db->trans_complete();
					$this->session->set_flashdata('message',$ret['message']);
					$ret['error'] = 0;
				}
				echo json_encode($ret);
				
	}

	function del(){
		auth_delete();
		$id = $this->input->post('iddel');
		$this->City_model->delete($id);
		detail_log();
		insert_log("Delete District");
	}

}

/* End of file profil_mitra.php */
/* Location: ./application/controllers/apps/profil_mitra.php */