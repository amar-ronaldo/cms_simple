<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Tags_model extends CI_Model{

	var $table 		= 'ref_tags';
	var $tableAs 	= 'ref_tags a';
	
	function __construct(){
		parent::__construct();
	}

	function records($where=array(),$isTotal=0){
		$alias['search_title'] = 'a.name';

	 	query_grid($alias, $isTotal);
		$this->db->select("a.*");
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

    function tagsCounter($ids){
		if($ids){
			$this->db->query("update $this->table set tags_count = tags_count + 1 where id in($ids)");
		}
	}
	function hitsCounter($uri_path){
		if($uri_path){
			$this->db->query("update $this->table set hits = hits + 1 where uri_path = '$uri_path' and is_delete=0");
		}
	}

	function log_tag_click($uri_path,$id_tags){
		$date_now 	= date('Y-m-d H:i:s');
	    //to table t_log_tag_click
	    $array_log_login = array(
			'id_user' => get_member_login_data(),
			'create_date' => $date_now,
			'ipaddress' => $_SERVER['REMOTE_ADDR'],
			'ismobile' => $_SERVER['HTTP_USER_AGENT'],
			'uri_path' => $uri_path,
			'id_tags' => $id_tags
	    );
	    $query = $this->db->insert('t_log_tag_click', $array_log_login);
	}

}

/*
 * End of file Tags_model.php
 * Location: ./application/models/Tags_model.php
 */