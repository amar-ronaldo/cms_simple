<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * @file
 * common function
 * @author Agung Iskandar <agung.iskandar@gmail.com>
 */

function is_file_exsist($path,$file){
	$fl = str_replace('//', '/', $path.'/'.$file);
	if(is_file($fl)){
		return $file;
	}
}
function last_query(){
	 $CI 		= & get_instance();
	echo '<pre>'.$CI->db->last_query().'</pre>';
}
function is_file_copy($path,$file){
	$fl = str_replace('//', '/', $path.'/'.$file);
	return $fl;	
}
/**
 * Upload physic file to other folder
 * @param  string  $field        [description]
 * @param  string  $path         [description]
 * @param  string  $allowed_type [description]
 * @param  integer $max_size     [description]
 * @return [type]                [description]
 */
function upload_file($field='',$path='',$allowed_type='*',$max_size=0){
	$CI =& get_instance();
	$name 	= strtolower($_FILES[$field]['name']);
	$ext 	= end(explode('.',$name));

	$CI->load->helper(array('form', 'url'));
	$config['upload_path'] 	= UPLOAD_DIR.$path;
	$config['allowed_types']= $allowed_type;
	$config['file_name'] 	= url_title(str_replace($ext,'',$name));
	$config['max_size']		= $max_size;

	$CI->load->library('upload', $config);
	if(! $CI->upload->do_upload($field)){
		return $CI->upload->display_errors(' ', ' ');
	} else {
		return $CI->upload->data();
	}
}

function imagemanager($field='img',$img='',$max_width_cropzoom=277,$max_height_cropzoom=150,$id='',$imgname='',$idTitle=''){
	$CI 		= & get_instance();
	$html['config'] = '
	<div class="modal modal-color-scheme fade invis" id="popImageManager">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header text-inverse">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h5 class="modal-title">Image Manager - Max Filesize ('.ini_get('upload_max_filesize').') </h5>
					<div class="row mt-3">
						<div class="col-6 col-md-6"><input type="text" id="search-picture" class="form-control" placeholder="Search..."></div>
						<div class="col-3 col-md-3"><input type="text" name="startDate" id="searchImageByTanggal" class="form-control date-picker" placeholder="Search by Date..." /></div>
						<div class="col-3 col-md-3"><button class="btn btn-info" id="search_image_manager"><i class="fa fa-search"></i>  Search</button></div>
					</div>
				</div>
				<div class="modal-body">
					<div class="row-fluid" id="list-image-manager">
						<i class="fa fa-refresh fa-spin"></i> Loading...
					</div>
				</div>
				<span class="col-md-offset-1">
					<div class="pagination"></div>
				</span>
				<div class="modal-footer">
					<div class="row" style="width:100%;">
						<div class="col-lg-6 col-sm-6 col-6">
							<input type="file" id="imagemanagersource"  name="img">
						</div>
						<div class="col-lg-3 col-sm-3 col-3">
							<label style="text-transform:none;"><input type="checkbox" checked value="1" id="is_public"> Public Access</label>
						</div>
						<div class="col-lg-3 col-sm-3 col-3">
							<a class="btn btn-primary" id="upload-img">Upload</a>
						</div>
					</div>
				</div> 
			</div>
		</div>
	</div>
	<div class="modal modal-color-scheme fade invis" id="popImageManagerDetail">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header text-inverse">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">Image Detail </h4>
				</div>
				<div class="modal-body">
					<img id="imageDetail" width="100%">
				</div>
			</div>
		</div>
	</div>
	<div class="modal modal-color-scheme fade invis modal-message" id="modal-crop">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">Create Thumbnail </h4>
				</div>
				<div class="modal-body">
					<div id="crop_container"></div>
					<div id="image-thumb">
						<img src="'.base_url().'images/article/small/no_image.png">
					</div>
					<a id="crop" class="btn btn-primary">Create Thumbnail</a>
				</div>
				<div class="clearfix">&nbsp;</div>
				<div class="modal-footer">
					<a id="imagemanager-cancel" class="btn btn-warning"> Cancel </a>
					<a class="btn btn-primary" id="imagemanager-save"> Save </a>
					<input type="hidden" id="imagemanager-name" value="'.$imgname.'">
					<input type="hidden" id="imagemanager-getkey" value="'.$idTitle.'">
				</div>
			</div>
		</div>
	</div>
	<script>
	    var max_width_cropzoom = "'.$max_width_cropzoom.'";
	    var max_height_cropzoom = "'.$max_height_cropzoom.'";
	    var function_pagination = 0;
	</script>
	<link href="'.$CI->baseUrl.'template/assets/plugins/cropzoom/jquery.cropzoom.css" rel="Stylesheet" type="text/css" /> 
	<script type="text/javascript" src="'.$CI->baseUrl.'template/assets/plugins/cropzoom/jquery.cropzoom.js"></script>
';
$html['browse'] = '<div class="browse-image" id="'.$field.$id.'">
				<img src="'.$img.'" width="100%">
				<div>Select Image</div>
				<i class="fa fa-file-picture-o" style="font-size: 60px;"></i>
			</div>
			<input type="hidden" name="'.$field.'">';
return $html;
}

function filemanager($key,$value) {
	// echo $key;exit();
	$CI 		=& get_instance();

	$id    = ($key) ? 'fl-'.$key : 'fl-1';
	$out   = ($key) ? '-'.$key : '-1';
	$namex = ($key) ? 'file[]' : 'file';
	$value = ($value) ? $value : '';

	$html['browse'] = '	<div class="fileUpload btn btn-info col-md-2">
						    <span>Select File</span>
						    <input type="file" name="'.$namex.'" class="uploadFile" id="'.$id.'" />
						</div>
						<span class="col-md-4" style="padding-top: 10px !important;">
							<input class="output-file'.$out.' form-control" value="'.$value.'" placeholder="Choose File" disabled="disabled" />
							<label class="msg-inf msg-info'.$out.'"></label>
						</span>			
					';
	$html['config'] = load_css('filemanager.css','assets/plugins/filemanager/',true);
	$html['config'] .= load_jsx('filemanager.js','assets/plugins/filemanager/',true);

	return $html;
}
function fileToUpload($file,$key,$fileRename='') {
	$CI 		=& get_instance();
	/*echo $key;
	print_r($file['name'][$key]);exit();*/
	if($fileRename == ''){
		$fileRename = $file['name'][$key];
	}

	$_FILES['userfile']['name']     = $fileRename;
	$_FILES['userfile']['type']     = $file['type'][$key];
	$_FILES['userfile']['tmp_name'] = $file['tmp_name'][$key];
	$_FILES['userfile']['error']    = $file['error'][$key];
	$_FILES['userfile']['size']     = $file['size'][$key];

	$config['upload_path']          = './file_upload/';
	$config['allowed_types']        = '*';
    $config['max_size']             = 20000000;

	//load library upload;
	$CI->load->library('upload',$config);
	$CI->upload->initialize($config);
	$CI->upload->do_upload();

	/*if ($CI->upload->do_upload('userfile'))
    {
    	$CI->upload->data();
    	echo "berhasil";exit();
    }
    else
    {
        print_r($CI->upload->display_errors());exit();
    }*/
}



function multipleUpload($file, $path, $maxSize) {
	$CI 		=& get_instance();
	/*echo $key;
	print_r($file['name'][$key]);exit();*/

	$_FILES['userfile']['name']     = $file['name'];
	$_FILES['userfile']['type']     = $file['type'];
	$_FILES['userfile']['tmp_name'] = $file['tmp_name'];
	$_FILES['userfile']['error']    = $file['error'];
	$_FILES['userfile']['size']     = $file['size'];

	$config['upload_path']          = $path;
	$config['allowed_types']        = '*';
    $config['max_size']             = $maxSize;

	//load library upload;
	$CI->load->library('upload',$config);
	$CI->upload->initialize($config);
	$CI->upload->do_upload();

	return $CI->upload->data();

	/*if ($CI->upload->do_upload('userfile'))
    {
    	$CI->upload->data();
    	echo "berhasil";exit();
    }
    else
    {
        print_r($CI->upload->display_errors());exit();
    }*/
}


function is_edit_news($id_news,$user_id_create,$approval_level_news,$type){
 	$CI 			= & get_instance();
	$CI->load->model('newsModel');

	$grup 			= $CI->session->userdata['ADM_SESS']['admin_id_ref_auth_user_group'];
	$edit_enable	= "<a href='".$CI->currentController."add/$id_news' title='Edit Data' class='fa fa-pencil-square-o tangan action-form-icon update'></a>";
	$edit_disable	= '<i class="fa fa-pencil-square-o tangan action-form-icon update"></i>';
	if($id_news == '' || ((id_user() == $user_id_create  && $approval_level_news === 0 ) || $approval_level_news == $CI->newsModel->approvalLevelGroup) || $grup == 4){
		$ret =  $type == 'return' ? 1 : $edit_enable ;
	}
	else{
		$ret =  $type == 'return'  ? 0 : $edit_disable ;
	}
	return $ret;
}
function is_delete_news($id_news,$user_id_create,$approval_level_news,$type){
 	$CI 			= & get_instance();
	$grup 			= $CI->session->userdata['ADM_SESS']['admin_id_ref_auth_user_group'];
	$delete_enable 	= "<a title='Delete Data' class='fa fa-trash-o action-form-icon tangan hapus delete' id='$id_news' data-url-rm='del'></a>";
	$delete_disable = '<i class="fa fa-trash-o tangan delete action-form-icon"></i>';
	if((($grup == 1 || id_user() == $user_id_create || $approval_level_news !=0) && $approval_level_news === 0) || $grup == 1){
		$ret =  $type == 'return' ? 1 : $delete_enable ;
	}
	else{
		$ret =  $type == 'return'  ? 0 : $delete_disable ;
	}
	return $ret;
}
function is_edit_publish_status(){
    $CI 			= & get_instance();
	$grup 			= $CI->session->userdata['ADM_SESS']['admin_id_ref_auth_user_group'];
	if($grup == 4){
		$ret =  '';
	}
	else{
		$ret =  'hide';
	}
	return $ret;
}
function enable_edit_editors_choice(){
	$CI 			= & get_instance();
	$grup 			= $CI->session->userdata['ADM_SESS']['admin_id_ref_auth_user_group'];
	if($grup == 2){
		$ret =  'hide';
	}
	else{
		$ret =  '';
	}
	return $ret;
}

function md5plus($string) {
	$CI = & get_instance();
	return '_'.md5('KSI'.$string);
}

function md5field($string,$alias='') {
	$CI    = & get_instance();
	$alias = ($alias) ? "as $alias" : '';
	return "CONCAT('_',md5(CONCAT('KSI',$string))) $alias";
}
// function auth_news($id_user_create,$approval_level_news,$app){
// 	 $id_user 	= id_user();


// }