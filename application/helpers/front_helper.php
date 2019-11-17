<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


function front_footer()
{
	$CI =& get_instance();
	return $CI->parser->parse("front/component/footer.html", $CI->data, true);
}
function front_header_top()
{
	$CI =& get_instance();
	foreach ($CI->data->web_config as $key => $value) {
		$CI->data[$key] = $value;
	}	

	return $CI->parser->parse("front/component/header_top.html", $CI->data, true);
}
function front_header()
{
	$CI =& get_instance();
	foreach ($CI->data->web_config as $key => $value) {
		$CI->data[$key] = $value;
	}
	$CI->data['menu'] = front_menu();
	return $CI->parser->parse("front/component/header.html", $CI->data, true);
}
function front_menu()
{
	
	$CI =& get_instance();
	$menu = $CI->db->select('id,name, extra_param,id_ref_module')
	->get_where('frontend_menu', ['id_parent'=>null])
	->result_array();
	foreach ($menu as $key => $value) {
		$sub_menu = $CI->db->select('id,name, extra_param,id_ref_module')
		->get_where('frontend_menu', ['id_parent' => $value['id']])
		->result_array();
		$check = !empty($sub_menu);
		foreach ($sub_menu as $key1 => $value1) {
			$sub_menu[$key1]['sub_link'] = base_url($value1['extra_param']);
			$sub_menu[$key1]['sub_name'] = $value1['name'];
			$sub_menu[$key1]['sub_hide'] = '';
		}
		$menu[$key]['link'] = $check ? '#' : base_url($value['extra_param']);
		if ($check) {
			$menu[$key]['sub'][$key]['sub_menu'] = $sub_menu ;
		}else{
			$menu[$key]['sub'][] = ['sub_hide'=>'hide', 'sub_menu'=>[]];
		}
	}
	return $menu;
}