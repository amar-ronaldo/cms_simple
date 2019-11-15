<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Model untuk handle halaman ContactUsReplayModel
 * @author 	Anisa Fitri <anisa@deptechdigital.com>
 * 
 */

class ContactUsReplyModel extends  CI_Model{
	var $table = 'contact_us_reply';
	var $tableAs = 'contact_us_reply a';
    function __construct(){
       parent::__construct();
	   
    }
	function records($where=array(),$isTotal=0){
		$alias['search_title'] = 'a.name';
		// $ttl_row = $this->db->get($this->tableAs)->num_rows();

	 	query_grid($alias,$isTotal);
		$this->db->select("a.id, a.name");
		$this->db->where('id_ref_delete',0);
		$query = $this->db->get($this->tableAs);
		if($isTotal==0){
			$data = $query->result_array();
		}
		else{
			return $query->num_rows();
		}

		$ttl_row = $this->records($where,1);
		
		// echo $this->db->last_query();
		return ddi_grid($data,$ttl_row);
	}
	function insert($data){
		$data['create_date'] 	= date('Y-m-d H:i:s');
		$data['id_ref_auth_user_create'] = id_user();
		$this->db->insert($this->table,array_filter($data));
		return $this->db->insert_id();
	}
	function update($data,$id){
		$where['id'] = $id;
		$data['id_ref_auth_user_modify'] = id_user();
		$data['modify_date'] 	= date('Y-m-d H:i:s');
		$this->db->update($this->table,$data,$where);
		return $id;
	}
	function delete($id){
		$data['id_ref_delete'] = 1;
		$this->update($data,$id);
	}
	function findById($id){
		$where['a.id'] = $id;
		$where['id_ref_delete'] = 0;
		return 	$this->db->get_where($this->table.' a',$where)->row_array();
	}
	function fetchRow($where) {
		return $this->findBy($where,1);
	}
	function findBy($where,$is_single_row=0){
		$where['a.id_ref_delete'] = 0;
		$this->db->select('a.*,b.username');
		$this->db->join('ref_auth_user b','b.id = a.id_ref_auth_user_create');
		
		if($is_single_row==1){
			return 	$this->db->get_where($this->tableAs,$where)->row_array();
		}else{
			return 	$this->db->get_where($this->tableAs,$where)->result_array();
		}
	} 
}


/*
 * End of file ContactUsReplyModel.php
 * Location: ./application/models/ContactUsReplyModel.php
 */