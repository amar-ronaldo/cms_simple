<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Frontend_menu_model extends CI_Model{

	var $table 		= 'frontend_menu';
	var $tableAs 	= 'frontend_menu a';
	
	function __construct(){
		parent::__construct();
	}

	function records($where=array(),$isTotal=0){
		$alias['search_name'] = 'a.name';
		$alias['search_code'] = 'a.code';

	 	query_grid($alias, $isTotal);
		$this->db->select("a.*,b.name as position,c.name as parent,d.name as status_publish");
		$this->db->join('menu_position b','b.id = a.id_menu_position','left');
		$this->db->join('frontend_menu c','c.id_parent = a.id','left');
		$this->db->join('ref_status_publish d','d.id = a.id_ref_status_publish','left');
		$this->db->where("a.id_ref_delete", 0);

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
		$data['create_date']             = date('Y-m-d H:i:s');
		$data['id_ref_auth_user_create'] = id_user();
		$this->db->insert($this->table,array_filter($data));
		return $this->db->insert_id();
	}

	function update($data,$id){
		$where['id']                     = $id;
		$data['id_ref_auth_user_modify'] = id_user();
		$data['modify_date']             = date('Y-m-d H:i:s');
		$this->db->update($this->table,$data,$where);
		return $id;
	}

	function findById($id){
		$where['a.id'] = $id;
		$where['a.id_ref_delete'] = 0;
		$this->db->select("a.*,b.name as position,c.name as parent,d.name as status_publish");
		$this->db->join('menu_position b','b.id = a.id_menu_position','left');
		$this->db->join('frontend_menu c','c.id_parent = a.id','left');
		$this->db->join('ref_status_publish d','d.id = a.id_ref_status_publish','left');
		$this->db->where("a.id_ref_delete", 0);
		return 	$this->db->get_where($this->tableAs,$where)->row_array();
	}
	
	function findBy($where=array(),$is_single_row=0){
		$where['id_ref_delete'] = 0;
		$this->db->select("a.*,b.name as position,c.name as parent,d.name as status_publish");
		$this->db->join('menu_position b','b.id = a.id_menu_position','left');
		$this->db->join('frontend_menu c','c.id_parent = a.id','left');
		$this->db->join('ref_status_publish d','d.id = a.id_ref_status_publish','left');
		$this->db->where("a.id_ref_delete", 0);
		if($is_single_row==1){
			return 	$this->db->get_where($this->tableAs,$where)->row_array();
		} else {
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
 * End of file Frontend_menu_model.php
 * Location: ./application/models/Frontend_menu_model.php
 */