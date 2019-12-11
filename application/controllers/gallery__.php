<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Controller untuk handle halaman home
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Gallery extends CI_Controller {
	function index($uri_path_category)
	{
		$this->load->model('Gallery_model');
		$get = $this->input->get();

		$page = $get['page']  ? $get['page']  :0;
		$this->db->limit(4,$page* 4);
		$data['list_item'] = $this->Gallery_model->findBy([
			'b.uri_path' => $uri_path_category
		]);
		if (!$data['list_item']) {
			show_404();
		}
		if (!empty($data['list_item'])) {
			foreach ($data['list_item'] as $key => &$value) {
				$value['gallery_title'] = 				$value['title'];
				$value['gallery_img'] = 				$value['img'];
				$value['gallery_uri_path_category'] = 				$value['uri_path_category'];
				$value['gallery_uri_path'] = 				$value['uri_path'];
			}
		}

		$this->db->limit(4, ($page+1) *4);
		$check = $this->Gallery_model->findBy([
			'b.uri_path' => $uri_path_category
		]);
		$data['gallery_uri_path_category'] = $data['list_item'][0]['gallery_uri_path_category'] ? $data['list_item'][0]['gallery_uri_path_category'] : '-';
		$data['gallery_page'] = $page+1;
		$data['gallery_more']  = $check ? '' : 'hide';
		$ret['gallery_name']  = $data['list_item'][0]['gallery_category'];

		$ret['content_gallery'] = render_front('front/gallery/list_item', $data,'blank',true);
		if ($get) {
			echo $ret['content_gallery'];exit;
		}else{
			return  render_front('front/gallery/index', $ret,'main-front');
		}
	}
	function detail($uri_path_category,$uri_path){
		$this->load->model('Gallery_model');
		$this->load->model('Gallery_image_model');
		$data = $this->Gallery_model->findBy([
			'a.uri_path'=>$uri_path
		],1);
		if (!$data) {
			show_404();
		}

		$data_image = $this->Gallery_image_model->findById($data['id']);
		if (!empty($data_image)) {
			foreach ($data_image as $key => &$value) {
				$value['gallery_image'] = $value['img'];
			}
		}else{
			$data_image = $data['img'] ? [['gallery_image'=>$data['img']]] : [];
		}

		$data['images'] = $data_image;
		$data['gallery_category'] = $data[0]['gallery_category'];
		$data['related_content'] = $this->related_content($uri_path_category,$data);
		render_front('front/gallery/detail', $data,'main-front');
	}
	function related_content($uri_path_category ='',$data)
	{
		$this->load->model('Gallery_model');
		$this->db->limit(4);
		
		$data = $this->Gallery_model->findBy([
			'b.uri_path' => $uri_path_category,
			'a.id !=' =>  $data['id']
		]);
		if (!empty($data)) {
			foreach ($data as $key => &$value) {
				$value['related_name'] = 				$value['title'];
				$value['related_img'] = 				$value['img'];
				$value['related_uri_path_category'] = 				$value['uri_path_category'];
				$value['related_uri_path'] = 				$value['uri_path'];
			}
		}
		return $data;
	}

}

/*
 * End of file Home.php
 * Location: ./application/controllers/Home.php
 */