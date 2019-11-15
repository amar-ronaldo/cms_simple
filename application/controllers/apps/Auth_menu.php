<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman auth menu
 * @author 	Anisa Fitri <anisa@deptechdigital.com>
 * 
 */

class Auth_menu extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('Auth_menu_model');

	}

	function index(){
		$data['ids']          = $this->session->userdata('ses_id_parents_menu_admin');
		$data['idx']          = $this->session->userdata('ses_id_parents_menu_admin_level_3');
		$data['btn_add_only']    = btn_add_only();
		$data['btn_search_only'] = btn_search_only();
		// $data['idx']=$this->session->userdata('ses_id_parents_menu_admin_level_3');
		render('apps/auth-menu/index',$data,'main-apps');
	}

	function records_level1() {
		$data = $this->Auth_menu_model->records_level1();

		$n 	= 0;

		foreach ($data['data'] as $key => $value) {
			$id                                = $value['id'];
			$urut                              = $value['urut'];
			$parent                            = $value['parent'];
			$data['data'][$key]['up']          = ($n == 0) ? '' :  "<a class='text-primary feather feather-arrow-up ubah_urutan' style='cursor: pointer;' data-id='$id' data-urut='$urut' data-parent='$parent' data-tipe='up'></a>";
			$data['data'][$key]['down']        = (count($data['data'])-1 == $n) ? '' : "<a class='text-primary feather feather-arrow-down ubah_urutan' style='cursor: pointer;' data-id='$id' data-urut='$urut' data-parent='$parent' data-tipe='down'></a>";
			$data['data'][$key]['menus']       = $value['menus'];
			$data['data'][$key]['controllers'] = $value['controllers'];
			$data['data'][$key]['parent']      = $parent;
			$data['data'][$key]['breadcrumb']  = $value['breadcrumb'];
		++$n;
		}

		render('apps/auth-menu/records',$data,'blank');
	}

	function records_level2($id_parents_menu_admin=''){
		
		// $id_parents_menu = $this->session->set_userdata('ses_id_parents_menu_admin', $id_parents_menu_admin);

		if ($id_parents_menu_admin){
			$where = array("a.id_ref_menu_admin_parents" => $id_parents_menu_admin);
			$data = $this->Auth_menu_model->records_level_2($where, 0);

			$n 	= 0;
			foreach ($data['data'] as $key => $value) {
				$id                                = $value['id'];
				$urut                              = $value['urut'];
				$parent                            = $value['parent'];
				$data['data'][$key]['up']          = ($n == 0) ? '' :  "<a class='text-primary feather feather-arrow-up ubah_urutan' style='cursor: pointer;' data-id='$id' data-urut='$urut' data-parent='$parent' data-tipe='up'></a>";
				$data['data'][$key]['down']        = (count($data['data'])-1 == $n) ? '' : "<a class='text-primary feather feather-arrow-down ubah_urutan' style='cursor: pointer;' data-id='$id' data-urut='$urut' data-parent='$parent' data-tipe='down'></a>";
				$data['data'][$key]['menus']       = $value['menus'];
				$data['data'][$key]['controllers'] = $value['controllers'];
				$data['data'][$key]['parent']      = $parent;
				$data['data'][$key]['breadcrumb']  = $value['breadcrumb'];
				++$n;
			}
		}

		else {
			$data['data']   = array();
			$data['paging'] ='<div class="row"><div class="col-10 col-md-10 text-right pr-2"><span class="show_page"></span></div><div class="col-2 col-md-2"></div><div class="pagination"><ul class="pagination m-t-0 m-b-10  pull-right "></ul></div></div>';
		}

		// $this->session->unset_userdata('ses_id_parents_menu_admin_level_3');
		render('apps/auth-menu/records-level2',$data,'blank');
	}

	function records_level3($id_parents_menu_admin=''){
		
		if ($id_parents_menu_admin){
			$where = array("a.id_ref_menu_admin_parents" => $id_parents_menu_admin);
			$data = $this->Auth_menu_model->records_level_2($where, 0);

			$n 	= 0;
			foreach ($data['data'] as $key => $value) {
				$id                                = $value['id'];
				$urut                              = $value['urut'];
				$parent                            = $value['parent'];
				$data['data'][$key]['up']          = ($n == 0) ? '' :  "<a class='text-primary feather feather-arrow-up ubah_urutan' style='cursor: pointer;' data-id='$id' data-urut='$urut' data-parent='$parent' data-tipe='up'></a>";
				$data['data'][$key]['down']        = (count($data['data'])-1 == $n) ? '' : "<a class='text-primary feather feather-arrow-down ubah_urutan' style='cursor: pointer;' data-id='$id' data-urut='$urut' data-parent='$parent' data-tipe='down'></a>";
				$data['data'][$key]['menus']       = $value['menus'];
				$data['data'][$key]['controllers'] = $value['controllers'];
				$data['data'][$key]['parent']      = $parent;
				$data['data'][$key]['breadcrumb']  = $value['breadcrumb'];
				++$n;
			}
		}

		else {
			$data['data']   = array();
			$data['paging'] ='<div class="row"><div class="col-10 col-md-10 text-right pr-2"><span class="show_page"></span></div><div class="col-2 col-md-2"></div><div class="pagination"><ul class="pagination m-t-0 m-b-10  pull-right "></ul></div></div>';
		}

		// $this->session->unset_userdata('ses_id_parents_menu_admin_level_3');
		render('apps/auth-menu/records-level3',$data,'blank');
	}

	public function add($id=''){
		$lang_name = lang_data('name');
		
		if($id){
			$data = $this->Auth_menu_model->findById($id);

			if(!$data){ 
				die('404');  // data not found
			} 

			$process = language('update',$lang_name);

		} else {
			$process            = language('add',$lang_name);
			$data['id']         = '';
			$data['menus']       = '';
			$data['breadcrumbs']       = '';
			$data['controller'] = '';
			$data['img_icon']   = '';
		}

		$parent	= $this->db->order_by('urut')->get_where('ref_menu_admin','id_ref_menu_admin_parents = 0')->result();

		$sp ='&nbsp;&nbsp;&nbsp;&raquo;&nbsp;';
		foreach($parent as $pr){
			$parent_selected = $pr->id == $data['id_ref_menu_admin_parents'] ? 'selected' : '';
			$opt .= "<option value='$pr->id' ".$parent_selected.">$pr->menu</option>";
			$sub  = $this->db->order_by('urut')->get_where('ref_menu_admin',"id_ref_menu_admin_parents = $pr->id")->result();

			foreach($sub as $s){
				$sub_selected = $s->id == $data['id_ref_menu_admin_parents'] ? 'selected' : '';
				$opt .= "<option value='$s->id' ".$sub_selected.">$sp $s->menu</option>";
			}

		}

		$this->data['list_parents']		= $opt;

		$this->view_edit($id);
		$data['btn_process'] = btn_process($process);

		render('apps/auth-menu/add',$data,'main-apps');
	}

	
	function process(){

		$this->load->helper('htmlpurifier');
		$post    = purify($this->input->post());
		$idedit  = $post['idedit'];
		$file    = $_FILES['img_icon'];
		$fname   = $file['name'];
		$c       = $post['insert'];
		$r       = $post['view'];
		$u       = $post['update'];
		$d       = $post['delete'];
		$grup    = $post['grup'];

		unset($post['idedit']);
		unset($post['insert']);
		unset($post['view']);
		unset($post['update']);
		unset($post['delete']);
		unset($post['grup']);
		unset($post['parent_menu']);
		if($idedit){
			auth_update();
			$this->Auth_menu_model->update($post,$idedit); //update ref menu admin
			// $this->db->update('ref_menu_admin',$post,"id = '$idedit'");

			foreach($grup as $grp){
				$dt['c']                      = ($c[$grp]=='')?0 : $c[$grp];
				$dt['r']                      = ($r[$grp]=='')?0 : $r[$grp];
				$dt['u']                      = ($u[$grp]=='')?0 : $u[$grp];
				$dt['d']                      = ($d[$grp]=='')?0 : $d[$grp];
				$dt['id_ref_auth_user_group'] = $grp;
				$dt['id_ref_menu_admin']      = $idedit;
				$dt['modify_date']            = date('Y-m-d H:i:s');
				// grup baru atau sudah ada
				$check_grup_exist 		  = $this->db->select('id')->get_where('ref_auth_pages',['id_ref_auth_user_group'=>$grp,'id_ref_menu_admin' => $idedit])->row_array();
				if (!empty($check_grup_exist)) {
					$uam[] = $dt;
				}else{
					$iam[] = $dt;
				}
			}

			if (!empty($iam)) {
				$this->db->where('id_ref_menu_admin',$idedit);
				$this->db->insert_batch('ref_auth_pages',$iam, 'id_ref_auth_user_group');	// insert jika user group belum ada

			}

			$this->db->where('id_ref_menu_admin',$idedit);
			$this->db->update_batch('ref_auth_pages',$uam, 'id_ref_auth_user_group');  //update
			

		}else{

			auth_insert();
			$post['urut'] = $this->db->select_max('urut')->get_where('ref_menu_admin',"id_ref_menu_admin_parents = $post[id_ref_menu_admin_parents]")->row()->urut + 1;
			$this->Auth_menu_model->insert($post); //insert ref menu admin
			// $this->db->insert('ref_menu_admin',$post);
			$insert_id       = $this->db->insert_id();

			$id_ref_menu = $post['id_ref_menu_admin_parents'];

			foreach($grup as $grp){
				$dt['c']                      = ($c[$grp]=='')?0 : $c[$grp];
				$dt['r']                      = ($r[$grp]=='')?0 : $r[$grp];
				$dt['u']                      = ($u[$grp]=='')?0 : $u[$grp];
				$dt['d']                      = ($d[$grp]=='')?0 : $d[$grp];
				$dt['id_ref_auth_user_group'] = $grp;
				$dt['id_ref_menu_admin']      = $insert_id;
				$dt['create_date']            = date('Y-m-d H:i:s');

				$ast[] = $dt;
				$this->db->where('id_ref_menu_admin',$id_ref_menu);
			}
			
			$this->db->insert_batch('ref_auth_pages',$ast, 'id_ref_auth_user_group');
		}

		if($fname){
			$tmp_file	= $file['tmp_name'];
			$ext			= end(explode('.',$fname));
			$newFile 	= UPLOAD_DIR."$idedit.$ext";
			$this->db->update('ref_menu_admin',array('img_icon'=>"$idedit.$ext"),"id_ref_menu_admin = '$idedit'");
			move_uploaded_file($tmp_file,$newFile);
		}
		
		$ret['error'] = 0;
		echo json_encode($ret);
		// redirect('apps/auth-menu');
	}

	function del(){
		$ret['error']	= 1;
		auth_delete();
		$post  = $this->input->post();
		$iddel = $post['iddel'];
		$cek   = count($this->db->get_where('ref_menu_admin',"id_ref_menu_admin_parents ='$iddel' and id_ref_delete = 0")->result_array());

		if($cek > 0){
			echo "Masih Ada $cek Sub Menu!";
			$ret['message'] = 'Update Failed';
			$act			= "Masih Ada $cek Sub Menu!";
		}
		else{
			// $id_grup = db_get_one('ref_menu_admin','id_ref_menu_admin_parents',array('id'=>$iddel));

			$where['id']       = $iddel;
			$data['id_ref_delete'] = 1;

			$this->db->update('ref_menu_admin',$data,$where); //delete menu

			$grup = $this->db->get_where('ref_auth_user_group', 'id_ref_delete = 0')->result(); //VIEW USER GRUP

			foreach($grup as $grp){
				$dt['id_ref_delete']          = ($grp->id_ref_delete == '0') ? '1' : '0';
				$dt['id_ref_auth_user_group'] = $grp->id;
				$dt['id_ref_menu_admin']      = $iddel;

				$ast[] = $dt;
				$this->db->where('id_ref_menu_admin',$iddel);
			}

			$this->db->update_batch('ref_auth_pages',$ast, 'id_ref_auth_user_group');
			
			$ret['message'] = 'Delete Success';
			$act			= "Delete Menu Management";

			// if ($id_grup != 0) {
			// 	// $this->Auth_menu_model->delete($iddel); // delete ref menu admin
			// 	// $this->Auth_menu_model->delete_pages($iddel); // delete ref menu admin

			// 	// $data = $this->db->where('id_ref_menu_admin_parents', $id_grup)->order_by('urut','asc')->get('ref_menu_admin')->result_array();
			// 	// $urut1 = 1;
			// 	// foreach ($data as $key => $value) {
			// 	// 	if ($value['id']  != $iddel) {
			// 	// 		$update_data[] = array('id'	   		     => $value['id'],
			// 	// 								'id_ref_delete'	 => '1',
			// 	// 								'urut' 		     => $urut1++);
			// 	// 	}
			// 	// }
			// 	// $this->db->update_batch('ref_menu_admin', $update_data,'id');

			// 	// $where['id']       = $iddel;
			// 	// $data['id_ref_delete'] = 1;

			// 	// $this->db->update('ref_menu_admin',$data,$where); //delete menu

			// 	print_r($this->db->last_query);exit;


			// } else{
			// 	// $this->Auth_menu_model->delete($iddel); // delete ref menu admin
			// 	// $this->Auth_menu_model->delete_pages($iddel); // delete ref menu admin
				
			// 	$where['id']       = $iddel;
			// 	$data['id_ref_delete'] = 1;

			// 	$this->db->update('ref_menu_admin',$data,$where); //delete menu
			// 	$grup = $this->db->get_where('ref_auth_user_group', 'id_ref_delete = 0')->result(); //VIEW USER GRUP

			// 	foreach($grup as $grp){
			// 		$dt['id_ref_delete']          = ($grp->id_ref_delete == '0') ? '1' : '0';
			// 		$dt['id_ref_auth_user_group'] = $grp->id;
			// 		$dt['id_ref_menu_admin']      = $iddel;

			// 		$ast[] = $dt;
			// 		$this->db->where('id_ref_menu_admin',$iddel);
			// 	}

			// 	$this->db->update_batch('ref_auth_pages',$ast, 'id_ref_auth_user_group');
				
			// 	$ret['message'] = 'Delete Success';
			// 	$act			= "Delete Menu Management";
			// }
		}

		detail_log();
		insert_log($act);
		$this->db->trans_complete();
		$this->session->set_flashdata('message',$ret['message']);
		$ret['error'] = 0;
		
		echo json_encode($ret);
	}

	function view_edit($id=''){
		$idedit = $id;
		$list = "<table class='table table-striped' cellspacing='0'>
							<tr bgcolor='#c0c0c0'>
								<th class='ui-state-default ui-th-column ui-th-ltr bl bt bb' rowspan='2'>User Group</th>
								<th class='ui-state-default ui-th-column ui-th-ltr bt bb'>View</th>
								<th class='ui-state-default ui-th-column ui-th-ltr bt bb'>Insert</th>
								<th class='ui-state-default ui-th-column ui-th-ltr bt bb'>Update</th>
								<th class='ui-state-default ui-th-column ui-th-ltr bt bb br'>Delete</th>
							</tr>
							<tr bgcolor='#c0c0c0' align='center'>
								<td class='ui-state-default ui-th-column ui-th-ltr bb bl'><input type='checkbox' onclick=\"$('.v').attr('checked',this.checked);\"></td>
								<td class='ui-state-default ui-th-column ui-th-ltr bb bl'><input type='checkbox' onclick=\"$('.i').attr('checked',this.checked);\"></td>
								<td class='ui-state-default ui-th-column ui-th-ltr bb bl'><input type='checkbox' onclick=\"$('.u').attr('checked',this.checked);\"></td>
								<td class='ui-state-default ui-th-column ui-th-ltr bb bl br'><input type='checkbox' onclick=\"$('.d').attr('checked',this.checked);\"></td>
							</tr>
							";
		$grup = $this->db->get_where('ref_auth_user_group', 'id_ref_delete = 0')->result();
		foreach($grup as $grp){
			$dtl = $this->db->get_where('ref_auth_pages',"id_ref_auth_user_group = $grp->id and id_ref_menu_admin = $idedit")->row();

			// print_r($this->db->last_query());exit;
			$list .="<tr align='center'>
				<td class='bb bl' align='left'>$grp->name<input type='hidden' class='no_clear' value='$grp->id' name='grup[$grp->id]'></td>
				<td class='bb bl'><input type='checkbox' class='v' name='view[$grp->id]' value='1' ".(($dtl->r==1) ? 'checked' : '')."></td>
				<td class='bb bl'><input type='checkbox' class='i' name='insert[$grp->id]' value='1' ".(($dtl->c==1) ? 'checked' : '')."></td>
				<td class='bb bl'><input type='checkbox' class='u' name='update[$grp->id]' value='1' ".(($dtl->u==1) ? 'checked' : '')."></td>
				<td class='bb bl br'><input type='checkbox' class='d' name='delete[$grp->id]' value='1' ".(($dtl->d==1) ? 'checked' : '')."></td>
			</tr>";
		}

		// print_r($grp->name);exit;
		$list .="</table>";

		if (get('id')){
			echo $list;
		} else {
			$this->data['list_group'] = $list;
		}

		// $this->db->select('id_ref_menu_admin_parents,menu,controller,img_icon,breadcrumb');
		// echo implode('|',$this->db->get_where('ref_menu_admin',"id = $idedit")->row_array());
	}

	function ubah_urutan(){
		auth_update();
		$post   = $this->input->post();
		$id     = $post['id_menu'];
		$urutan = $post['urutan'];
		$tipe   = $post['tipe'];
		$parent = $post['parent'];
		if($tipe == 'down'){
			$opr 		=  '>';
			$order	=  'asc';
		}
		else{
			$opr		=  '<';
			$order	= 'desc';
		}
		$data			= $this->db->order_by('urut',$order)->get_where('ref_menu_admin',"urut $opr $urutan and id_ref_menu_admin_parents = $parent")->row();

		$this->db->update('ref_menu_admin',array('urut'=>$data->urut),"id = '$id'");
		$this->db->update('ref_menu_admin',array('urut'=>$urutan),"id = '$data->id'");
		// print_r($this->db->last_query());exit;

	}

	function remove_img(){
		auth_delete();
		$img = $this->input->post('img');
		unlink(UPLOAD_DIR.$img);
		$this->db->update('ref_menu_admin',array('img_icon'=>null),"img_icon = '$img'");
	}
	function update_auth(){
		//auth_update();
		$post 								= $this->input->post();
		$idedit 								= $post['id_editnya'];
		$c										= $post['insert'];
		$r										= $post['view'];
		$u										= $post['update'];
		$d										= $post['delete'];
		$grup									= $post['grup'];
		$this->db->delete('ref_auth_pages',"id_ref_menu_admin = $idedit");
		foreach($grup as $grp){
			$dt['c'] 						= ($c[$grp]=='') ? 0 : $c[$grp];
			$dt['r']							= ($r[$grp]=='') ? 0 : $r[$grp];
			$dt['u'] 						= ($u[$grp]=='') ? 0 : $u[$grp];
			$dt['d'] 						= ($d[$grp]=='') ? 0 : $d[$grp];
			$dt['id_ref_auth_user_group'] 	= $grp;
			$dt['id_ref_menu_admin'] 	= $idedit;
			$this->db->insert('ref_auth_pages',$dt);
		}
	}

}

/*
 * End of file Auth_menu.php
 * Location: ./application/controllers/Auth_menu.php
 */