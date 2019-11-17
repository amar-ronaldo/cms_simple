<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Controller untuk handle halaman home
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Home extends CI_Controller {
	
	function index(){
		$this->load->model('Pages_model');
		$this->load->model('News_model');
		$this->load->model('banner_model');
		$today = date('Y-m-d');

		// banner 
			$data['banner'] = $this->banner_model->findBy([
			'id_ref_status_publish' => 2,
			'publish_date >= ' => $today
			]);
			foreach ($data['banner'] as $key => &$value) {
				$value['hide_link'] = empty($value['link']) || $value['link'] == '#' ? 'hide':'';
				$value['title'] = str_replace(PHP_EOL, "<br>", $value["title"]);
				$value['teaser'] = str_replace(PHP_EOL, "<br>", $value["teaser"]);
			}
		// $data['sejarah'] = 

		// pengumuman
			$id_pages_pengumuman = 11;
			$pengumuman = $this->Pages_model->findById($id_pages_pengumuman);

			$this->db->limit(4);
			$pengumuman_data = $this->News_model->findBy([
				'id_ref_news_category'=> 4,
				'id_ref_status_publish' => 2,
				'publish_date >= ' => $today
			]);
			$pengumuman_data = $pengumuman_data ? $pengumuman_data :[];

			$data['pengumuman_page_name'] = $pengumuman['page_name'];
			$data['pengumuman_teaser'] = $pengumuman['teaser'];
			$data['pengumuman'] = $pengumuman_data;
		//

		// News
		$id_pages_news = 12;
		$news = $this->Pages_model->findById($id_pages_news);
		$this->db->limit(4);
		
		$news_data = $this->News_model->findBy([
			'id_ref_news_category' => 3,
			'id_ref_status_publish' => 2,
			'publish_date >= ' => $today
		]);
		foreach ($news_data as $key => $value) {
			$aliment =   ($key % 2) == 1 ? 'right': 'left';
			$news_data[$key]['aligment'] = $aliment;
			$news_data[$key]['link'] = base_url('news/detail/'.$value['uri_path_category'].'/'.$value['uri_path']);
			$news_data[$key]['publish_date'] = iso_date_custom_format($value['publish_date'],'d F Y');
			$news_data[$key]['image_left'] =
				$aliment == 'left' ?
			'<div class="feature-post">
				<a href="'.base_url().'news-detail.html"><img src="'. base_url('front_asset/images/'.$value['img']).'" alt="image"></a>
			</div>' : '';

			$news_data[$key]['image_right'] =
				$aliment == 'right' ? 
			'<div class="feature-post">
				<a href="'.base_url().'news-detail.html"><img src="'. base_url('front_asset/images/'.$value['img']).'" alt="image"></a>
			</div>' : '';
		}
		$news_data = $news_data ? $news_data : [];

		$data['news_page_name'] = $news['page_name'];
		$data['news_teaser'] = $news['teaser'];
		$data['news'] = $news_data;
		// 

		// gallery
			$id_pages_gallery = 10;
			$gallery = $this->Pages_model->findById($id_pages_gallery);

			$this->db->limit(8);
			$gallery_data = [];
			// $this->News_model->findBy([
			// 	'id_ref_news_category' => 4,
			// 	'id_ref_status_publish' => 2,
			// 	'publish_date >= ' => $today
			// ]);
			$gallery_data = $gallery_data ? $gallery_data : [];

			$data['gallery_page_name'] = $gallery['page_name'];
			$data['gallery_teaser'] = $gallery['teaser'];
			$data['gallery'] = $gallery_data;
		// 

		// Tarbiyah Intitut PTIQ
			$id_pages_tarbiyah = 7;
			$tarbiyah = $this->Pages_model->findById($id_pages_tarbiyah);

			$data['tarbiyah_page_name'] = $tarbiyah['page_name'];
			$data['tarbiyah_teaser'] = $tarbiyah['teaser'];
			$data['tarbiyah_page_content'] = $tarbiyah['page_content'];
		//

		// Testimonial
			$id_pages_testimonial = 8;
			$testimonial = $this->Pages_model->findById($id_pages_testimonial);

			$data['testimonial_img'] = $testimonial['img'];
			$data['testimonial_page_content'] = $testimonial['page_content'];
		// 

		// Akreditasi
			$id_pages_akreditasi = 9;
			$akreditasi = $this->Pages_model->findById($id_pages_akreditasi);

			$data['akreditasi_page_name'] = $akreditasi['page_name'];
			$data['akreditasi_page_content'] = $akreditasi['page_content'];
			$data['akreditasi_teaser'] = $akreditasi['teaser'];
		// 

		// maps
			$id_pages_maps = 13;
			$maps = $this->Pages_model->findById($id_pages_maps);

			$data['maps_page_content'] = $maps['page_content'];
		// 

	

		render_front('front/index',$data,'main-front');
	}

}

/*
 * End of file Home.php
 * Location: ./application/controllers/Home.php
 */