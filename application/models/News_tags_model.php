<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class News_tags_model extends CI_Model{

	var $table 		= 'news_tags';
	var $tableAs 	= 'news_tags a';
	
	function __construct(){
		parent::__construct();
	}

	function records($where=array(),$isTotal=0){
		$alias['search_tags_name']     = 'b.name';
		$alias['search_tags_uri_path'] = 'b.uri_path';
		$alias['search_news_title']    = 'c.title';

	 	query_grid($alias, $isTotal);
		$this->db->select("a.*, b.name as tags_name, b.uri_path as tags_uri_path, c.title as news_title");
		$this->db->join('ref_tags b','a.id_ref_tags = b.id','left');
		$this->db->join('ref_news c','a.id_ref_news = c.id','left');
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

    function records_tags_all($where=array(),$isTotal=0){

		$this->db->select("a.*");
		$this->db->where('a.id_ref_delete',0);
		$query = $this->db->get('ref_tags a');

		if($isTotal==0){
			$data = $query->result_array();
		}
		else{
			return $query->num_rows();
		}
		return $data;
	}
}

/*
 * End of file News_tags_model.php
 * Location: ./application/models/News_tags_model.php
 */