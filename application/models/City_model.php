<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class City_model extends CI_Model {

    var $table      = 'ref_city';
    var $tableAs    = 'ref_city a';

    function __construct()
    {
        parent::__construct();
    }

    function records($where = array(), $isTotal = 0)
    {
        $alias['search_kode_city'] = 'a.code_city';
        $alias['search_city']      = 'a.name';
        $alias['search_provinsi']  = 'b.name';

        query_grid($alias,$isTotal);
        $this->db->select('a.*, b.name as nama_provinsi, a.name as nama_kabupaten');
        $this->db->where("a.id_ref_delete", 0);
        // $this->db->where("a.kd_prov", 11);
        $this->db->join('ref_province b', 'a.code_province = b.code_province');

        $query = $this->db->get($this->tableAs);


        if ($isTotal == 0)
        {
            $data = $query->result_array();
        }
        else
        {
            return $query->num_rows();
        }

        $ttl_row = $this->records($where, 1);

        return ddi_grid($data, $ttl_row);
    }

    function insert($data)
    {
        $this->db->insert($this->table, array_filter($data));
        return $this->db->insert_id();
    }

    function findById($id)
    {
        $where['id_ref_delete'] = 0;
        $where['a.id'] = $id;

        return $this->db->get_where($this->table.' a', $where)->row_array();

    }

    function findBy($where=array(),$is_single_row=0)
    {
        $where['id_ref_delete'] = 0;
        $this->db->select('*');
        if($is_single_row==1){
            return  $this->db->get_where($this->tableAs,$where)->row_array();
        }
        else{
            return  $this->db->get_where($this->tableAs,$where)->result_array();
        }
    }

    function update($data, $id)
    {
        $where['id'] = $id;
        $this->db->update($this->table, $data, $where);
    }

    function updateToDelete($data,$id,$del=0)
    {
        if ($del==1)
        {
            $this->db->query("UPDATE ref_city SET id_ref_delete=N'$data[id_ref_delete]' WHERE id = $id");
        }
        else
        {
            $this->db->query("UPDATE ref_city SET page_name=N'$data[page_name]', uri_path=N'$data[uri_path]', teaser=N'$data[teaser]',
            page_content=N'$data[page_content]' WHERE id = $id");
        }
    }

    function delete($id)
    {
        $data['id_ref_delete'] = 1;
        $this->updateToDelete($data, $id, 1);

    }
    function fetchRow($where) {
        return $this->findBy($where,1);
    }

}

/*
 * End of file City_model.php
 * Location: ./application/models/City_model.php
 */