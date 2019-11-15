<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

function minify(){
    return $_SERVER['REMOTE_ADDR']=='127.0.0.1' || $_SERVER['REMOTE_ADDR']=='192.168.1.111' ? '' : "";
}

function frontend_menu($pos,$id_parent=''){
	$CI=& get_instance();
	$lang 		= $CI->uri->segment(1);
	$class		= $CI->uri->segment(2);
	$class 		= $class ? $class : 'home';
	$uri4 		= $CI->uri->segment(4);
	$extraParam	= $CI->uri->segment(3);
	$CI->load->model('frontendMenuModel');
	$CI->load->model('languageModel');
	$language 	= $CI->languageModel->fetchRow(array('code'=>$lang));
	$CI->db->order_by('position');
	$data 		= $CI->frontendMenuModel->findBy(array('id_menu_position'=>$pos,'id_ref_language'=>$language['id'],'id_parent'=>$id_parent)); 

	$pathname   = $_SERVER['REQUEST_URI'];
	
	foreach ($data as $key => $value){

		$additional 	= ($value['controller'] == 'news' || $value['controller'] == 'event') ? '/index' : '';
		$url 			= $value['controller'] == '' ? '#' : "{$CI->baseUrl}$lang/$value[controller]$additional/$value[extra_param]";

		$addx  = preg_replace('/\s+/', '-', strtolower($value['name']));
		$urlx = $v['controller'] == '' ? '#' : "{$CI->baseUrl}$lang/$value[controller]$additional/$addx";

		// echo "$value[controller] == $class && $value[extra_param] == $extraParam : <br>";

		$sub = $CI->frontendMenuModel->findBy(array('id_menu_position'=>$pos,'id_ref_language'=>$language['id'],'id_parent'=>$value['id']));
		
		$aktif  = '';
		$aktif2 = '';
		$ret2   = '';
		
		if($sub){
			foreach ($sub as $k => $v){
				$additional2 	= $v['controller'] == 'event' ? '/index' : '';
				$additional2	= ($v['controller'] == 'news' || $v['controller'] == 'event') ? '/index' : '';
				$url2 			= $v['controller'] == '' ? '#' : "{$CI->baseUrl}$lang/$v[controller]$additional/$v[extra_param]";
		
				$additional2y	= ($v['controller'] == 'news' || $v['controller'] == 'event') ? '/detail' : '';
				$url2y		= $v['controller'] == '' ? '#' : "{$CI->baseUrl}$lang/$v[controller]$additional2/".$_SESSION['page_uri'];

				$add2x  = preg_replace('/\s+/', '-', strtolower($v['name']));
				$url2x = $v['controller'] == '' ? '#' : "{$CI->baseUrl}$lang/$v[controller]$additional2/$add2x";
			
				if($url2 == "#"){
					$url2 = $v[extra_param];
					$addBlank = 'target = "_blank"';
				} else{
					$addBlank = '';
				}
        	
				//echo $url2."---a---".$url2y."---b---";
				// $aktif2 = ($pathname == $url2) ? 'active' : '';
				$aktif2 = '';
				if ($pathname == $url2) {
					$aktif2 = 'active';
				} elseif ($pathname == $url2x) {
					$aktif2 = 'active';
				} elseif ($url2 == $url2y){
					$aktif2 = 'active';
				}
				
				$ret2 .= "    <li role='presentation' class='$aktif2'>\n";
				$ret2 .= "        <a href='$url2' ".$addBlank.">$v[name]</a>\n";
				$ret2 .= "   </li>\n";

				if ($aktif2!='') {
					$aktif  =  $aktif2;
				}
			}
		}
		if ($aktif == '') {
			if ($pathname == $url) {
				$aktif = 'active';
			} elseif ($pathname == $urlx) {
				$aktif = 'active';
			} else {
				$aktif = '';
			}
		}
		
		

		$ret .= "    <li role='presentation' class='$aktif'>\n";
		$ret .= "        <a href='$url'>$value[name]</a>\n";
		if($ret2){
			$ret .= "        <ul class='nav nav-tabs menus'>\n";
			$ret .= "            ".$ret2;
			$ret .= "        </ul>\n";
		}
		$ret .= "    </li>\n";
	}
	return $ret;
}

function calendar_days_number($class=''){
    $CI=& get_instance();
    $CI->lang->load("general",LANGUAGE);
	$lang = $CI->lang->language;

    $days = "<select class='$class search-param' id='calendar_days_number' name='tgl'>";
    $days .= "<option value='' selected>$lang[lang_day]</option>";
    for ($x = 1; $x <= 31; $x++) {
        if($x<10){
            $val = '0'.$x;
        } else {
            $val = $x;
        }
        $days .= "<option value='$val'>$x</option>";
    }
    $days .= "</select>";
    
    return $days;
}

function calendar_months_word($class=''){
    $CI=& get_instance();
    $CI->lang->load("general",LANGUAGE);
	$lang = $CI->lang->language;

    $months = "<select class='$class search-param' id='calendar_months_word' name='bln'>";
    $months .= "<option value='' selected>$lang[lang_month]</option>";
    $months .= "<option value='01'>$lang[lang_january]</option>";
    $months .= "<option value='02'>$lang[lang_february]</option>";
    $months .= "<option value='03'>$lang[lang_march]</option>";
    $months .= "<option value='04'>$lang[lang_april]</option>";
    $months .= "<option value='05'>$lang[lang_may]</option>";
    $months .= "<option value='06'>$lang[lang_june]</option>";
    $months .= "<option value='07'>$lang[lang_july]</option>";    
    $months .= "<option value='08'>$lang[lang_august]</option>";
    $months .= "<option value='09'>$lang[lang_september]</option>";
    $months .= "<option value='10'>$lang[lang_october]</option>";
    $months .= "<option value='11'>$lang[lang_november]</option>";
    $months .= "<option value='12'>$lang[lang_december]</option>";
    $months .= "</select>";
    return $months;
}

function calendar_years_number($class=''){
    $years_now = date('Y');

    $CI=& get_instance();
    $CI->lang->load("general",LANGUAGE);
	$lang = $CI->lang->language;
    $years = "<select class='$class search-param' id='calendar_years_number' name='thn'>";
    $years .= "<option value='' selected>$lang[lang_year]</option>";
    for ($x = 2013; $x <= $years_now; $x++) {
       $years .= "<option value='$x'>$x</option>";
    }
    $years .= "</select>";
    
    return $years;
}

function iso_date_custom_format($date,$format){
    if($date == '1900-01-01' or $date == ''){
	   return '';
    } else {
       return date("$format",strtotime($date));
    }
}

function meta_description($meta=''){
	if($meta==''){
		return 'Futuready memandu Anda dengan cara yang praktis, interaktif sekaligus inspiratif untuk siapkan masa depan Anda.';
    }else{
		return remove_kutip(strip_tags($meta));
    }
}

function meta_keywords($meta=''){
	if($meta==''){
		return 'Futuready memandu Anda dengan cara yang praktis, interaktif sekaligus inspiratif untuk siapkan masa depan Anda.';
    }else{
		return remove_kutip(strip_tags($meta));
    }
}


function get_path_email_template(){
    return EMAIL_TEMPLATE_DIR;
}

function get_path_custome_lang_file(){
	return CUSTOME_LANG_DIR;
}
function generate_custome_lang_file($lang_name,$data){
    $CI=& get_instance();
    $CI->load->helper('file');
    $path	= get_path_custome_lang_file().$lang_name.'/';
    if(!file_exists($path)){
        mkdir($path);
    }
    if(!is_writable($path)){//kalo ga bisa nulis
        die('ga bisa nulis!');
    }
    if(!write_file($path.preg_replace("/&#?[a-z0-9]+;/i","",'custom_lang').'.php', $data)){
        echo 'error create file <br>';
    }
}
function get_path_route_url_file(){
	return ROUTE_URL_DIR;
}
function generate_route_url_file($data){
    $CI=& get_instance();
    $CI->load->helper('file');
    $path	= get_path_route_url_file();
    if(!file_exists($path)){
        mkdir($path);
    }
    if(!is_writable($path)){//kalo ga bisa nulis
        die('ga bisa nulis!');
    }
    if(!write_file($path.preg_replace("/&#?[a-z0-9]+;/i","",'custom_routes').'.php', $data)){
        echo 'error create file <br>';
    }
}
function passwordHash($plainTextPassword, $salt = null, $saltLength = 9)
{
    if(is_null($salt))
    {
        // create new salt
        $salt = substr(sha1(uniqid(mt_rand(), true)), 0, $saltLength);
    }
    else
    {
        $salt = substr($salt, 0, $saltLength);
    }
    return $salt . hash('sha256', $salt . $plainTextPassword);
}
function time_elapsed_string($datetime, $full = false) {
    $today = time();    
    $createdday= strtotime($datetime); 
    $datediff = abs($today - $createdday);  
    $difftext="";  
    $years = floor($datediff / (365*60*60*24));  
    $months = floor(($datediff - $years * 365*60*60*24) / (30*60*60*24));  
    $days = floor(($datediff - $years * 365*60*60*24 - $months*30*60*60*24)/ (60*60*24));  
    $hours= floor($datediff/3600);  
    $minutes= floor($datediff/60);  
    $seconds= floor($datediff);  
    //year checker  
    if($difftext=="")  
    {  
      if($years>1)  
       $difftext=$years." tahun yang lalu";  
      elseif($years==1)  
       $difftext=$years." tahun yang lalu";  
    }  
    //month checker  
    if($difftext=="")  
    {  
       if($months>1)  
       $difftext=$months." bulan yang lalu";  
       elseif($months==1)  
       $difftext=$months." bulan yang lalu";  
    }  
    //month checker  
    if($difftext=="")  
    {  
       if($days>1)  
       $difftext=$days." hari yang lalu";  
       elseif($days==1)  
       $difftext=$days." hari yang lalu";  
    }  
    //hour checker  
    if($difftext=="")  
    {  
       if($hours>1)  
       $difftext=$hours." jam yang lalu";  
       elseif($hours==1)  
       $difftext=$hours." jam yang lalu";  
    }  
    //minutes checker  
    if($difftext=="")  
    {  
       if($minutes>1)  
       $difftext=$minutes." menit yang lalu";  
       elseif($minutes==1)  
       $difftext=$minutes." menit yang lalu";  
    }  
    //seconds checker  
    if($difftext=="")  
    {  
       if($seconds>1)  
       $difftext=$seconds." detik yang lalu";  
       elseif($seconds==1)  
       $difftext=$seconds." detik yang lalu";  
    }  
    return $difftext;  
}
function load_js($file,$path='assets/js/'){
	$CI = & get_instance();
	$files = explode(',',$file);
	foreach($files as $fl){
		if($fl)
		    $js .= '	<script type="text/javascript" src="'.$CI->data['base_url'].$path.$fl.'"></script>'."\n";
	}
	$CI->data['js_file'] .= $js;
}

function load_css($file, $path='assets/css/',$ret=false){
	$CI=& get_instance();
	$files = explode(',',$file);
	foreach($files as $fl){
		if($fl)
			$css .= '	<link rel="stylesheet" type="text/css" href="'.$CI->data['base_url'].$path.$fl.'">'."\n";
	}
	
	if ($ret==false) {
		$CI->data['css_file'] = $css;
	} else {
		return $css;
	}
}


function delete_cookie($name) {
	unset($_COOKIE["$name"]);
	setcookie("$name", null, -1, '/');

}

function valid_email($str){
    return ( ! preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $str)) ? FALSE : TRUE;
}

function remove_kutip($data){
	$data = str_replace("'",'',$data);
    return str_replace('"','',$data);
}

function check_block_ip(){
    $CI=& get_instance();
    $CI->load->library('blacklist');
    return $CI->blacklist->check_ip($_SERVER['REMOTE_ADDR'])->is_blocked();
}
function check_text_block($text){
    $CI=& get_instance();
    $CI->load->library('blacklist');
    return $CI->blacklist->check_text($text)->is_blocked();
}

function get_flash_session($name){
	$CI=& get_instance();
	$data = $CI->session->userdata($name);
	//$CI->session->unset_userdata($name);
	return $data;
}
/**
* Remove html news tag
* @author Agung Trilaksono Suwarto Putra <agungtrilaksonosp@gmail.com>
* @return string;
* @param string $data  Tags news data to be called;
*/
function remove_html_tag_news($data){
	return preg_replace('/ style=".*?"/i', '$1', strip_tags($data, '<i><a><b><u><div><hr>'));
}
/**
* Set flash session
* @author Agung Trilaksono Suwarto Putra <agungtrilaksonosp@gmail.com>
* @return command;
* @param string $name  Flash session name to be called;
* @param string $value  Flash session value to be called;
*/
function set_flash_session($name,$value){
    $CI =& get_instance();
    return $CI->session->set_userdata($name,$value);
}

/**
 * Form change password
 * @return [html]   [form change password]
 */
function form_change_pw($change_code='',$notif=''){
	$CI =& get_instance();
    $CI->data['have_an_account'] = have_an_account_login_here();
    if($notif!=''){
        $CI->data['notif'] = $notif;
        return $CI->parser->parse('apps/login/change-code-notvalid.html',$CI->data,true);
    } else {
        $CI->data['change_code'] = $change_code;
        return $CI->parser->parse('apps/login/form-change-pw.html',$CI->data,true);
    }
}


/**
 * HTML of have an account? login here
 * @return [html] [description]
 */
function have_an_account_login_here(){
    $CI =& get_instance();
    return $CI->parser->parse('apps/login/have-an-account-login-here.html',$CI->data,true);
}

/**
 * Get data module for frontend_menu modul stored in cache
 * @return [type] [description]
 */
function data_module_backend($cache_name='module_data'){
    $CI =& get_instance();
    $CI->load->driver('cache',array('adapter' => 'apc', 'backup' => 'file'));
    $CI->load->model('Module_model');
    if ( ! $data = $CI->cache->get($cache_name)) {
        $data = $CI->Module_model->findBy();
        $CI->cache->save($cache_name, $data, 300);
        $data = $CI->cache->get($cache_name);
    }
    return $data;
}

/**
 * Searching module data by ID
 * @param  string $cache_name   [cache name]
 * @param  string $id           [id]
 * @return [type]               [description]
 */
function search_module_by_id($id=''){
    $datas = data_module_backend();
    return $datas[array_search($id,array_column($datas, 'id'))];
}


/**
 * Get detail records of module selected
 * @param  string $controller   [description]
 * @param  string $function     [function call back]
 * @return [type]               [description]
 */
function module_detail($controller='',$function=''){
    $CI =& get_instance();
    $CI->data['controller_used'] = base_url().'apps/'.$function;
    return $CI->parser->parse("apps/$controller/index-module.html",$CI->data,true);
}