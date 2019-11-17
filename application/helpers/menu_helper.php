<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * @file
 * fungsi-fungsi yg meng-handle menu
 * @author Agung Iskandar <agung.iskandar@gmail.com>
 */

/**
 * Generate Top menu
 * @return string html list menu
 */
function menus(){
	auth_menu();
	$CI =& get_instance();
	$CI->load->database();
	$CI->load->model('Menu_admin_model');
	$menu      = '';
	$active    = '';
	$user_sess = $CI->session->userdata('ADM_SESS');
	$id_group  = $user_sess['admin_id_ref_auth_user_group'];
	$id_user   = $user_sess['admin_id'];
	$query     = $CI->Menu_admin_model->GetMenuAdminByGroup($id_group,0);
	// print_r($CI->db->last_query());exit;


	foreach($query->result_array() as $row){
		$query2 			= $CI->Menu_admin_model->GetMenuAdminByGroup($id_group,$row['id']);
		$sub_menu			= '';
		$id_admin_menu 		= $row['id'];
		$title_admin_menu 	= $row['menu'];
		$file_admin_menu 	= $row['controller'];
		if($CI->Menu_admin_model->Cek_Has_Child($id_group,$id_admin_menu)){
			$menu .= print_menu_child($id_group,$id_admin_menu,$title_admin_menu,$active,$row['img_icon']);
		} else {
			$ctrl 			= $CI->uri->segment(2);
			$parent_data 	= $CI->db->get_where('ref_menu_admin',"controller = '$ctrl'")->row_array();
			$link 			= base_url().'apps/'.$file_admin_menu;
			if($parent_data['menu'] == $title_admin_menu){
				$class = 'active';
			} else {
				$class = '';
			}
			$menu .='<li class="current-page '.$class.'"><a href="'.$link.'"><i class="'.$row['img_icon'].'"></i><span class="hide-menu">'.$title_admin_menu.'</span></a></li>';
		}

	}
	$CI->data['base_url'] 			= base_url();
	$CI->data['menu'] 				= $menu;
	$CI->data['form'] 				= '';
	$CI->data['today'] 				= date('l, d F Y');
	$CI->data['nama_admin']			= $user_sess['admin_fullname'];
	$CI->data['current_date']		= date('d-m-Y');
	$CI->data['current_date_sql'] 	= date('Y-m-d');
	// $CI->data['id_auth_user']		= $CI->session->userdata['ADM_SESS']['admin_id_auth_user'];
	$CI->data['message'] 			= alert($CI->session->flashdata('message'));
	$ctrl							= $CI->uri->segment(1);
	if($ctrl=='apps'){
		$file = $CI->uri->segment(2);
		$ctrl = base_url().'apps/'.$file.'/';
	} else {
		$file = $ctrl;
		$ctrl = base_url().$ctrl.'/';
	}
	$CI->data['menu_name']			= db_get_one('ref_menu_admin','menu',"controller = '$file'");
	$CI->data['this_controller']	= $ctrl;
	$id_menu = db_get_one('ref_menu_admin','id_ref_menu_admin_parents',"controller = '$file' and id_ref_menu_admin_parents != 0");
	$parent	 = db_get_one('ref_menu_admin','menu',"id = '$id_menu'");
	if($id_menu > 0) {
		$grup 	= $user_sess['admin_id_ref_auth_user_group'];
		$sql 	= "SELECT menu AS menuz, controller
		FROM ref_menu_admin a, ref_auth_pages b WHERE a.id_ref_menu_admin_parents = '$id_menu'
		AND a.id = b.id_ref_menu_admin
		AND b.id_ref_auth_user_group = '$grup'
		AND b.r = 1";
		$left_menu =  $CI->db->query($sql)->result_array();
	} else {
		$left_menu =  array();
	}

	$now = date('Y-m-d');
	$CI->data['if_sub_menu'] 	= (count($left_menu) > 0 ) ? '' : 'invis';
	$CI->data['left_menu'] 		= $left_menu;
	$CI->data['parent_menu']	= $parent;
}

function print_menu_child($id_group,$id_admin_menu,$title_admin_menu,$active='',$img_icon=''){
	$CI =& get_instance();
	$CI->load->database();
	$CI->load->model('Menu_admin_model');
	$ctrl = $CI->uri->segment(2);
	$data = $CI->db->get_where('ref_menu_admin',"controller = '$ctrl'")->row_array();
	if($data['id_ref_menu_admin_parents'] != ''){
		$id_parent_menu = $data['id_ref_menu_admin_parents'];
		$parent = $CI->db->get_where('ref_menu_admin',"id =$id_parent_menu")->row_array();
		if($parent['id_ref_menu_admin_parents'] != ''){
			$parent_lagi = $CI->db->get_where('ref_menu_admin',"id = '$parent[id_ref_menu_admin_parents]'")->row_array();
			$parent_name_child = $parent_lagi['menu'];
		}
		$parent_name = $parent['menu'];
	}

	if($parent_name == $title_admin_menu or $parent_name_child='' == $title_admin_menu){
		$class='active';
	} else {
		$class ='';
	}
	$sub_menu 	= '';
	$sub_menu 	.= '<li class="menu-item-has-children '.$class.' '.$active.'">';
	$sub_menu 	.= '<a href="javascript:void(0);"><i class="'.$img_icon.'"></i> <span class="hide-menu">'.$title_admin_menu.'</span></a>';
	$sub_menu 	.= '<ul class="list-unstyled sub-menu">';
	$query 		= $CI->Menu_admin_model->GetMenuAdminByGroup($id_group,$id_admin_menu);
	foreach ($query->result_array() as $row){
		$id_admin_menu 		= $row['id'];
		$title_admin_menu 	= $row['menu'];
		$file_admin_menu 	= $row['controller'];
		if($ctrl == $file_admin_menu){
			$class_child = 'active';
		} else {
			$class_child = '';
		}

		if($CI->Menu_admin_model->Cek_Has_Child($id_group,$id_admin_menu)){
			$sub_menu .= print_menu_child2($id_group,$id_admin_menu,$title_admin_menu);
		} else {
			$link = base_url().'apps/'.$file_admin_menu;
			$sub_menu .= '<li class="'.$class_child.'"><a href="'.$link.'">'.$title_admin_menu.'</a></li>';
		}
	}
	$sub_menu .='</ul></li>';
	return $sub_menu;
}


function print_menu_child2($id_group,$id_admin_menu,$title_admin_menu){
	$CI =& get_instance();
	$CI->load->database();
	$CI->load->model('Menu_admin_model');
	$ctrl = $CI->uri->segment(2);
	$data = $CI->db->get_where('ref_menu_admin',"controller = '$ctrl'")->row_array();
	$active = '';
	if($data['id_ref_menu_admin_parents'] != ''){
		$id_parent_menu = $data['id_ref_menu_admin_parents'];
		$parent = $CI->db->get_where('ref_menu_admin',"id =$id_parent_menu")->row_array();
		if($parent['id_ref_menu_admin_parents'] != ''){
			$parent_lagi = $CI->db->get_where('ref_menu_admin',"id = '$parent[id_ref_menu_admin_parents]'")->row_array();
		}
		$parent_name=$parent['menu'];
	}

	if($parent_name == $title_admin_menu){
		$class='active';
	} else {
		$class ='';
	}

	$sub_menu = '';
	$sub_menu .='<li class="menu-item-has-children '.$class.' '.$active.'"> ';
	$sub_menu .='<a href="javascript:void(0);">'.$title_admin_menu.'</a>';
	$sub_menu .='<ul class="list-unstyled sub-menu">';
	$query = $CI->Menu_admin_model->GetMenuAdminByGroup($id_group,$id_admin_menu);
	foreach ($query->result_array() as $row){
		$id_admin_menu 		= $row['id'];
		$title_admin_menu 	= $row['menu'];
		$file_admin_menu 	= $row['controller'];
		if($ctrl == $file_admin_menu){
			$class_child = 'active';
		} else {
			$class_child = '';
		}

		if($CI->Menu_admin_model->Cek_Has_Child($id_group,$id_admin_menu)){
			$sub_menu .= print_menu_child2($id_group,$id_admin_menu,$title_admin_menu);
		} else {
			$link = base_url().'apps/'.$file_admin_menu;
			$sub_menu .= '<li class='.$class_child.'><a href="'.$link.'">'.$title_admin_menu.'</a></li>';
		}
	}
	$sub_menu .= '</ul></li>';
	return $sub_menu;
}

/**
 * create HTML Item Menu
 * @param $menu string nama menu
 * @param $file string link menu
 * @param $sub_menu (optional) string html submenu
 * @return item menu dengan sub menu(jika ada)
 */
function item_menu($menu,$file,$sub_menu=''){
	$link 	= ($file != '#') ? base_url().'apps/'.$file:$file;
	return '<li>
		<a class="submenu" title="'.$menu.'" href="'.$link.'">
		<span class="text">'.$menu.'</span></a>'.$sub_menu.'	
	</li>';
}

function breadcrumb($name='',$link=''){
	$CI =& get_instance();
	$ctrl = $CI->uri->segment(2);
	$breadcrumb 			= '';
	$CI->data['breadcrumb'] = '';
	if($name != ''){
		$breadcrumb .= ($link != '') ? " &raquo <a href='$link'>$name</a>" : " &raquo $name";
	} else {
		$parent_name = "";
		$data = $CI->db->get_where('ref_menu_admin',"controller = '$ctrl'")->row_array();
		$name_ctr = $data['breadcrumb'];
		if($data['id_ref_menu_admin_parents'] != ''){
			$id_parent_menu=$data['id_ref_menu_admin_parents'];
			$link_data = '';
			$parent = $CI->db->get_where('ref_menu_admin',"id =$id_parent_menu")->row_array();
			if($parent['id_ref_menu_admin_parents'] != ''){
				$parent_lagi = $CI->db->get_where('ref_menu_admin',"id = '$parent[id_ref_menu_admin_parents]'")->row_array();
				$breadcrumb .= link_breadcrumb($parent_lagi['controller'],$parent_lagi['breadcrumb']);	    
			}
			$parent_name = $parent['breadcrumb'];
		}

		if($parent_name){
			$breadcrumb .= "<li class='breadcrumb-item'><a href='#'>$parent_name</a></li>";
		}

		if($name_ctr){
			$breadcrumb .= "<li class='breadcrumb-item active'>$name_ctr</li>";
		}
	}
	if($ctrl == 'home') {$breadcrumb = '';}
	$CI->data['breadcrumb_text'] = ($ctrl == 'home') ? APP_NAME : ('<li class="breadcrumb-item"><a href='.base_url().'>' .APP_NAME . '</a></li>' . strip_tags($breadcrumb));
	$CI->data['breadcrumb'] .= ($ctrl == 'home') ? APP_NAME : ('<li class="breadcrumb-item"><a href='.base_url().' title="Home"><i class="material-icons">home</i></a></li>' . $breadcrumb);
	$CI->data['ctrl'] = $ctrl;
	return $CI->data['breadcrumb'];
}

function link_breadcrumb($link,$name){
	if($name != ''){	 
		if($link =='#'){
			return ' <li> '.$name. '</li>';
		} else {
			return "  <li> <a href='".base_url()."apps/$link'>$name</a></li>";
		}
	}
}

function generate_title(){
	$CI =& get_instance();
	$ctrl 	= $CI->uri->segment(2);
	$data 	= $CI->db->get_where('ref_menu_admin',"controller = '$ctrl'")->row_array();
	$parent_name 	= $data['breadcrumb'];
	return $parent_name;
}

function menu_frontend()
{
	$CI = &get_instance();
	$data 	= $CI->db->get_where('frontend_menu',['id_parent'=>null])->result_array();
	print_r($data);
	exit;

}