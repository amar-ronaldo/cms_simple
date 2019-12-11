<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Controller untuk handle halaman home
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class News extends CI_Controller {
	function index($uri_path_category)
	{
		$this->load->model('News_model');
		$get = $this->input->get();

		$page = $get['page']  ? $get['page']  :0;
		$this->db->limit(4,$page* 4);
		$data['list_item'] = $this->News_model->findBy([
			'b.uri_path' => $uri_path_category
		]);
		if (!$data['list_item']) {
			show_404();
		}
		if (!empty($data['list_item'])) {
			foreach ($data['list_item'] as $key => &$value) {
				$value['news_title'] = 				$value['title'];
				$value['news_writer'] = 				$value['writer'];
				$value['news_teaser'] = 				$value['teaser'];
				$value['news_publish_date'] = 				 iso_date_custom_format($value['publish_date'],'d F Y');
				$value['news_img'] = 				$value['img'];
				$value['news_uri_path_category'] = 				$value['uri_path_category'];
				$value['news_uri_path'] = 				$value['uri_path'];
			}
		}

		$this->db->limit(4, ($page+1) *4);
		$check = $this->News_model->findBy([
			'b.uri_path' => $uri_path_category
		]);
		$data['news_uri_path_category'] = $data['list_item'][0]['news_uri_path_category'] ? $data['list_item'][0]['news_uri_path_category'] : '-';
		$data['news_page'] = $page+1;
		$data['news_more']  = $check ? '' : 'hide';
		$ret['news_name']  = $data['list_item'][0]['news_category'];

		$ret['content_news'] = render_front('front/news/list_item', $data,'blank',true);
		if ($get) {
			echo $ret['content_news'];exit;
		}else{
			return  render_front('front/news/index', $ret,'main-front');
		}
	}
	function detail($uri_path_category,$uri_path){
		$this->load->model('News_model');
		$this->load->model('News_image_model');
		$data = $this->News_model->findBy([
			'a.uri_path'=>$uri_path
		],1);
		if (!$data) {
			show_404();
		}
		foreach ($data as $key => $value) {
			if ($key == 'publish_date') {
				$data['news_'.$key] = 				 iso_date_custom_format($value,'d F Y');
			}else{
				$data['news_'.$key] = 				 $value;
			}
		}

		$data_image = $this->News_image_model->findById($data['id']);
		if (!empty($data_image)) {
			foreach ($data_image as $key => &$value) {
				$value['news_image'] = $value['img'];
			}
		}else{
			$data_image = $data['img'] ? [['news_image'=>$data['img']]] : [];
		}

		$data['images'] = $data_image;
		$data['related_content'] = $this->related_content($uri_path_category,$data);
		if ($uri_path_category == 'sejarah') {
			render_front('front/news/detail_sejarah', $data, 'main-front');
		}else{
			render_front('front/news/detail', $data,'main-front');
		}
	}
	function related_content($uri_path_category ='',$data)
	{
		$this->load->model('News_model');
		$this->db->limit(4);
		
		$data = $this->News_model->findBy([
			'b.uri_path' => $uri_path_category,
			'a.id !=' =>  $data['id']
		]);
		if (!empty($data)) {
			foreach ($data as $key => &$value) {
				$value['related_name'] = 				$value['title'];
				$value['related_img'] = 				$value['img'];
				$value['related_uri_path_category'] = 				$value['uri_path_category'];
				$value['related_uri_path'] = 				$value['uri_path'];
				$value['related_publish_date'] = 				iso_date_custom_format($value['publish_date'], 'd F Y');
			}
		}
		return $data;
	}

}

/*
 * End of file Home.php
 * Location: ./application/controllers/Home.php
 */