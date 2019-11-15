<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman Contactus
 * @author 	Anisa Fitri <anisa@deptechdigital.com>
 * 
 */

class Contactus extends CI_Controller {
	function __construct(){
		parent::__construct();
		$this->load->model('ContactUsModel');
		$this->load->model('ContactUsReplyModel');
	}
	function index(){
		render('apps/contactus/index',$data,'main-apps');
	}
	function process($idedit=''){
		$this->layout 			= 'none';
		$post 					= purify($this->input->post());
		$ret['error']			= 1;
		$where['uri_path']		= $post['uri_path'];
		if($idedit){
			$where['id !=']		= $idedit;
		}
		$unik 					= $this->ContactUsModel->findBy($where);
		$this->form_validation->set_rules('page_name', '"page Name"', 'required'); 
		$this->form_validation->set_rules('uri_path', '"Page URL"', 'required'); 
		$this->form_validation->set_rules('teaser', '"Teaser"', 'required'); 
		$this->form_validation->set_rules('page_content', '"Content"', 'required'); 
		if ($this->form_validation->run() == FALSE){
			$ret['message']  = validation_errors(' ',' ');
		}
		// else if($unik){
		// 	$ret['message']	= "Page URL $post[uri_path] already taken";
		// }
		else{   
			$this->db->trans_start();   
				if($idedit){
					auth_update();
					$ret['message'] = 'Update Success';
					$act			= "Update Pages";
					if(!$post['img']){
						unset($post['img']);
					}
					$this->ContactUsModel->update($post,$idedit);
				}
				else{
					auth_insert();
					$ret['message'] = 'Insert Success';
					$act			= "Insert Pages";
					$this->ContactUsModel->insert($post);
				}
			detail_log();
			insert_log($act);
			$this->db->trans_complete();
			set_flash_session('message',$ret['message']);
			$ret['error'] = 0;
		}
		echo json_encode($ret);
	}
	function records(){
		$data = $this->ContactUsModel->records();
		foreach ($data['data'] as $key => $value) {
			$data['data'][$key]['hide_recject'] = "";
			$data['data'][$key]['hide_view'] = "";
			$message = substr($value['komentar'],0,150);
			if(strlen($value['komentar']) > 150){
				$message .= ' ...';
			}
			$this->db->order_by('id','desc');
			$data_reply = $this->ContactUsReplyModel->findBy(array('id_ref_contact_us'=>$value['id']), 1);
			$data['data'][$key]['last_answer'] = $data_reply['message'];
			if($data_reply){
				$data['data'][$key]['status'] 		= 'Replied';
				$data['data'][$key]['tdcolor'] 		= 'success';
				$data['data'][$key]['hide_recject'] = "hide";
			} else {
				$data['data'][$key]['status'] 	= '<a href="#" class="tangan detail-hubungi-kami " data-id="'. $value['id'].'">Reply</a>';
				$data['data'][$key]['tdcolor'] 	= 'warning';
			}
			if($value['is_delete'] == 2){
				$data['data'][$key]['tdcolor']			= "none";
				$data['data'][$key]['status'] 			= "Rejected";
				$data['data'][$key]['hide_recject'] 	= "hide";
			}
			$data['data'][$key]['komentar'] = $message;
		}
		render('apps/contactus/records',$data,'blank');
	}
	function detail($id){
		$data = $this->ContactUsModel->findById($id);
		$data['reply'] = $this->ContactUsReplyModel->findBy(array('id_ref_contact_us'=>$id));
		foreach ($data['reply'] as $key => $value) {
			$data['reply'][$key]['create_datex'] 	= iso_date_time($value['create_date']);
			$data['reply'][$key]['messagex'] 		= $value['message'];
		}

		render('apps/contactus/detail',$data,'blank');
	}
	function reply(){
		$post = $this->input->post();
		if($post){
			$contactus        = $this->ContactUsModel->findById($post['id_ref_contact_us']);
			$data['fullname'] = $contactus['fullname'];
			$data['date']     = iso_date_time($contactus['create_date']);
			$data['question'] = $contactus['message'];
			$data['content']  = $post['message'];
			$data             = array_merge($data,$contactus);
			$sent             = sent_email_with_template('CUR',$data,$contactus['email']);
			$this->ContactUsReplyModel->insert($post);
			echo json_encode($data);
		}
	}
	function del(){
		auth_delete();
		$id = $this->input->post('iddel');
		$this->ContactUsModel->reject($id);
		detail_log();
		insert_log("Reject Contact Us");
	}
	function export_to_excel(){
		$post = $this->input->post();
		$alias['search_hp'] 			= 'a.handphone';
		where_grid($post,$alias);
		$data['data'] = $this->ContactUsModel->findBy('');
		$i=1;
		foreach ($data['data'] as $key => $value) {
			$data['data'][$key]['nomor'] = $i++;
			$this->db->select('a.create_date as reply_date, username, message as reply_message');
			$data_reply = $this->ContactUsReplyModel->findBy(array('id_ref_contact_us'=>$value['id']));
			if(count($data_reply) > 1){
				$data['data'][$key]['status'] = 'Replied';
			} else {
				$data['data'][$key]['status'] = 'Reply';
			}
			if($value['is_delete'] == 2){
				$data['data'][$key]['status'] = 'Rejected';
			}
			$data['data'][$key]['data_reply'] = $data_reply;
		}

		$table = $this->parser->parse('apps/contactus/export_to_excel.html',$data,true);


		export_to('contactus_'.date('d.m.Y.h.i.s').'.xls', $table);
	} 
}

/* End of file contactus.php */
/* Location: ./aplikasi/controllers/apps/contactus.php */