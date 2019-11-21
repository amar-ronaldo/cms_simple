<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Dosen_model extends CI_Model
{

	var $table 		= 'ref_dosen';
	var $tableAs 	= 'ref_dosen a';

	function __construct()
	{
		parent::__construct();
	}

	function records($where = array(), $isTotal = 0)
	{
		$alias['search_id'] = 'a.id';
		$alias['search_name'] = 'a.name';
		$alias['search_dosen_category'] = 'b.id';
		$alias['search_status'] = 'c.id';
		$alias['search_writer'] = 'd.fullname';
		$alias['search_language'] = 'e.id';

		query_grid($alias, $isTotal);
		$this->db->select("a.*,b.name as dosen_category,b.uri_path as uri_path_category,c.name as status,d.fullname as writer,e.name as language,f.name as dosen_status");
		$this->db->join('ref_dosen_category b', 'b.id=a.id_ref_dosen_category', 'left');
		$this->db->join('ref_status_publish c', 'c.id=a.id_ref_status_publish', 'left');
		$this->db->join('ref_auth_user d', 'd.id=a.id_ref_auth_user_create', 'left');
		$this->db->join('ref_language e', 'e.id=a.id_ref_language', 'left');
		$this->db->join('ref_dosen_status f', 'f.id=a.id_ref_dosen_status', 'left');
		$this->db->where("a.id_ref_delete", 0);

		$query = $this->db->get_where($this->tableAs, $where);
		if ($isTotal == 0) {
			$data = $query->result_array();
		} else {
			return $query->num_rows();
		}

		$ttl_row = $this->records($where, 1);
		return ddi_grid($data, $ttl_row);
	}

	function insert($data)
	{
		$data['create_date']             = date('Y-m-d H:i:s');
		$data['id_ref_auth_user_create'] = id_user();
		$this->db->insert($this->table, array_filter($data));
		return $this->db->insert_id();
	}

	function update($data, $id)
	{
		$where['id']                     = $id;
		$data['id_ref_auth_user_modify'] = id_user();
		$data['modify_date']             = date('Y-m-d H:i:s');
		$this->db->update($this->table, $data, $where);
		return $id;
	}

	function findById($id)
	{
		$where['a.id'] = $id;
		$where['a.id_ref_delete'] = 0;
		$this->db->select("a.*,b.name as dosen_category,b.uri_path as uri_path_category,c.name as status,d.fullname as writer,e.name as language,f.name as dosen_status");
		$this->db->join('ref_dosen_category b', 'b.id=a.id_ref_dosen_category', 'left');
		$this->db->join('ref_status_publish c', 'c.id=a.id_ref_status_publish', 'left');
		$this->db->join('ref_auth_user d', 'd.id=a.id_ref_auth_user_create', 'left');
		$this->db->join('ref_language e', 'e.id=a.id_ref_language', 'left');
		$this->db->join('ref_dosen_status f', 'f.id=a.id_ref_dosen_status', 'left');
		return 	$this->db->get_where($this->tableAs, $where)->row_array();
	}

	function findBy($where = array(), $is_single_row = 0)
	{
		$where['a.id_ref_delete'] = 0;
		$this->db->select("a.*,b.name as dosen_category,b.uri_path as uri_path_category,c.name as status,d.fullname as writer,e.name as language,f.name as dosen_status");
		$this->db->join('ref_dosen_category b', 'b.id=a.id_ref_dosen_category', 'left');
		$this->db->join('ref_status_publish c', 'c.id=a.id_ref_status_publish', 'left');
		$this->db->join('ref_auth_user d', 'd.id=a.id_ref_auth_user_create', 'left');
		$this->db->join('ref_language e', 'e.id=a.id_ref_language', 'left');
		$this->db->join('ref_dosen_status f', 'f.id=a.id_ref_dosen_status', 'left');
		if ($is_single_row == 1) {
			return 	$this->db->get_where($this->tableAs, $where)->row_array();
		} else {
			return 	$this->db->get_where($this->tableAs, $where)->result_array();
		}
	}

	function fetchRow($where)
	{
		return $this->findBy($where, 1);
	}

	function delete($id)
	{
		$data['id_ref_delete'] = 1;
		$this->update($data, $id);
	}
	function records_buku($id_dosen)
	{
		$tabel = 'ref_dosen_buku a';
		// query_grid($alias, $isTotal);
		$where['a.id_ref_dosen'] = $id_dosen;
		$this->db->select("a.*");
		$this->db->where("a.id_ref_delete", 0);

		$query = $this->db->get_where($tabel, $where);
		$data = $query->result_array();
		return $data;
	}
	function records_jurnal($id_dosen)
	{
		$tabel = 'ref_dosen_jurnal a';
		// query_grid($alias, $isTotal);
		$where['a.id_ref_dosen'] = $id_dosen;
		$this->db->select("a.*");
		$this->db->where("a.id_ref_delete", 0);

		$query = $this->db->get_where($tabel, $where);
		$data = $query->result_array();
		return $data;
	}
	function records_karya($id_dosen)
	{
		$tabel = 'ref_dosen_karya a';
		// query_grid($alias, $isTotal);
		$where['a.id_ref_dosen'] = $id_dosen;
		$this->db->select("a.*");
		$this->db->where("a.id_ref_delete", 0);

		$query = $this->db->get_where($tabel, $where);
		$data = $query->result_array();
		return $data;
	}
	function records_kegiatan_ilmiah($id_dosen)
	{
		$tabel = 'ref_dosen_kegiatan_ilmiah a';
		// query_grid($alias, $isTotal);
		$where['a.id_ref_dosen'] = $id_dosen;
		$this->db->select("a.*");
		$this->db->where("a.id_ref_delete", 0);

		$query = $this->db->get_where($tabel, $where);
		$data = $query->result_array();
		return $data;
	}
	function records_penelitian($id_dosen)
	{
		$tabel = 'ref_dosen_penelitian a';
		// query_grid($alias, $isTotal);
		$where['a.id_ref_dosen'] = $id_dosen;
		$this->db->select("a.*");
		$this->db->where("a.id_ref_delete", 0);

		$query = $this->db->get_where($tabel, $where);
		$data = $query->result_array();
		return $data;
	}
	function records_pengabdian($id_dosen)
	{
		$tabel = 'ref_dosen_pengabdian a';
		// query_grid($alias, $isTotal);
		$where['a.id_ref_dosen'] = $id_dosen;
		$this->db->select("a.*");
		$this->db->where("a.id_ref_delete", 0);

		$query = $this->db->get_where($tabel, $where);
		$data = $query->result_array();
		return $data;
	}
	function records_penghargaan($id_dosen)
	{
		$tabel = 'ref_dosen_penghargaan a';
		// query_grid($alias, $isTotal);
		$where['a.id_ref_dosen'] = $id_dosen;
		$this->db->select("a.*");
		$this->db->where("a.id_ref_delete", 0);

		$query = $this->db->get_where($tabel, $where);
		$data = $query->result_array();
		return $data;
	}
	function records_riwayat_mengajar($id_dosen)
	{
		$tabel = 'ref_dosen_riwayat_mengajar a';
		// query_grid($alias, $isTotal);
		$where['a.id_ref_dosen'] = $id_dosen;
		$this->db->select("a.*");
		$this->db->where("a.id_ref_delete", 0);

		$query = $this->db->get_where($tabel, $where);
		$data = $query->result_array();
		return $data;
	}
	function records_riwayat_pendidikan($id_dosen)
	{
		$tabel = 'ref_dosen_riwayat_pendidikan a';
		// query_grid($alias, $isTotal);
		$where['a.id_ref_dosen'] = $id_dosen;
		$this->db->select("a.*");
		$this->db->where("a.id_ref_delete", 0);

		$query = $this->db->get_where($tabel, $where);
		$data = $query->result_array();
		return $data;
	}
}

/*
 * End of file dosen_model.php
 * Location: ./application/models/dosen_model.php
 */
