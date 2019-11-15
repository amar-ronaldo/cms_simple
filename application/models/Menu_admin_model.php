<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Menu_admin_model extends CI_Model {
	
	var $table 		= 'ref_menu_admin';
	var $tableAs 	= 'ref_menu_admin a';

	function __construct(){
		parent::__construct();
	}

	function GetMenuAdminByFile($file){
		$this->db->where("file",$file);
		$this->db->limit(1);
		$this->db->order_by('id','desc');
		$query = $this->db->get($this->table);
		return $query;
	}

	function GetMenuAdminByGroup($group,$parent=0){
		 $this->db->select('a.* , b.* ,a.id as id');
		 $this->db->where('id_ref_menu_admin_parents',$parent);
		 $this->db->where('b.id_ref_auth_user_group',$group);
		 $this->db->where('b.r',1);
		 $this->db->where('a.id_ref_delete',0);
		 $this->db->where('b.id_ref_delete',0);
		 $this->db->order_by('a.id_ref_menu_admin_parents', 'asc');
		 $this->db->order_by('a.urut', 'asc'); 
		 $this->db->join('ref_auth_pages b', 'b.id_ref_menu_admin = a.id','inner');
		 $query = $this->db->get($this->tableAs);
		 return $query;


	}
	
	function Cek_Has_Child($id_group,$id_admin_menu){
		 $this->db->select('a.* , b.* ,a.id as id');
		$this->db->where('id_ref_menu_admin_parents',$id_admin_menu);
		$this->db->where('b.id_ref_auth_user_group',$id_group);
		 $this->db->where('b.r',1);
		 $this->db->where('a.id_ref_delete',0);
		 $this->db->where('b.id_ref_delete',0);
		 $this->db->order_by('a.id_ref_menu_admin_parents', 'asc');
		 $this->db->order_by('a.urut', 'asc'); 
		 $this->db->join('ref_auth_pages b', 'b.id_ref_menu_admin = a.id','inner');
		 $query = $this->db->get($this->tableAs);
		 
		 if($query->num_rows() > 0){
			return TRUE ;
		 }else{
			return FALSE ;
		 }
	}

}

/*
 * End of file Menu_admin_model.php
 * Location: ./application/models/Menu_admin_model.php
 */