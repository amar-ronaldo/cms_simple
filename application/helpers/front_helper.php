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
	$uri = $CI->uri->segment_array();
	$extra_param = !empty($uri) ?implode('/', $uri) :'home';
	$menu = $CI->Frontend_menu_model->findBy(['a.extra_param'=> $extra_param],1);
	do {
		$parent_menu = $CI->Frontend_menu_model->findBy(['a.id'=>$menu['id_parent']],1);
		$menu = $parent_menu;
	} 
	while ($menu['id_parent'] != 0);
	$menu_name = $menu['name'];
	
	$menu = $CI->db->select('id,name, extra_param,id_ref_module')
	->get_where('frontend_menu', ['id_parent'=>null])
	->result_array();
	foreach ($menu as $key => &$value) {
		$value['active'] = $menu_name == $value['name'] ? 'active' : '';
		$sub_menu = $CI->db->select('id,name, extra_param,id_ref_module')
		->get_where('frontend_menu', ['id_parent' => $value['id']])
		->result_array();
		$check = !empty($sub_menu);
		
		foreach ($sub_menu as $key1 => $value1) {
			$sub_menu[$key1]['sub_link'] = base_url($value1['extra_param']);
			$sub_menu[$key1]['sub_name'] = $value1['name'];
			$sub_menu[$key1]['sub_hide'] = '';
		}
		$value['link'] = $check ? '#' : base_url($value['extra_param']);
		if ($check) {
			$value['sub'][$key]['sub_hide'] = in_array($value['id'], ['4', '5', '6']) ? 'right-sub-menu': '';
			$value['sub'][$key]['sub_menu'] = $sub_menu ;
			$value['sub'][$key]['sub_menu'] = $sub_menu ;
		}else{
			$value['sub'][] = ['sub_hide'=>'hide', 'sub_menu'=>[]];
		}
	}
	return $menu;
}

function front_breadcrumb()
{
	$CI =& get_instance();
	$CI->load->model('Frontend_menu_model');

	$uri = $CI->uri->segment_array();
	$check_page_detail  = ($uri[2] == 'detail');
	// detail page
	if ($check_page_detail) {
		$extra_param = implode('/', [$uri[1], $uri[3]]);
		switch ($uri[1]) {
			case 'dosen':
				$CI->load->model('dosen_model');
				$page_now = $CI->dosen_model->findBy([
					'a.uri_path' => $uri[4]
				],1);
				$breadcrumb[] = [
					'name'=> $page_now['name'],
					'link'=> '#'
				];
			break;

			case 'gallery':
				$extra_param = implode('/', $uri);
				$CI->load->model('gallery_model');
				$page_now = $CI->gallery_model->findBy([
					'a.uri_path' => $uri[4]
				], 1);
				switch ($uri[3]) {
					case 'gallery':
						$not_only_home = true;
						$extra_param = 'home';
						$breadcrumb[] = [
							'name' => $page_now['title'],
							'link' => '#'
						];
						$breadcrumb[] = [
							'name' => 'Gallery',
							'link' => '#'
						];
						break;
				}
				
				break;
			case 'news':
				// category
				$not_only_home = true;
				switch ($uri[3]) {
					case 'sejarah':
						$extra_param ='home';
						$breadcrumb[] = [
							'name' => 'Sejarah',
							'link' => '#'
						];
						break;
					case 'pengumuman':
						$extra_param ='home';
						$breadcrumb[] = [
							'name' => 'Pengumuman',
							'link' => '#'
						];
						break;
					default:
						$extra_param = 'home';
						$CI->load->model('news_model');
						$page_now = $CI->news_model->findBy([
							'a.uri_path' => $uri[4]
						], 1);
						$breadcrumb[] = [
							'name' => $page_now['title'],
							'link' => '#'
						];
						
						$breadcrumb[] = [
							'name' => $page_now['news_category'],
							'link' => base_url('news/'.$page_now['uri_path_category'])
						];
					break;
				}
				
			break;
		}
	}else{
		$not_only_home = false;
		$extra_param = 'home';
		switch ($uri[2]) {
			case 'contact':
				$not_only_home = true;
				$breadcrumb[] = [
					'name'=> 'Hubungin Kami',
					'link'=> '#'
				];
				break;
			case 'pengumuman':
				$not_only_home = true;
				$breadcrumb[] = [
					'name'=> 'Pengumuman',
					'link'=> '#'
				];
				break;
			case 'berita':
				$not_only_home = true;
				$breadcrumb[] = [
					'name'=> 'Berita',
					'link'=> '#'
				];
				break;
			case 'gallery':
				$not_only_home = true;
				$breadcrumb[] = [
					'name'=> 'Gallery',
					'link'=> '#'
				];
				break;
			case 'sejarah':
				$not_only_home = true;
				$breadcrumb[] = [
					'name'=> 'Sejarah',
					'link'=> '#'
				];
				break;
			
			default:
				$extra_param = implode('/', $uri);
				break;
		}
	}
	
	$bread = $CI->Frontend_menu_model->findBy([
		'a.extra_param'	=>$extra_param
	],1);
	if (!$extra_param || !$bread || ($extra_param == 'home' && !$not_only_home)) {
		return '';
	}
	$id_parent = $bread['id_parent'];
	$bread['link'] = $bread['extra_param'] ? base_url($bread['extra_param']) : '#';
	$breadcrumb[] = $bread;
	
	while (
		$sub_menu = $CI->Frontend_menu_model->findById($id_parent)
	) {
		$sub_menu['link'] = $sub_menu['extra_param'] ? base_url($sub_menu['extra_param']):'#';
		$id_parent = $sub_menu['id_parent'];
		$breadcrumb[] = $sub_menu;
	}
	
	if (!$not_only_home) {
		$breadcrumb[] =[
			'name'=> 'Home',
			'link'=> base_url()
		];
	}


	krsort($breadcrumb);
	$data['data'] = $breadcrumb;
	$data['page_name'] = end($breadcrumb)['name'];	

	return $CI->parser->parse("front/component/breadcrumb.html", $data, true);
}