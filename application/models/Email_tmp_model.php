<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman auth menu
 * @author 	Anisa Fitri <anisa@deptechdigital.com>
 * 
 */

class Email_tmp_model extends  CI_Model{
	var $table = 'ref_email_tmp';
	var $tableAs = 'ref_email_tmp a';

    function __construct(){
       parent::__construct();
       $this->load->model('Auth_user_model');
       $user = $this->Auth_user_model->findById(id_user());
       $this->approvalLevelGroup = $user['approval_level'];

    }

	function records($where=array(),$isTotal=0){
		$grup = $this->session->userdata['ADM_SESS']['admin_id_auth_user_group'];
		// $alias['search_uri_path']       = 'a.uri_path';
		$alias['search_status'] = 'a.name';
		$alias['search_status_publish'] = 'c.id';

	 	query_grid($alias,$isTotal);
		$this->db->select("a.*,c.name as status,d.username");
		$this->db->where('a.id_ref_delete',0);
		$this->db->join('ref_status_publish c',"c.id = a.id_ref_status_publish",'left');
		$this->db->join('ref_auth_user d',"d.id = a.id_ref_auth_user_create",'left');
        // $this->db->join('ref_email_category e',"e.id = a.id_ref_email_category",'left');
		
		$query = $this->db->get($this->tableAs);
		if($isTotal==0){
			$data = $query->result_array();
		}
		else{
			return $query->num_rows();
		}

		$ttl_row = $this->records($where,1);
		
		return ddi_grid($data,$ttl_row);
	}

	function insert($data){
		if($data){
			$this->db->select('a.code as code_lang');
			$this->db->where('a.id', $data['id_ref_language']);
			$code = $this->db->get('ref_language a')->row();

			$data['template_name'] = $data['template_name'].' '.$code->code_lang;

			$data['create_date'] 	= date('Y-m-d H:i:s');
			$data['id_ref_auth_user_create'] = id_user();
	        generate_email_template_file($data['template_name'],$data['page_content']);
			$this->db->insert($this->table,array_filter($data));
			return $this->db->insert_id();
		}
		// print_r($data);exit;
		// $data['template_name']
		
	}
	function update($data,$id){

		$this->db->select('a.code as code_lang');
		$this->db->where('a.id', $data['id_ref_language']);
		$code = $this->db->get('ref_language a')->row();

		$data['template_name'] = $data['template_name'].' '.$code->code_lang;

		$where['id'] = $id;
		$data['id_ref_auth_user_modify'] = id_user();
		$data['modify_date'] 	= date('Y-m-d H:i:s');
        generate_email_template_file($data['template_name'],$data['page_content']);
		$this->db->update($this->table,$data,$where);
		return $id;
	}
	function delete($id){
        $this->db->where('id',$id);
		$this->db->delete($this->table); 
	}
	function findById($id){
		$where['a.id'] = $id;
		$where['a.id_ref_delete'] = 0;
		$this->db->select('a.*');
		// $this->db->join('ref_auth_user b','b.id_auth_user = a.id_ref_auth_user_create');

		return 	$this->db->get_where($this->tableAs,$where)->row_array();
	}

	function fetchRow($where) {
		return $this->findBy($where,1);
	}
    function findBy($where,$is_single_row=0){
		$where['a.id_ref_delete'] = 0;
		$this->db->select('a.*');
		if($is_single_row==1){
			return 	$this->db->get_where($this->tableAs,$where)->row_array();
		}
		else{
			return 	$this->db->get_where($this->tableAs,$where)->result_array();
		}
	} 

}

/*
 * End of file Email_tmp_model.php
 * Location: ./application/models/Email_tmp_model.php
 */