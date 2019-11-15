<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Logs_model extends CI_Model{

	var $table 		= 'access_log';
	var $tableAs 	= 'access_log a';
	
	function __construct(){
		parent::__construct();
	}

	function records($where=array(),$isTotal=0){

		 // if (!empty($_GET['search_start_date']) && !empty($_GET['search_end_date'])){
   //          $and =  'and (date(a.log_date) >= "'.$_GET['search_start_date'].'" and date(a.log_date) <= "'.$_GET['search_end_date'].'")';
   //          unset($_GET['search_start_date']);
   //          unset($_GET['search_end_date']);
   //      }
   //      else {
   //          if($_GET['search_start_date']){
   //          	$where = $this->db->where('date(a.log_date) >= "'.$_GET['search_start_date'].'"');
   //              // $and =  'and date(a.log_date) >= "'.$_GET['search_start_date'].'"';
   //              unset($_GET['search_start_date']);
   //          }
   //          if($_GET['search_end_date']){
   //          	$where = $this->db->where('date(a.log_date) <= "'.$_GET['search_end_date'].'"');
   //              // $and =  'and date(a.log_date) <="'.$_GET['search_end_date'].'"';
   //              unset($_GET['search_end_date']);
   //          } 
   //      }

		$alias['search_username'] = 'b.username';
		$alias['search_fullname'] = 'b.fullname';

	 	query_grid($alias, $isTotal);
		$this->db->select("a.*, b.username, b.fullname");
		$this->db->join('ref_auth_user b','a.id_ref_auth_user = b.id','left');

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
		// $where['a.id_ref_delete'] = 0;
		return 	$this->db->get_where($this->tableAs,$where)->row_array();
	}
	
	function findBy($where=array(),$is_single_row=0){
		// $where['id_ref_delete'] = 0;
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
 * End of file Logs_model.php
 * Location: ./application/models/Logs_model.php
 */