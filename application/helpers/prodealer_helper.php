<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * @file
 * helper khusus utk prodealer
 */
 
/**
* Paging table
* @author     Anisa Fitri <anisa@deptechdigital.com>
* @return     Paging
*/

// function paging_footer($param)
// {
// 	$CI  = & get_instance();
// 	$get = purify($CI->input->get());
// 	$CI->load->library('pagination');

// 	$config['base_url']   = current_controller('function').'/';
// 	$config['total_rows'] = $param['total_data'];
// 	foreach ($page as $page_links) {
// 		$config['uri_segment'] = $page_links['page_link'];
// 		$config['first_link']  = $page_links['title'];
// 		$config['last_link']   = $page_links['title'];
// 		$config['next_link']   = $page_links['title'];
// 		$config['prev_link']   = $page_links['title'];
// 	}
// 	$config['anchor_class']    = 'class="tangan"';
// 	$config['attributes']      = array('class' => 'page-link');
// 	$config['per_page']        = $get['perpage'];
// 	$config['first_tag_open']  = '<li class="page-item">';
// 	$config['first_tag_close'] = '</li>';
// 	$config['num_tag_open']    = '<li class="page-item">';
// 	$config['num_tag_close']   = '</li>';
// 	$config['last_tag_open']   = '<li class="page-item">';
// 	$config['last_tag_close']  = '</li>';
// 	$config['first_tag_open']  = '<li class="page-item">';
// 	$config['first_tag_close'] = '</li>';
// 	$config['prev_tag_open']   = '<li class="page-item">';
// 	$config['prev_tag_close']  = '</li>';
// 	$config['next_tag_open']   = '<li class="page-item">';
// 	$config['next_tag_close']  = '</li>';
// 	$config['next_tag_open']   = '<li class="page-item">';
// 	$config['next_tag_close']  = '</li>';
// 	$config['cur_tag_open']    = '<li class="page-item active"><a class="page-link">';
// 	$config['cur_tag_close']   = '</a></li>';
// 	$CI->pagination->initialize($config);

// 	$remark = $param['remark'];
// 	$remark	 = ($remark) ? $remark : $CI->data['lang_data_not_available'];
// 	$paging  = '<div class="row">
// 					<div class="col-md-3">
// 						<div class="row">
// 							<div class="col-md-1 pt-2 mr-2">
// 								<i class="list-icon feather feather-refresh-ccw reload tangan">
// 								</i>
// 							</div>
// 							<div class="col-md-10">
// 								<div class="form-group">
// 									<div class="col-md-4">
// 										<span class="paging-select"></span>
// 									</div>
// 								</div>
// 							</div>
// 						</div>
// 					</div>
// 					<div class="col-md-4 lh-40">
// 						<span role="status" aria-live="polite">'.$remark.'</span>
// 					</div>
// 					<div class="col-md-5 text-right">
// 						<nav aria-label="Page navigation" class="float-right">
// 							<ul class="pagination">';
// 	$paging .= $CI->pagination->create_links();
// 	$paging .= '			</ul>
// 						</nav>
// 					</div>
// 				</div>';
// 	return $paging;
// }