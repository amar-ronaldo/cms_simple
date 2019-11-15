<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman Logs
 * @author  Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Logs extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('Logs_model');
    }

    function index(){
        $data = $this->Logs_model->findBy();
        render('apps/logs/index',$data,'main-apps');
    }

    function records(){
        $user_group_id = id_user('id_ref_auth_user_group');
        if($user_group_id!=1 || $user_group_id!=2){
            $user_id = id_user();
            $this->db->where('a.id_ref_auth_user', $user_id);
        }
        $data = $this->Logs_model->records();
        foreach ($data['data'] as $key => $value) {
            $data['data'][$key]['create_date'] = iso_date_time($value['log_date']);
        }
        render('apps/logs/records',$data,'blank');
    }

}

/* End of file Logs.php */
/* Location: ./application/controllers/Logs.php */