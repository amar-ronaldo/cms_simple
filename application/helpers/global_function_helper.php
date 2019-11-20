<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * fungsi untuk generate passwrd
 * @author Linda Hermawati 
 * @param $password password
 * @param $panjang untuk menentukan berapa panjang karakter dari password
 * @param $character karakter yang di random
 * @param @where (optional) where query tabel
 * @param $terpilih (optional) list terpilih (selected)
 * @return string untuk password siswa dan orang tua
 *
 */
function generate_password()
{
	$characters 	= "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	$password 		= "";
	$panjang 		= 6;
	for ($i = 0; $i < $panjang; $i++) {
		$password .= $characters[rand(0, 63)];
	}
	return $password;
}

/**
 * get user session data
 * @param  $data 		[session data that defined, default is admin_id: admin_id, admin_id_ref_auth_user_group, admin_gender, admin_fullname, admin_username, admin_email, admin_phone, admin_img]
 * @return [data] 		[session data selected]
 */
function id_user($data = 'id')
{
	$CI = &get_instance();
	$user_sess 	= $CI->session->userdata('ADM_SESS');
	$field 		= 'admin_' . $data;
	return $user_sess[$field];
}

/**
 * to merge template with all contents
 * @param $view 		[file name]
 * @param $data 		[array data sent to view]
 * @param $layout 	[main page that choosen]
 */
function render($view = '', $data = array(), $layout = '', $ret = false)
{
	$CI = &get_instance();
	if (empty($data)) {
		$data = array();
	}
	// $CI->data = array();
	// if(!$layout){
	// 	if(LANGUAGE=="english"){
	// 		$data['product_link'] = '';
	// 		$layout='ddi/main_india';
	// 	} else if(LANGUAGE=="indonesia"){
	// 		$layout='ddi/main';
	// 		$data['product_link'] = 'hide';
	// 	}
	// }
	// $data['base_url'] = $CI->baseUrl;
	// $data['lang'] = $CI->uri->segment(1);
	// if(!isset($data['js_file'])){
	// 	$data['js_file'] = '';
	// }
	// if(!isset($data['slider_widget'])){
	// 	$data['slider_widget'] = '';
	// }

	// if(!isset($data['popular_article'])){
	// 	$data['popular_article'] = '';
	// }

	// if(!isset($data['meta'])){
	// 	$data['meta'] = '';
	// }
	// if(!isset($data['qa_widget'])){
	// 	$data['qa_widget'] = '';
	// }
	// if(!isset($data['qa_widget_mobile'])){
	// 	$data['qa_widget_mobile'] = '';
	// }
	$data['base_url'] 		= base_url();
	$data['app_name'] 		= APP_NAME;
	$data['language']		= LANGUAGE;
	$data['this_year'] 		= date('Y');
	$data['breadcrumb'] 	= breadcrumb();
	$data['token_name'] 	= $CI->security->get_csrf_token_name();
	$data['token_value'] 	= $CI->security->get_csrf_hash();
	// $data['meta_description_general'] 	= meta_description($data['meta_description_general']);
	// $data['meta_keywords_general'] 		= meta_keywords($data['meta_keywords_general']);
	// 
	// 
	// $data['breadcrumb'] 	= $data['lang'] == 'apps' ? breadcrumb() : breadcrumb2();
	// $CI->breadcrumb 		= $data['breadcrumb'];
	// $data['partner_menu']	=  partner_menu();
	// $data['header_menu']	=  header_menu();
	// $data['footer_menu']	=  footer_menu();
	// $data['footer_logo']	=  footer_logo();
	// $data['top_menu']		=  top_menu();
	// $data['top_menu_mobile'] = top_menu_mobile();
	// $data['minify'] = minify();
	// $data['signin'] = '';
	// $data['signout'] = 'hide';
	// $data['base_url'] = base_url();
	$data['page_title'] = generate_title();
	$user_sess_data 	= $CI->session->userdata('ADM_SESS');

	if (!isset($data['page_name'])) {
		$data['page_name'] = generate_title();
	}
	if ($user_sess_data) {
		$data['profile_picture'] = $user_sess_data['admin_img'];
	}

	// start multilanguage for static data
	$language 	= lang_data('name');
	$CI->lang->load("general", $language);
	$lang 		= $CI->lang->language;
	$find 		= LANG_CONTROLLER_FIND();
	$replace 	= LANG_CONTROLLER_REPLACE();
	foreach ($lang as $key => $value) {
		$data[$key] = str_replace($find, $replace, $value);
	}
	// end of multilanguage for static data

	if (is_array($data)) {
		$CI->data = array_merge($CI->data, $data);
	}

	if (!$layout) {
		$CI->parser->parse($view . '.html', $CI->data);
	} else {
		$CI->data['content'] = $CI->parser->parse($view . '.html', $CI->data, true);
		if ($ret == true) {
			return $CI->parser->parse("layout/$layout.html", $CI->data, true);
		} else {
			$CI->parser->parse("layout/$layout.html", $CI->data);
		}
	}
}
/**
 * to merge template with all contents
 * @param $view 		[file name]
 * @param $data 		[array data sent to view]
 * @param $layout 	[main page that choosen]
 */
function render_front($view = '', $data = array(), $layout = '', $ret = false)
{
	
	$CI = &get_instance();
	$CI->load->helper('front_helper');
	if (empty($data)) {
		$data = array();
	}
	$data['base_url'] 		= base_url();
	$data['app_name'] 		= APP_NAME;
	$data['language']		= LANGUAGE;
	$data['this_year'] 		= date('Y');
	$data['token_name'] 	= $CI->security->get_csrf_token_name();
	$data['token_value'] 	= $CI->security->get_csrf_hash();
	$user_sess_data 	= $CI->session->userdata('ADM_SESS');
	
	if (!isset($data['page_name'])) {
		$data['page_name'] = generate_title();
	}
	if ($user_sess_data) {
		$data['profile_picture'] = $user_sess_data['admin_img'];
	}
	
	// start multilanguage for static data
	$language 	= lang_data('name');
	$CI->lang->load("general", $language);
	$lang 		= $CI->lang->language;
	$find 		= LANG_CONTROLLER_FIND();
	$replace 	= LANG_CONTROLLER_REPLACE();
	foreach ($lang as $key => $value) {
		$data[$key] = str_replace($find, $replace, $value);
	}
	// end of multilanguage for static data
	
	$data['web_config'] = $CI->db->get('ref_web_config')->result_array();
	foreach ($data['web_config'] as $key => $value) {
		$CI->data['config_'.$value['name']] = $value['value'];
	}	
	if (is_array($data)) {
		$CI->data = array_merge($CI->data, $data);
	}
	// generate page 
	$data['breadcrumb'] = front_breadcrumb();
	$data['page_title'] = generate_title();
	$data['footer']     = front_footer();
	$data['header_top'] = front_header_top();
	$data['header']     = front_header();

	if (is_array($data)) {
		$CI->data = array_merge($CI->data, $data);
	}
	
	if (!$layout) {
		$CI->parser->parse($view . '.html', $CI->data);
	} else {
		$CI->data['content'] = $CI->parser->parse($view . '.html', $CI->data, true);
		if ($ret == true) {
			return $CI->parser->parse("layout/$layout.html", $CI->data, true);
		} else {
			$CI->parser->parse("layout/$layout.html", $CI->data);
		}
	}
}

/**
 * get data of language search by field, default is id
 * @return [int] 	[id lang that found]
 */
function lang_data($field = 'id')
{
	$CI = &get_instance();
	if (IS_MULTI_LANG) { // multilanguage active
		$lang 	= $CI->uri->segment(1);
		$result = db_get_one('ref_language', $field, array('code' => $lang));
		return strtolower($result);
	} else {
		$lang_data = lang_data_in_cache();
		return strtolower($lang_data[$field]);
	}
}

/**
 * Language data with status active that stored in cache
 * @param  string 	$cache_name 	[description]
 * @return [type]             		[language data with status actived]
 */
function lang_data_in_cache($cache_name = 'language_data')
{
	$CI = &get_instance();
	$CI->load->driver('cache', array('adapter' => 'apc', 'backup' => 'file'));
	$CI->load->model('Language_model');
	if (!$data = $CI->cache->get($cache_name)) {
		$data = $CI->Language_model->findBy(array('status_lang' => 1), 1);
		$CI->cache->save($cache_name, $data, 300);
		$data = $CI->cache->get($cache_name);
	}
	return $data;
}

/**
 * Clear data cache that stored in --> application/cache/*
 */
function clear_data_cache()
{
	$CI = &get_instance();
	// just add cache name in this array
	$file_name_cache = array('language_data', 'module_data');
	foreach ($file_name_cache as $key => $value) {
		$CI->load->driver('cache', array('adapter' => 'apc', 'backup' => 'file'));
		$CI->cache->delete($value);
	}
}

/**
 * list month in english spelling
 * @param  [int] 	$selected 	[key of month in year, started from 0 to 11]
 * @return [html]	$opt 		[select option that contain list of month]
 */
function list_month($selected = '')
{
	$bulan = array(1 => 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
	$opt = "<option value=''></option>";
	foreach ($bulan as $key => $bln) {
		$terpilih = ($selected == $key) ? 'selected' : '';
		$opt .= "<option value=\"$key\" $terpilih>$bln</option>";
	}
	return $opt;
}

/**
 * list year 
 * @param  [int] 	$selected 	[key of month in year, started from 0 to 11]
 * @param  [int] 	$len 		[current 10 years]
 * @return [html]	$opt 		[select option that contain list of years]
 */
function list_year($selected = '', $len = 10)
{
	$opt 		= "<option value=''></option>";
	$this_year 	= date('Y');
	$year_bef 	= (int) $this_year - $len;
	$year_aft	= (int) $this_year; //+ $len;
	$year 		= range($year_bef, $year_aft);
	foreach ($year as $y) {
		$terpilih 	= ($selected == $y) ? 'selected' : '';
		$opt 		.= "<option $terpilih value=\"$y\">$y</option>";
	}
	return $opt;
}

/**
 * Export data to excel/csv/txt
 * @author Agung Iskandar
 * @param $fname nama file
 */
function export_to($fname)
{
	header("Content-type: application/x-msdownload");
	$fname = str_replace(' ', '_', $fname);
	header("Content-Disposition: attachment; filename=$fname");
	header("Pragma: no-cache");
	header("Expires: 0");
}

/**
 * Add nomor urut
 * @author Agung Iskandar
 * @param $array datanya
 * @return array dengan tambahan element id urut
 */
function set_nomor_urut($array, $nomor = 0)
{
	$datas = array();
	foreach ($array as $n => $data) {
		$datas[$n] = $data;
		$datas[$n]['nomor'] = ++$nomor;
	}
	return $datas;
}

/**
 * Generate Format Date Time dari mysql style ke format standart atau sebaliknya
 * @author Ivan Lubis
 * @param $datetime date time format
 * @param $mark (optional) separator date, default -
 * @return string format date time
 */
function iso_date_time($datetime, $mark = '-')
{
	if (!$datetime) return;
	list($date, $time) = explode(' ', $datetime);
	list($thn, $bln, $tgl) = explode('-', $date);
	return $tgl . $mark . $bln . $mark . $thn . ' ' . substr($time, 0, 8);
}

/**
 * Generate Format Date dari mysql style ke format standart atau sebaliknya
 * @author Ivan Lubis
 * @param $datetime date format
 * @param $mark (optional) separator date, default -
 * @return string format date
 */
function iso_date($date, $mark = '-')
{
	if (!$date) return;
	list($thn, $bln, $tgl) = explode($mark, $date);
	$tgl = explode(' ', $tgl);
	return $tgl[0] . $mark . $bln . $mark . $thn;
}

/**
 * [reshape time to be hh:mm]
 * @param  [time] 	$time 	[time]
 * @param  [char] 	$mark 	[mark between hour and minute]
 * @return [time]       	[reshaped time]
 */
function generate_time($time, $mark = '.')
{
	if (!$time) return;
	list($jam, $menit) = explode(':', $time);
	return $jam . $mark . $menit;
}

/**
 * fungsi mendapatkan data hasil query dalam bentuk string (1 field saja yg return)
 * @author Agung Iskandar <agung.iskandar@gmail.com>
 * @param $table nama tabel
 * @param $field nama kolom
 * @param $where (optional) where kondisi
 * @return string
 *
 */
function db_get_one($table = '', $field = '', $where = '')
{
	$CI = &get_instance();
	if ($where != '') {
		$query = $CI->db->select($field)->get_where($table, $where)->row();
	} else {
		$query = $CI->db->select($field)->get($table)->row();
	}
	if (!$query) {
		return $query;
	} else {
		return $query->$field;
	}
}

/**
 * Javascript Alert Function
 * @author Agung Iskandar <agung.iskandar@gmail.com>
 * @param $alert_message alert message yg ditampilkan dalam dialog box
 * @return string javascript <script>alert(message)</script>
 */
function alert($alert_message)
{
	if ($alert_message != '') {
		return "<script>$(document).ready(function(){notify('$alert_message','success')})</script>";
	}
}

/**
 * Untuk mendapatkan data via url seperti $_GET
 * @author Agung Iskandar <agung.iskandar@gmail.com>
 * @param $keyword string contoh http://example.com/id/1/name/example ;get('id') return 1; get('name') return example
 * @param $return_if_null (optional) return value if keyword is null
 * @return string
 */
function get($keyword, $return_if_null = '')
{
	$arr 	= array('http://', 'https://', 'https://www.', 'http://www.');
	$host	= str_replace($arr, '', base_url());
	$host 	= array($host, 'apps/');
	$uri 	= explode('/', str_replace($host, '', $_SERVER['HTTP_HOST'] . $_SERVER['REDIRECT_URL']));
	foreach ($uri as $key => $val) {
		if ($key > 1) {
			if ($key % 2 == 0) {
				if ($val != '') {
					$data[$val] = $uri[$key + 1];
				}
			}
		}
	}
	return ($data[$keyword] == '') ? $return_if_null : $data[$keyword];
}

/**
 *generate angka 0 didepan variabel contoh : 0000001, 0000123
 *@param $var number variable angka dibelakang
 *@param $len jumlah digit yg diinginkan
 *@example zero_first(1,3) return 001; zero_first(12,5) return 00012;
 */
function zero_first($var, $len)
{
	return sprintf("%0{$len}s", $var);
}

/**
 * debug variable for development
 * @param  [data] 	$datadebug 	[data debug]
 * @return [data]            	[data debug]
 */
function debugvar($datadebug)
{
	echo "<pre>";
	print_r($datadebug);
	echo "</pre>";
}

/**
 * check file size
 * @param  [int] 	$file_size 	[file size]
 * @param  [int] 	$max_size  	[maximum file size that enabled]
 * @return [data]             	[notification]
 */
function check_file_size($file_size, $max_size = 2097152)
{
	if ($file_size > $max_size || $file_size == '') {
		die('Error, Maximum file size is: ' . ($max_size / 1024) . ' Kb');
	};
}
/**
 * clear html with 'kutip'
 * @param  [html] 	$html 	[tag html with 'kutip']
 * @return [html]       	[tag html without 'kutip']
 */
function clear_html($html)
{
	$html = str_replace("\n", "", $html);
	$html = str_replace("\r", " ", $html);
	return str_replace("	", '', (trim(strip_tags($html))));
}

/**
 * utk form jika di variable stringnya ada kutip
 * @author Agung Iskandar
 * @param $string string yg ingin ditampilkan dalam form
 */
function quote_form($string)
{
	if (is_array($string)) {
		foreach ($string as $key => $val) {
			$new_str[$key] = htmlspecialchars($val, ENT_QUOTES);
		}
		return $new_str;
	} else {
		return htmlspecialchars($string, ENT_QUOTES);
	}
}

/**
 * date range
 * @param  [date] $strDateFrom 	[start date]
 * @param  [date] $strDateTo   	[end date]
 * @return [int]              	[range days between start and end date]
 */
function date_range($strDateFrom, $strDateTo)
{
	$aryRange	= array();
	$iDateFrom 	= mktime(1, 0, 0, substr($strDateFrom, 5, 2), substr($strDateFrom, 8, 2), substr($strDateFrom, 0, 4));
	$iDateTo 	= mktime(1, 0, 0, substr($strDateTo, 5, 2), substr($strDateTo, 8, 2), substr($strDateTo, 0, 4));

	if ($iDateTo >= $iDateFrom) {
		array_push($aryRange, date('Y-m-d', $iDateFrom)); // first entry
		while ($iDateFrom < $iDateTo) {
			$iDateFrom += 86400; // add 24 hours
			array_push($aryRange, date('Y-m-d', $iDateFrom));
		}
	}
	return count($aryRange);
}

/**
 * replace month from English spelling to Indonesia spelling
 * @param  [text] 	$str_date 	[month in English]
 * @return [text]           	[month in Indonesia]
 */
function month_indo($str_date)
{
	$string = array('January', 'February', 'March', 'May', 'June', 'July', 'August', 'October', 'December');
	$string_replace = array('Januari', 'Februari', 'Maret', 'Mei', 'Juni', 'Juli', 'Agustus', 'Oktober', 'Desember');
	return str_replace($string, $string_replace, $str_date);
}

/**
 * Insert user activities
 * @param  [text] 	$activity 	[user activity]
 */
function insert_log($activity)
{
	$CI = &get_instance();
	$data['activity'] 		= $activity;
	$data['detail'] 		= $CI->detail_log;
	$data['ip'] 			= $_SERVER['REMOTE_ADDR'];
	$data['id_ref_auth_user'] 	= id_user();
	$data['log_date'] 		= date('Y-m-d H:i:s');
	$CI->db->insert('access_log', $data);
}

/**
 * Detail log of user activities
 * @param  [text] 	$detail 	[user activity]
 */
function detail_log($detail = '')
{
	$CI = &get_instance();
	$detail .= $CI->db->last_query() . ";\n";
	$CI->detail_log = $detail;
}

/**
 * convert array to be string
 * @param  [array] 	$data 	[data in array]
 * @return [array] 	$ret 	[data in string]
 */
function arr_to_str($data)
{
	foreach ($data as $key => $val) {
		$ret .= "$key : $val <br>";
	}
	return $ret;
}

/**
 * [select option for ref table]
 * @param  [array] 	$conf 	[configuration in array]
 * @return [html]       	[select option in html]
 */
function select_list($conf = array())
{
	$CI = &get_instance();
	$tbl      = $conf['table'];
	$id       = (!empty($conf['id'])) ? $conf['id'] : 'id';
	$name     = (!empty($conf['name'])) ? $conf['name'] : 'name';
	$where    = (!empty($conf['where'])) ? $conf['where'] : array('id_ref_delete' => 0);
	$selected = (!empty($conf['selected'])) ? $conf['selected'] : 'name';
	$title    = (!empty($conf['title'])) ? $conf['title'] : 'select'; //$conf['title'];
	$order    = (!empty($conf['order'])) ? $conf['order'] : $name;
	$custome  = (!empty($conf['custome'])) ? $conf['custome'] : '';
	if (!empty($conf['not_where'])) {
		unset($where);
	}

	$list     = $CI->db->order_by($order, 'asc')->select("$id, $name, $custome")->get_where($tbl, $where)->result_array();
	$opt      = (!empty($conf['no_title'])) ? '' : "<option value=''>$title</option>";
	$opt      .= (!empty($conf['add_new'])) ? ("<option value='addNew'>+ Add $conf[add_new]</option>") : '';

	foreach ($list as $key => $value) {
		$custome_field = (!empty($conf['custome'])) ? 'data-custome="' . $value[$custome] . '"' : '';
		$terpilih      = ($selected == $value[$id]) ? 'selected' : '';
		$opt           .= "<option $terpilih value='$value[$id]' $custome_field> $value[$name]</option>";
	}
	return $opt;
}

/**
 * paging in table
 * @param  [int]  	$total_row   	[total data]
 * @param  [text]  	$url         	[next url]
 * @param  integer 	$perpage     	[total data shown perpage]
 * @param  integer 	$uri_segment 	[total uri segment]
 * @return [paging]               	[paging]
 */
function paging($total_row, $url, $perpage = 10, $uri_segment = 4)
{
	$CI = &get_instance();
	$CI->load->library('pagination');
	$config['uri_segment'] 	= $uri_segment;
	$config['base_url'] 		= $url;
	$config['total_rows'] 		= $total_row;
	$config['per_page'] 		= $perpage;
	$config['anchor_class'] 	= 'class="paging" ';
	$CI->pagination->initialize($config);
	return	 $CI->pagination->create_links();
}

/**
 * Current controller
 * @param  string 	$param 	[parameters]
 * @return [text]        	[current controller accessed]
 */
function current_controller($param = '')
{
	$CI = &get_instance();
	$dir				= $CI->router->directory;
	$class				= $CI->router->fetch_class();
	$func				= ($param == 'function') ? ('/' . $CI->router->fetch_method()) : "/$param";
	$base_url			= str_replace('http://' . $_SERVER['HTTP_HOST'], '', base_url());
	$data['base_url'] 	= str_replace('https://' . $_SERVER['HTTP_HOST'], '', $base_url); //jika https
	return $data['base_url'] . $dir . $class . $func;
}

/**
 * Query for grid function
 * @param  [array]  	$alias   	[alias]
 * @param  integer 		$isTotal 	[is show in number]
 * @return [query]           		[query grid]
 */
function query_grid($alias, $isTotal = 0)
{
	$CI = &get_instance();
	$param 		= $_GET;
	$where 		= where_grid($param, $alias);
	$sort_field	= ($param['sort_field']) ? $param['sort_field'] : 'id';
	$sort_type	= ($param['sort_type']) ? $param['sort_type'] : 'desc';
	$CI->db->order_by(str_replace('-', '.', $sort_field), $sort_type);
	if ($isTotal != 1) {
		$CI->db->limit($param['perpage'], $param['page']);
	}
}

/**
 * Default grid in Deptech
 * @param  [array]  	$data        	[data in array]
 * @param  integer  	$ttl_row     	[total data]
 * @param  integer 		$uri_segment 	[total segment]
 * @return [array]               		[data]
 */
function ddi_grid($data, $ttl_row, $uri_segment = 4)
{
	$data['data'] 	= set_nomor_urut($data, $_GET['page']);
	$data['paging'] = paging_grid($ttl_row, $uri_segment);
	return $data;
}

/**
 * Paging in grid function
 * @param  integer  	$total_row   	[total of row]
 * @param  integer 		$uri_segment 	[total of segment]
 * @return [tag html]               	[paging]
 */
function paging_grid($total_row, $uri_segment = 4)
{
	$CI = &get_instance();
	$CI->load->library('pagination');
	$param 						= $_GET;
	$config['base_url'] 		= current_controller('function');
	$config['total_rows'] 		= $total_row;
	$config['uri_segment'] 		= $uri_segment;
	$config['anchor_class'] 	= 'class="tangan"';
	$config['per_page'] 		= $param['perpage'];
	$config['first_tag_open'] 	= '<li class="page-item">';
	$config['first_tag_close'] 	= '</li>';
	$config['first_link'] 		= '<<';
	$config['last_link'] 		= '>>';
	$config['num_tag_open'] 	= '<nav aria-label="Page navigation"><ul class="pagination"><li class="page-item">';
	$config['num_tag_close'] 	= '</li>';
	$config['last_tag_close'] 	= '</li>';
	$config['last_tag_open'] 	= '<li class="page-item">';
	$config['first_tag_close'] 	= '</li>';
	$config['first_tag_open'] 	= '<nav aria-label="Page navigation"><ul class="pagination"><li class="page-item">';
	$config['next_link'] 		= '>';
	$config['prev_link'] 		= '<';
	$config['prev_tag_open'] 	= '<nav aria-label="Page navigation"><ul class="pagination"><li class="page-item">';
	$config['prev_tag_close'] 	= '</li>';
	$config['next_tag_open'] 	= '<li class="page-item">';
	$config['next_tag_close']	= '</li>';
	$config['next_tag_open'] 	= '<li class="page-item">';
	$config['next_tag_close']	= '</li>';
	$config['cur_tag_open'] 	= '<nav aria-label="Page navigation"><ul class="pagination"><li class="page-item active"><a class="page-link">';
	$config['cur_tag_close'] 	= '</a></li>';
	$saa = $CI->pagination->initialize($config);

	$n 		 = $param['page'];
	$n2 	 = $n + 1;
	$sd 	 = $n + $param['perpage'];
	$sd 	 = ($total_row < $sd) ? $total_row : $sd;
	$remark	 = ($sd > 0) ? ("$n2 - $sd Total $total_row") : '';
	$paging  = '<div class="row">
					<div class="col-7 col-md-7 text-right pr-2">
				   		<div class="pagination">
				   			<ul class="pagination m-t-0 m-b-10 pull-right">';
	$paging .= $CI->pagination->create_links();
	$paging .= '</ul>';
	$paging .= '</div>
					</div>
					<div class="col-3 col-md-3 text-right pr-2">
						<span class="show_page">' . $remark . '</span>
					</div>
					<div class="col-2 col-md-2">
						<span class="paging-select"></span>
					</div>
			   	</div></div>';
	return $paging;
}

/**
 * Where query in grid function
 * @param  [array] 	$param 	[parameters]
 * @param  [text] 	$alias 	[alias parameters]
 * @return [query]        	[query]
 */
function where_grid($param, $alias)
{
	$CI = &get_instance();
	foreach ($param as $key => $val) {
		if (substr($key, 0, 6) == 'search') {
			$field  = ($alias[$key] != '') ? $alias[$key] : substr($key, 7);
			if ($val) {
				// $where .= "and $field like '%$val%' ";
				$field_explode = explode('_', $field, -1);
				if ($field == 'a.datestart') {
					$CI->db->where("a.create_date >=", iso_date_custom_format($val, 'Y-m-d'));
				} else if ($field == 'a.dateend') {
					$CI->db->where("a.create_date <=", iso_date_custom_format($val, 'Y-m-d'));
				} else if ($field_explode[0] != 'or') {
					if ($val !== 'null') {
						if ($field == 'c.id') {
							$CI->db->where("$field = $val");
						} else {
							$CI->db->like($field, "$val");
						}
					}
					// $CI->db->like($field, "$val");
					// $CI->db->where("$field like N'%$val%'");
				} else {
					$CI->db->or_where(str_replace('or_', '', $field), " like N'%$val%'");
					// $CI->db->or_like(str_replace('or_','',$field), "$val");
				}
			}
		} else if (substr($key, 0, 7) == 'between') {
			$start = (strpos($key, 'to') ? 11 : 8);
			$field  = ($alias[$key] != '') ? $alias[$key] : substr($key, $start);
			if ($val) {
				$explode = explode('.', $field);
				if ($field == 'a.daterange') {
					$from 	= iso_date_custom_format($param['between_from'], 'Y-m-d');
					$to 	= iso_date_custom_format($param['between_to'], 'Y-m-d', '+1 day');
					if ($param['between_from'] != '' && $param['between_to'] != '') {
						$CI->db->where("a.date between '$from' and '$to'");
					} else if ($param['between_from'] != '' && $param['between_to'] == '') {
						$to = iso_date_custom_format(date('Y-m-d'), 'Y-m-d', '+1 day');
						$CI->db->where("a.date between '$from' and '$from 23:59:59'");
					}
				} else { //$field == appropriate field name on database/not using alias name
					$field_explode = (count($explode) > 1) ? '_' . $explode[1] : '_' . $explode[0];
					$field = substr($field_explode, 1);
					$from = iso_date_custom_format($param['between_from' . $field_explode], 'Y-m-d');
					$to = iso_date_custom_format($param['between_to' . $field_explode], 'Y-m-d', '+1 day');
					if ($param['between_from' . $field_explode] != '' && $param['between_to' . $field_explode] != '') {
						$CI->db->where('a.' . $field . " between '$from' and '$to'");
					} else if ($param['between_from' . $field_explode] != '' && $param['between_to' . $field_explode] == '') {
						$to = iso_date_custom_format(date('Y-m-d'), 'Y-m-d', '+1 day');
						$CI->db->where('a.' . $field . " between '$from' and '$from 23:59:59'");
					}
				}
			}
		}
	}
	return $where;
}

/**
 * Rename file name
 * @param  [text] 	$fname 	[file name]
 * @return [type]        	[new file name]
 */
function filename($fname)
{
	$ext 		= explode('.', $fname);
	$extension 	= end($ext);
	$fname 		= implode('-', $ext[0]);
	return date('ymdHis') . '-' . url_title($fname) . '.' . $extension;
}

/**
 * Convert days in English spelling to be Indonesia spelling
 * @param  string 	$tgl 	[date Y-m-d]
 * @return [text]      		[day in Indonesia spelling]
 */
function get_day($tgl = '')
{
	$day_in_eng = date('l', $tgl);
	if ($day_in_eng == 'Sunday') return "Minggu";
	else if ($day_in_eng == 'Monday') return "Senin";
	else if ($day_in_eng == 'Tuesday') return "Selasa";
	else if ($day_in_eng == 'Wednesday') return "Rabu";
	else if ($day_in_eng == 'Thursday') return "Kamis";
	else if ($day_in_eng == 'Friday') return "Jumat";
	else if ($day_in_eng == 'Saturday') return "Sabtu";
}

/**
 * Number formating
 * @param  [type]  $data      [description]
 * @param  [type]  $field     [description]
 * @param  integer $ttl_comma [description]
 * @return [type]             [description]
 */
function number_formating($data, $field, $ttl_comma = 0)
{
	foreach ($data as $index => $value) {
		foreach ($value as $idx => $val) {
			if ($idx == $field) {
				$data[$index][$idx] = number_format($val, $ttl_comma);
			}
		}
	}
	return $data;
}

/**
 * Insert user logs to access_log table
 * @param  array  	$data
 * @return array	$data
 */
function access_log_user($data = array())
{
	$CI = &get_instance();
	$data['log_date'] =  date('Y-m-d H:i:s');
	$CI->db->insert('access_log', $data);
	return $data;
}

/**
 * Html of add + export + import button
 * @return [html] 	[html of add+export button]
 */
function btn_add_export_import()
{
	$CI = &get_instance();
	return $CI->parser->parse('layout/btn-html/btn-add-export-import.html', $CI->data, true);
}

/**
 * Html of add + export button
 * @return [html] 	[html of add+export button]
 */
function btn_add_export()
{
	$CI = &get_instance();
	return $CI->parser->parse('layout/btn-html/btn-add-export.html', $CI->data, true);
}

/**
 * Html of add button
 * @return [html] 	[html of add button]
 */
function btn_add()
{
	$CI = &get_instance();
	return $CI->parser->parse('layout/btn-html/btn-add.html', $CI->data, true);
}


/**
 * Html of only add button
 * @return [html] 	[html of only add button]
 */
function btn_add_only()
{
	$CI = &get_instance();
	return $CI->parser->parse('layout/btn-html/btn-add-only.html', $CI->data, true);
}

/**
 * Html of only add button
 * @return [html] 	[html of only add button]
 */
function btn_search_only()
{
	$CI = &get_instance();
	return $CI->parser->parse('layout/btn-html/btn-search-only.html', $CI->data, true);
}


/**
 * Html of process buttons, process (add/update) and back buttons
 * @param  string 	$proses 	[title of button]
 * @return [type]         		[html of process button]
 */
function btn_process($proses = '',$data_back = '')
{
	$CI = &get_instance();
	$CI->data['title'] = $proses;
	$CI->data['data_back'] = $data_back;
	return $CI->parser->parse('layout/btn-html/btn-process.html', $CI->data, true);
}

/**
 * Update profile in session
 * @param  string 	$user_id 	[user id]
 */
function update_profile_session($user_id = '')
{
	$CI = &get_instance();
	$CI->load->model('Auth_user_model');
	$query = $CI->Auth_user_model->findById($user_id);
	$data = array(
		'admin_id' => $query['id'],
		'admin_id_ref_auth_user_group' => $query['id_ref_auth_user_group'],
		'admin_gender' => $query['gender'],
		'admin_fullname' => $query['fullname'],
		'admin_username' => $query['username'],
		'admin_email' => $query['email'],
		'admin_phone' => $query['phone'],
		'admin_img' => get_profile_picture_url($query['img']),
	);
	$CI->session->set_userdata('ADM_SESS', $data);
}

/**
 * Get profile picture path
 * @param  string 	$img  	[picture name]
 * @param  string 	$path 	[path of picture]
 * @return [type]       	[full path of profile picture]
 */
function get_profile_picture_url($img = '', $path = 'small')
{
	$CI = &get_instance();
	$img = ($img) ? $img : 'default-avatar.jpg';
	return base_url() . "images/article/$path/" . $img;
}

/**
 * Limit length of text
 * @param  [text] 	$text  	[text]
 * @param  [int] 	$limit 	[limit of length]
 * @return [type]        	[limited text]
 */
function limit_text($text, $limit)
{
	if (str_word_count($text, 0) > $limit) {
		$words = str_word_count($text, 2);
		$pos = array_keys($words);
		$text = substr($text, 0, $pos[$limit]) . '...';
	}
	return $text;
}

/**
 * Get path of image
 * @param  [text]  	$img  	[image]
 * @param  [text]  	$path 	[path of image]
 * @param  integer 	$ret  	[description]
 * @return [text]        	[full path of image]
 */
function image($img, $path, $ret = 0)
{
	$CI = &get_instance();
	$path 	= "$path/";
	$path 	= str_replace('//', '', $path);
	$no_img = $ret == '404' ? $CI->baseUrl . 'asset/images/404.png' : ($CI->baseUrl . 'images/article/' . $path . 'no_image.png');
	$cek 	= is_file_exsist(UPLOAD_DIR . $path, $img);
	if ($ret == 1) {
		return $cek;
	} else {
		return $cek ? ($CI->baseUrl . 'images/article/' . $path . $img) : $no_img;
	}
}

/**
 * Sent email with email template design
 * @param  [int] 	$code 	[email template code]
 * @param  [array] 	$data 	[data in array]
 * @param  [text] 	$to 	[target email]
 * @return [text] 			[sent email notification]
 */
function sent_email_with_template($code = '', $data = array(), $to = '')
{

	$CI = &get_instance();
	$CI->load->helper('mail');
	$CI->load->model('Email_tmp_model');
	$CI->load->model('Log_email_model');

	$data_email_template = $CI->Email_tmp_model->findBy(array('code' => $code, 'id_ref_language' => lang_data()), 1);
	if ($data_email_template) {
		$path 			= email_template_path();
		$email['to'] 	= $to;
		$config 		= array(
			'mailtype' => 'html',
			'charset' => 'utf-8',
			'priority' => '1',
		);
		$CI->email->initialize($config);
		$email['subject'] 			= $data_email_template['subject'];
		$data['data_email_content'] = $data_email_template['page_content'];

		$message_content['app_name'] 	= APP_NAME;
		$message_content['fb_page'] 	= FB_PAGE;
		$message_content['tw_page'] 	= TW_PAGE;
		$message_content['ig_page'] 	= IG_PAGE;
		$message_content['logos'] 		= image('logos.png', 'small');
		$message_content['base_url'] 	= base_url();
		$message_content['this_year'] 	= date('Y');
		$message_content['content'] 	= $CI->parser->parse('layout/email-template/' . preg_replace("/&#?[a-z0-9]+;/i", "", $data_email_template['template_name']) . '.html', $data, true);
		$message = $CI->parser->parse('layout/email-template/default-email-template.html', $message_content, true);

		$email['content'] 	= $message;
		$ret 				= sent_mail($email);

		$data_email['from_email']       = $CI->db->query('Select smtp_user from email_config')->row()->smtp_user;
		$data_email['to_email']         = $to;
		$data_email['id_ref_email_tmp'] = $data_email_template['id'];
		$data_email['process_date']     = date('Y-m-d H:i:s');

		$log_email                      = $CI->Log_email_model->insert($data_email);

		return $ret;
	}
}

/**
 * Generate file of email template
 * @param  [text] 	$file_name 	[file name]
 * @param  [array] 	$data      	[content in email template]
 * @return 						[generate file of email template]
 */
function generate_email_template_file($file_name, $data)
{
	$CI = &get_instance();
	$CI->load->helper('file');
	$path = email_template_path();
	if (!file_exists($path)) {
		mkdir($path);
	}
	if (!is_writable($path)) { //kalo ga bisa nulis
		die('ga bisa nulis!');
	}
	if (!write_file($path . preg_replace("/&#?[a-z0-9]+;/i", "", $file_name) . '.html', $data)) {
		echo 'error create file <br>';
	}
}

/**
 * Get path of email template 
 * @return [text] 	[full url of email]
 */
function email_template_path()
{
	return EMAIL_TEMPLATE_DIR;
}

/**
 * Multilanguage function for static text
 * @param  [text] 	$field 		[field static multilanguage]
 * @param  string 	$file_name 	[filename of language]
 * @param  string 	$language 	[default of language]
 * @return [type]            	[description]
 */
function language($field = '', $language = LANGUAGE, $file_name = 'default')
{
	$CI = &get_instance();
	if ($file_name == 'default') {
		$file = "general"; // default
	} else {
		$file = $file_name;
	}
	$CI->lang->load($file, $language);
	$lang = $CI->lang->language;
	$find       = LANG_CONTROLLER_FIND();
	$replace    = LANG_CONTROLLER_REPLACE();
	return str_replace($find, $replace, $lang['lang_' . $field]);
}

/**
 * [LANG_CONTROLLER_FIND description]
 */
function LANG_CONTROLLER_FIND()
{
	return array('{base_url}');
}

/**
 * [LANG_CONTROLLER_REPLACE description]
 */
function LANG_CONTROLLER_REPLACE()
{
	$CI = &get_instance();
	return array(base_url());
}

/**
 * Check username of users in this system. Data is store in cache
 *
 * @param      string  $username    The username
 * @param      string  $cache_name  [cache name]
 * @return     integer 1 = does, 0 = doesn't
 */
function check_username($username = '', $cache_name = 'username_data')
{
	$CI = &get_instance();
	$CI->load->driver('cache', array('adapter' => 'apc', 'backup' => 'file'));
	$CI->load->model('Auth_user_model');
	if (!$data = $CI->cache->get($cache_name)) {
		$data = $CI->Auth_user_model->findBy(array('id_ref_active' => 2, 'activation_code' => NULL));
		$CI->cache->save($cache_name, $data, 300);
		$data = $CI->cache->get($cache_name);
	}
	foreach ($data as $key => $value) {
		$uname[] = $value['username'];
	}

	if (in_array($username, $uname)) { // username matchf
		return 1;
	} else {
		return 0;
	}
}
