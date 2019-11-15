<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Model untuk handle halaman ContactUsModel
 * @author 	Anisa Fitri <anisa@deptechdigital.com>
 * 
 */

class ContactUsModel extends  CI_Model{
	var $table = 'ref_contact_us';
	var $tableAs = 'ref_contact_us a';
    function __construct(){
       parent::__construct();
    }
	function records($where=array(),$isTotal=0,$isdelete=0){
	 	query_grid($alias,$isTotal);
		$this->db->select("a.*, a.message as pesan");
		$this->db->where('a.id_ref_delete',0);
		// $this->db->join('status_publish b','b.id = a.id_status_publish');
		$query = $this->db->get($this->tableAs);

		if($isTotal==0){
			$data = $query->result_array();
		}else{
			return $query->num_rows();
		}
		$ttl_row = $this->records($where,1);
		return ddi_grid($data,$ttl_row);
	}
	function insert2($data){
		$data['create_date'] 	= date('Y-m-d H:i:s');
		$data['user_id_create'] = id_user();
		$this->db->insert($this->table,array_filter($data));
		return $this->db->insert_id();
	}
	function insert($data,$id_email_category=5){
		$data['create_date'] 	= date('Y-m-d H:i:s');
		$data['user_id_create'] = null;#visitor
		$this->load->model('contactusreceiveModel');
		$sent = $this->contactusreceiveModel->findBySent($data['id_ref_contact_us_topic']);
		$data['ref_contact_us_time'] = $this->db->get_where('ref_contact_us_time',array('id'=>$data['ref_contact_us_time_id']))->row_array()['name'];
		foreach ($sent as $key => $value) {
			sent_email_by_category($id_email_category,$data, $value['email']);
		}
		sent_email_by_category($id_email_category,$data, $data['email']);
		$user_sess_data = $this->session->userdata('MEM_SESS');
		
		unset($data['topic_name'],$data['contact_date'],$data['ref_contact_us_time']);
		$this->db->insert($this->table,array_filter($data));
		$insert_id = $this->db->insert_id();
		if($user_sess_data){
			$this->load->model('registerModel');
			$log_user_activity = array(
				'id_user'          =>  $user_sess_data['id'],
				'process_date' =>  date('Y-m-d H:i:s'),
				'id_log_category'   =>  41,
				'id_ref_contact_us' => $id_news
			);
			$this->registerModel->log_user_activity($log_user_activity);
		}
		return $insert_id;
	}
	function update($data,$id){
		$where['id'] = $id;
		$data['user_in_modify'] = id_user();
		$data['modify_date'] 	= date('Y-m-d H:i:s');
		$this->db->update($this->table,$data,$where);
		return $id;
	}
	function reject($id){
		$data['id_ref_delete'] = 2;
		$this->update($data,$id);
	}
	function findById($id){
		$where['a.id'] = $id;
		$where['id_ref_delete !='] = 1;
		$this->db->select('a.*');
		// $this->db->join('contact_us_topic b',"b.id = a.id_ref_contact_us_topic");
		return 	$this->db->get_where($this->table.' a',$where)->row_array();
	}
	function findBy($where,$is_single_row=0){
		$where['id_ref_delete !='] = 1;
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
	function export_to_excel($where,$is_single_row=0){
		$this->db->select("a.*,b.name as topic,a.message as komentar");
		$this->db->where('a.id_ref_delete !=',1);
		$this->db->join('contact_us_topic b','b.id = a.id_ref_contact_us_topic');

		if($is_single_row==1){
			return $this->db->get_where($this->tableAs,$where)->row_array();
		}
		else{
			return $this->db->get_where($this->tableAs,$where)->result_array();
		}	
	}
}

/* End of file ContactUsModel.php */
/* Location: ./application/models/ContactUsModel.php */