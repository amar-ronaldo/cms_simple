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
		$this->load->model('News_image_model');
		$this->load->model('banner_model');
		$this->load->model('Gallery_model');
		
		$today = date('Y-m-d');

		// banner 
			$banner['banner'] = $this->banner_model->findBy([
			'id_ref_status_publish' => 2,
			'publish_date <= ' => $today
			]);
				foreach ($banner['banner'] as $key => &$_banner) {
				$_banner['hide_link'] = empty($_banner['link']) || $_banner['link'] == '#' ? 'hide':'';
				$_banner['title'] = str_replace(PHP_EOL, "<br>", $_banner["title"]);
				$_banner['teaser'] = str_replace(PHP_EOL, "<br>", $_banner["teaser"]);
			}
			$data['banner'] = render_front('front/home/_banner', $banner,'blank',true);

		// Sejarah
			$id_pages_sejarah = 10;
			$sejarah_page = $this->News_model->findById($id_pages_sejarah);

			$sejarah['image'] = $this->News_image_model->findById('10');
			foreach ($sejarah['image'] as $key => &$_sejarah) {
				$_sejarah['index_sejarah'] = $key+1;
				$_sejarah['img_sejarah'] = $_sejarah['img'];
				$_sejarah['base_url'] = base_url();
			}
			
			$sejarah['page_name'] = $sejarah_page['title'];
			$sejarah['teaser'] = $sejarah_page['teaser'];
			$sejarah['uri_path'] = $sejarah_page['uri_path'];
			$sejarah['uri_path_category'] = $sejarah_page['uri_path_category'];
			$data['sejarah'] = render_front('front/home/_sejarah', $sejarah, 'blank', true);
		//
		

		// pengumuman
			$id_pages_pengumuman = 11;
			$pengumuman_page = $this->Pages_model->findById($id_pages_pengumuman);

			$this->db->limit(4);
			$this->db->order_by('publish_date', 'desc');
			
			$pengumuman_data = $this->News_model->findBy([
				'id_ref_news_category'=> 4,
				'id_ref_status_publish' => 2,
				'publish_date <= ' => $today
			]);
			if (!empty($pengumuman_data)) {
				foreach ($pengumuman_data as $key => &$_pengumuman) {
					$_pengumuman['publish_date'] = iso_date_custom_format($_pengumuman['publish_date'],'d F Y');
					$_pengumuman['link'] = base_url().'news/detail/'.$_pengumuman['uri_path_category'].'/'.$_pengumuman['uri_path'];
				}
				$pengumuman_uri_path_category = $pengumuman_data[0]['uri_path_category'];
			}else{
				$pengumuman = [];
			}

			$pengumuman['page_name'] = $pengumuman_page['page_name'];
			$pengumuman['teaser'] = $pengumuman_page['teaser'];
			$pengumuman['uri_path'] = $pengumuman_uri_path_category;
			$pengumuman['pengumuman'] = $pengumuman_data;
			$data['pengumuman'] = render_front('front/home/_pengumuman', $pengumuman, 'blank', true);

		//

		// News
		$id_pages_news = 12;
		$news_page = $this->Pages_model->findById($id_pages_news);
		$this->db->limit(4);
		
		$news_data = $this->News_model->findBy([
			'id_ref_news_category' => 3,
			'id_ref_status_publish' => 2,
			'publish_date <= ' => $today
		]);
	
		foreach ($news_data as $key => &$_news) {
			$aliment =   ($key % 2) == 1 ? 'right': 'left';
			$_news['aligment'] = $aliment;
			$_news['link'] = base_url('news/detail/'.$_news['uri_path_category'].'/'.$_news['uri_path']);
			$_news['link_2'] = $_news['link'];
			$_news['publish_date'] = iso_date_custom_format($_news['publish_date'],'d F Y');
			$_news['image_left'] =
				$aliment == 'left' ?
			'<div class="feature-post">
				<a href="'.$_news['link'].'"><img src="'. base_url('front_asset/images/'.$_news['img']).'" alt="image"></a>
			</div>' : '';

			$_news['image_right'] =
				$aliment == 'right' ? 
			'<div class="feature-post">
				<a href="'.$_news['link'].'"><img src="'. base_url('front_asset/images/'.$_news['img']).'" alt="image"></a>
			</div>' : '';
		}
		$news_data = $news_data ? $news_data : [];

		$news['page_name'] = $news_page['page_name'];
		$news['teaser'] = $news_page['teaser'];
		$news['uri_path_category'] = $news_data[0]['uri_path_category'];
		$news['news'] = $news_data;
		$data['news'] = render_front('front/home/_news', $news, 'blank', true);

		// 

		// gallery
			$id_pages_gallery = 10;
			$gallery_page = $this->Pages_model->findById($id_pages_gallery);

			$this->db->limit(8);
			$gallery_data = $this->Gallery_model->findBy([
				'id_ref_gallery_category' => 1,
				'id_ref_status_publish' => 2,
				'publish_date <= ' => $today
			]);
			if (!empty($gallery_data)) {
				foreach ($gallery_data as $key => &$_gallery) {
					$_gallery['link'] = base_url(). 'gallery/detail/' .$_gallery['uri_path_category'].'/'.$_gallery['uri_path'];
				}
			}else{
				$gallery_data = '';
			}

			$gallery['page_name'] = $gallery_page['page_name'];
			$gallery['teaser'] = $gallery_page['teaser'];
			$gallery['uri_path_category'] = $gallery_data[0]['uri_path_category'];
			$gallery['gallery'] = $gallery_data;
			$data['gallery'] = render_front('front/home/_gallery', $gallery, 'blank', true);

		// 

		// Tarbiyah Intitut PTIQ
			$id_pages_tarbiyah = 7;
			$tarbiyah_page = $this->Pages_model->findById($id_pages_tarbiyah);

			$tarbiyah['page_name'] = $tarbiyah_page['page_name'];
			$tarbiyah['teaser'] = $tarbiyah_page['teaser'];
			$tarbiyah['page_content'] = $tarbiyah_page['page_content'];
			$data['tarbiyah'] = render_front('front/home/_tarbiyah', $tarbiyah, 'blank', true);

		//

		// Testimonial
			$id_pages_testimonial = 8;
			$testimonial_page = $this->Pages_model->findById($id_pages_testimonial);

			$testimonial['img'] = $testimonial_page['img'];
			$testimonial['page_content'] = $testimonial_page['page_content'];
			$data['testimonial'] = render_front('front/home/_testimonial', $testimonial, 'blank', true);

		// 

		// Akreditasi
			$id_pages_akreditasi = 9;
			$akreditasi_page = $this->Pages_model->findById($id_pages_akreditasi);

			$akreditasi['page_name'] = $akreditasi_page['page_name'];
			$akreditasi['page_content'] = $akreditasi_page['page_content'];
			$akreditasi['teaser'] = $akreditasi_page['teaser'];
			$data['akreditasi'] = render_front('front/home/_akreditasi', $akreditasi, 'blank', true);

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