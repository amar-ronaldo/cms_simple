<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
/**
 * Controller untuk handle halaman auth menu
 * @author  Anisa Fitri <anisa@deptechdigital.com>
 * 
 */

class Email_config extends CI_Controller
{

    public function __construct(){
        parent::__construct();
        $this->load->model('Email_config_model');
    }

    public function index(){
        $data = $this->Email_config_model->findBy(array(),1);
        if($data['type']=='smtp'){ $data['hide'] = 'hide'; } else { $data['hide'] = ''; }
        render('apps/email-config/index',$data,'main-apps');
    }

    public function process($id=''){
        $ret['error']   = 1;
        $post           = $this->input->post();
        if($id){
            $this->Email_config_model->update($post,$id);
            $ret['error']   = 0;
            $ret['message'] = 'Update Success';
        } else {
            $this->load->helper('mail');
            $email['subject']   = 'Test Configuration Email';
            $email['content']   = 'Success sent at '.date('Y/m/d H:i:s');
            $email['to']        = $post['email'];

            $sent_email         = sent_mail($email,$post);
            $ret['message']     = $sent_email['message'];
            $ret['error']       = 0;
        }
        echo json_encode($ret); exit;
    }
}

/* End of file emaiL_config.php */
/* Location: ./application/controllers/email_config.php */