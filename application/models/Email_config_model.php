<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Email_config_model extends CI_Model{

	var $table 		= 'email_config';
	var $tableAs 	= 'email_config a';
	
	function __construct(){
		parent::__construct();
	}

	function records($where=array(),$isTotal=0){
		$alias['search_name'] = 'a.name';
		$alias['search_total_users'] = 'a.name';

	 	query_grid($alias, $isTotal);
		$this->db->select("a.id, a.name as group_name");
		$this->db->where('a.id_ref_delete',0);

		$query = $this->db->get($this->tableAs);
		if($isTotal==0){
			$data = $query->result_array();
		} else {
			return $query->num_rows();
		}

		$ttl_row = $this->records($where,1);
		return ddi_grid($data,$ttl_row);
	}

	function insert($data){
		$this->db->insert($this->table,array_filter($data));
		return $this->db->insert_id();
	}

	function update($data,$id){
		$where['id'] 			= $id;
		$this->db->update($this->table,$data,$where);
		return $id;
	}

	function findById($id){
		$where['a.id'] = $id;
		$where['a.id_ref_delete'] = 0;
		return 	$this->db->get_where($this->tableAs,$where)->row_array();
	}
	
	function findBy($where=array(),$is_single_row=0){
		$where['id_ref_delete'] = 0;
		$this->db->select('*');
		if($is_single_row==1){
			return 	$this->db->get_where($this->tableAs,$where)->row_array();
		}
		else{
			return 	$this->db->get_where($this->tableAs,$where)->result_array();
		}
	} 

	function fetchRow($where) {
		return $this->findBy($where,1);
	}

	function delete($id){
        $data['id_ref_delete'] = 1;
        $this->update($data, $id);
    }

}

/*
 * End of file Email_config_model.php
 * Location: ./application/models/Email_config_model.php
 */