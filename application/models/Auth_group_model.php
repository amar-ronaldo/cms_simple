<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Auth_group_model extends CI_Model{

	var $table 		= 'ref_auth_user_group';
	var $tableAs 	= 'ref_auth_user_group a';
	
	function __construct(){
		parent::__construct();
	}

	function records($where=array(),$isTotal=0){
		$alias['search_name'] = 'a.name';

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
		$data['create_date'] 	= date('Y-m-d H:i:s');
		$data['id_ref_auth_user_create'] = id_user();
		$this->db->insert($this->table,array_filter($data));
		return $this->db->insert_id();
	}

	function update($data,$id){
		$where['id'] 			= $id;
		$data['id_ref_auth_user_modify'] = id_user();
		$data['modify_date'] 	= date('Y-m-d H:i:s');
		$this->db->update($this->table,$data,$where);
		return $id;
	}

	function findById($id){
		$where['a.id'] = $id;
		$where['a.id_ref_delete'] = 0;
		return 	$this->db->get_where($this->tableAs,$where)->row_array();
	}
	
	function findBy($where,$is_single_row=0){
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
	
	function ListGroup($perpage=null,$limit=null){
		if ($limit && $perpage) $this->db->limit($perpage,$limit);
		$this->db->order_by('id_ref_auth_user_group', 'asc');
		$query = $this->db->get($this->table);
		return $query;
	}
	
	function GetGroupById($Id){
		$this->db->where('id_ref_auth_user_group',$Id);
		$this->db->order_by('id_ref_auth_user_group','asc');
		$this->db->limit(1);
		$query = $this->db->get($this->table);
		return $query;
	}
	
	function InsertGroup($data){
		$this->db->insert($this->table, $data);
	}
	
	function UpdateGroup($Id,$data){
		$this->db->where('id_ref_auth_user_group',$Id);
		$this->db->update($this->table, $data);	
	}
	
	function DeleteGroup($Id){
		$this->db->where('id_ref_auth_user_group',$Id);
		$this->db->delete($this->table); 
	}
	
	function GetMenuByParent($Parent_id){
		$this->db->where('id_parents_menu_admin',$Parent_id);
		$query = $this->db->get('ref_menu_admin');
		return $query;
	}
	
	function GetMenuByRef($id_ref_menu,$id_group){
		$this->db->where('id_ref_menu_admin',$id_ref_menu);
		$this->db->where('id_ref_auth_user_group',$id_group);
		$query = $this->db->get('ref_auth_pages');
		return $query;
	}

}

/*
 * End of file Auth_group_model.php
 * Location: ./application/models/Auth_group_model.php
 */