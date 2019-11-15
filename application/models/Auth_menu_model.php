<?php


/**
 * Controller untuk handle halaman auth pages
 * @author 	Anisa Fitri <anisa@deptechdigital.com>
 * 
 */

class Auth_menu_model extends  CI_Model{

	var $table   = 'ref_menu_admin';
	var $tableAs = 'ref_menu_admin a';

    function __construct(){
       parent::__construct();
	   
    }

	function records_level1($where=array(),$isTotal=0){ 

		$alias['search_menus']      = 'a.menu';
		$alias['search_controller'] = 'a.controllers';

	 	query_grid($alias, $isTotal);
		$this->db->select("a.menu as menus, a.controller as controllers, a.id, a.urut, a.id_ref_menu_admin_parents as parent, a.breadcrumb");
		$this->db->where('a.id_ref_menu_admin_parents = 0');
		$this->db->where('a.id_ref_delete = 0');

		$query = $this->db->get($this->tableAs);
		if($isTotal==0){
			$data = $query->result_array();
		} else {
			return $query->num_rows();
		}

		$ttl_row = $this->records_level1($where,1);
		return ddi_grid($data,$ttl_row);
		return query_grid($query,$alias);
	}

	function records_level_2($where=array(),$isTotal=0){
		$alias['search_name'] = 'a.menu';
		$this->db->select("a.menu as menus, a.controller as controllers, a.id, a.urut, a.id_ref_menu_admin_parents as parent");
		$this->db->where($where);
		$this->db->where('a.id_ref_delete = 0');
		$this->db->order_by('urut', 'asc');

		$query = $this->db->get($this->tableAs);
		if($isTotal==0){
			$data = $query->result_array();
		} else {
			return $query->num_rows();
		}

		$ttl_row = $this->records_level_2($where,1);
		return ddi_grid($data,$ttl_row);

		return query_grid($query,$alias);
	}

	function records_level_3($where=array(),$isTotal=0){
		$alias['search_name'] = 'a.menu';
		$this->db->select("a.menu as menus, a.controller as controllers, a.id, a.urut, a.id_ref_menu_admin_parents as parent");
		$this->db->where($where);
		$this->db->where('a.id_ref_delete = 0');
		$this->db->order_by('urut', 'asc');

		$query = $this->db->get($this->tableAs);
		if($isTotal==0){
			$data = $query->result_array();
		} else {
			return $query->num_rows();
		}

		$ttl_row = $this->records_level_2($where,1);
		return ddi_grid($data,$ttl_row);

		// $query	= 	"SELECT id_ref_menu_admin as id,menu as menus,controller,urut,help,code,id_ref_menu_admin_parents as parent,breadcrumb
		// 				  FROM ref_menu_admin where id_ref_menu_admin_parents =$id_ref_menu_admin_parents ";
		
		// $_GET['sort_field'] = "urut";
		// $_GET['sort_type'] = "asc";

		return query_grid($query,$alias);
	}

	


	function insert($data){
		$data['create_date'] 	= date('Y-m-d H:i:s');
		$data['id_ref_auth_user_create'] = id_user();
		$this->db->insert($this->table,array_filter($data));
		// return $this->db->insert_id();
	}

	function update($data,$id){
		$where['id'] = $id;
		$data['modify_date']             = date('Y-m-d H:i:s');
		$data['id_ref_auth_user_modify'] = id_user();
		$this->db->update($this->tableAs,$data,$where);
		return $id;
	}

	function update_batch($data){
		foreach ($data as $key => $value) {
			$data[$key]['user_id_modify'] 	= date('Y-m-d H:i:s');
			$data[$key]['modify_date'] 		= id_user();
		}
		$this->db->update_batch($this->table,$data,'id');	
	}

	function delete($id){
		$data['id_ref_delete'] = 1;
		$this->update($data,$id);
	}

	// function delete_pages($id){
	// 	$data['id_ref_delete'] = 1;
	// 	$this->update_batch($data,$id);
	// }

	function findById($id,$is_parent=0){
		if($is_parent == 1){
			$where['a.id_ref_menu_admin_parents'] = $id;

		} else{
			$where['a.id'] = $id;
		}
		// $where['a.id_ref_delete'] = 0;
		$this->db->select('a.menu as menus, a.controller, a.breadcrumb as breadcrumbs, a.img_icon, a.id,a.id_ref_menu_admin_parents');

		if($is_parent == 1){
			$this->db->where('id_ref_menu_admin_parents',$id);
			$this->db->where('a.id_ref_delete',0);
			// $this->db->where('ref_auth_pages.id_ref_menu_admin',$id);
			// $this->db->where('r',1);
			$this->db->order_by('a.id_ref_menu_admin_parents', 'asc');
			$this->db->order_by('a.urut', 'asc'); 
			// $this->db->join('ref_auth_pages', 'ref_auth_pages.id_ref_menu_admin = a.id','inner');
			return 	$this->db->get_where($this->tableAs,$where)->result_array();
		} else{
			
		return 	$this->db->get_where($this->tableAs,$where)->row_array();
		}


	}

	function findBy($where,$is_single_row=0){
		$where['id_ref_delete'] = 0;
		$this->db->select('b.id');
		if($is_single_row==1){
			$this->db->join('auth_user_group b','b.id = a.id_ref_auth_user_group', 'left');
			$this->db->where('a.id_ref_delete',0);
			// $this->db->where('ref_auth_pages.id_ref_menu_admin',$id);
			// $this->db->where('r',1);
			$this->db->order_by('a.id_ref_menu_admin_parents', 'asc');
			$this->db->order_by('a.urut', 'asc'); 
			return 	$this->db->get_where($this->tableAs,$where)->row_array();
		}
		else{
			return 	$this->db->get_where($this->tableAs,$where)->result_array();
		}
	}

	function list_group($where = array())
    {
    	
        $this->db->select('a.*');
		$this->db->where('id_ref_delete',0);
        // $data = $this->db->order_by('urut', 'asc');
        $dats = $this->db->get_where('auth_user_group a', $where)->result_array();

        foreach ($dats as $key => $value) {
			$data[$key]['id_ref_auth_user_group'] = $value['id'];
		}
        return $data;
    }

	function findByPages($where,$is_single_row=0){
		$where['id_ref_delete'] = 0;
		$this->db->select('a.id_ref_auth_user_group');
		if($is_single_row==1){
			return 	$this->db->get_where('ref_auth_pages a',$where)->row_array();
		}
		else{
			return 	$this->db->get_where('ref_auth_pages a',$where)->result_array();
		}

	}

	function delete_pages($id){
		$where['id_ref_menu_admin'] = $id;
		$data['id_ref_delete'] = 1;
		$data['modify_date']             = date('Y-m-d H:i:s');
		$data['id_ref_auth_user_modify'] = id_user();
		$this->db->update('ref_auth_pages a',$where);
		return $id;
	}

	function list_pages($where = array())
    {
    	
        $this->db->select('a.*');
		$this->db->where('r',1);
        $data = $this->db->get_where('ref_auth_pages a', $where)->result();
        return $data;
    }

}


/*
 * End of file Auth_menu_model.php
 * Location: ./application/models/Auth_menu_model.php
 */