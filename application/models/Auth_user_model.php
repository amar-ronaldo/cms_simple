<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Auth_user_model extends CI_Model{

	var $table 		= 'ref_auth_user';
	var $tableAs 	= 'ref_auth_user a';

	function __construct(){
		parent::__construct();
	}    

	function records($where=array(),$isTotal=0){
		$alias['search_name']       = 'a.name';
		$alias['search_group_name'] = 'b.id';
		$alias['search_sex']        = 'c.id';


	 	query_grid($alias, $isTotal);
		$this->db->select("a.*, b.name as group_name, c.name as gender");
		$this->db->where('a.id_ref_delete',0);
		$this->db->join('ref_auth_user_group b','b.id = a.id_ref_auth_user_group');
		$this->db->join('ref_gender c','c.id = a.id_ref_gender');

		$query = $this->db->get($this->tableAs);
		if($isTotal==0){
			$data = $query->result_array();
		} else {
			return $query->num_rows();
		}

		$ttl_row = $this->records($where,1);
		return ddi_grid($data,$ttl_row);
	}

	function insert($data=array()){
		$data['create_date'] 	= date('Y-m-d H:i:s');
		$data['id_ref_auth_user_create'] = id_user();
		$this->db->insert($this->table, array_filter($data));
		return $this->db->insert_id();
	}

	function update($data=array(),$id=''){
		$where['id'] 			= $id;
		$data['id_ref_auth_user_modify'] = id_user();
		$data['modify_date'] 	= date('Y-m-d H:i:s');
		$this->db->update($this->table, $data, $where);
		return $id;
	}

	function delete($id=''){
		$data['id_ref_delete'] = 1;
		$this->update($data, $id);
	}

	function findById($id=''){
		$where['a.id'] = $id;
		$where['a.id_ref_delete'] = 0;
		$this->db->select('a.id, a.id_ref_gender, a.fullname, a.username, a.password, a.id_ref_auth_user_group, a.email, a.phone, a.img, b.name user_group_name, c.name as gender');
		$this->db->join('ref_auth_user_group b','b.id = a.id_ref_auth_user_group');
		$this->db->join('ref_gender c','c.id = a.id_ref_gender');
		return 	$this->db->get_where($this->tableAs,$where)->row_array();
	}

	function fetchRow($where=array()){
		return $this->findBy($where, 1);
	}
    
    function findBy($where=array(),$is_single_row=0,$is_total=0){
		$where['a.id_ref_delete'] = 0;
		$this->db->select('a.id, a.id_ref_gender, a.fullname, a.username, a.password, a.id_ref_auth_user_group, a.email, a.phone, a.img, b.name user_group_name, c.name as gender');
		$this->db->join('ref_auth_user_group b','b.id = a.id_ref_auth_user_group');
		$this->db->join('ref_gender c','c.id = a.id_ref_gender');
		$query = $this->db->get_where($this->tableAs, $where);

		if ($is_total == 1){
            return $query->num_rows();
        } else {
            if ($is_single_row == 1){
                return $query->row_array();
            } else {
                return $query->result_array();
            }
        }
	}

	function check_login($userid='',$password=''){
		$ret['status'] 	= 0;
		$data['ip'] 	= $_SERVER['REMOTE_ADDR'];

		if ($userid!='' && $password!=''){
			$query = $this->findBy(array('username'=>$userid),1);
			if($query){
				$data['id_ref_auth_user'] = $query['id'];
				$userpass = $query['password'];
				if (md5($password) == $userpass && $password != "") {
					$this->load->library("session");
					$user_sess = array(
						'admin_id' => $query['id'],
						'admin_id_ref_auth_user_group' => $query['id_ref_auth_user_group'],
						'admin_gender' => $query['gender'],
						'admin_fullname' => $query['fullname'],
						'admin_username' => $query['username'],
						'admin_email' => $query['email'],
						'admin_phone' => $query['phone'],
						'admin_img' => get_profile_picture_url($query['img']),
					);
					$this->load->model('Login_transaction_model');
					$this->Login_transaction_model->check_user($user_sess);
					$this->session->set_userdata('ADM_SESS',$user_sess);
					$this->session->unset_userdata('MEM_SESS');
					$data['activity'] 	= "Login";
					$ret['status'] 		= 1;
					$ret['msg'] 		= "Success.";
					$ret['redirect'] 	= base_url()."apps/home";
				} else {
					$data['activity'] 	= "Incorrect password";
					$ret['msg'] 		= "Incorrect password.";
				}
			} else {
				$data['activity'] 	= "User not found : $userid";
				$ret['msg'] 		= "User ID or password doesn't match.";
			}
		} else {
			$ret['msg'] = "User ID and password is required.";
		}
		access_log_user($data);
		return $ret;
	}

	// function auth_pages($where,$total='',$sidx='',$sord='',$mulai='',$end=''){
	// 	$mulai = $mulai -1;
	// 	if ($total==1){
	// 		$sql	= "SELECT count(*) ttl FROM auth_user_grup ";//where 1 $where";
	// 		$data	= $this->db->query($sql)->row()->ttl;
	// 	} else {
	// 		$sql	= "SELECT id_ref_auth_user_group id, grup FROM auth_user_grup ";//where 1
	// 		// $where order by $sidx $sord limit $mulai,$end ";
	// 		$dt	= $this->db->query($sql)->result_array();
	// 		$n 	= 0;
	// 		foreach($dt as $dtx){
	// 			$data[$n]['id'] 	= $dtx['id'];
	// 			$data[$n]['edit'] 	=  edit_grid($dtx['id']);
	// 			$data[$n]['del'] 	= ($dtx['id'] <= 10) ? '' : delete_grid($dtx['id']);
	// 			$data[$n]['grup'] 	= $dtx['grup'];
	// 			$data[$n]['total'] 	= $this->db->get_where('auth_user',array('id_ref_auth_user_group'=>$dtx['id']))->num_rows();
	// 			++$n;
	// 		}
	// 	}
	// 	return $data;
	// }

}

/*
 * End of file Auth_user_model.php
 * Location: ./application/models/Auth_user_model.php
 */