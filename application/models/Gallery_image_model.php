<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Gallery_image_model extends CI_Model{

	var $table 		= 'ref_gallery_image';
	var $tableAs 	= 'ref_gallery_image a';
	
	function __construct(){
		parent::__construct();
	}

	function insert_all($id,$data){
		$insert =[];
		foreach ($data as $key => $value) {
			$insert[] =[
				'id_ref_gallery' => $id,
				'img' => $value
			];
		}
		$this->delete_all($id);
		$this->db->insert_batch($this->table,array_filter($insert));
	}

	function delete_all($id){
		$this->db->delete($this->table, ['id_ref_gallery'=> $id]);
	}
	function findById($id){
		$where['id_ref_gallery'] = $id;
		return 	$this->db->get_where($this->tableAs,$where)->result_array();
	}
}

/*
 * End of file News_model.php
 * Location: ./application/models/News_model.php
 */