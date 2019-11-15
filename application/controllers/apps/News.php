<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman news
 * @author 	Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class News extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('News_model');
		$this->load->model('News_tags_model');
		$this->load->model('Tags_model');
	}

	function index(){
		$lang_name                  = lang_data('name');
		$data['btn_add']            = btn_add_export();
		$data['list_language']      = select_list(array('table'=>'ref_language','title'=>language('select_language', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_language'],'where'=>"id_ref_delete='0'"));
		$data['list_news_category'] = select_list(array('table'=>'ref_news_category','title'=>language('select_news_category', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_news_category'],'where'=>"id_ref_delete='0'"));
		$data['list_status']        = select_list(array('table'=>'ref_status_publish','title'=>language('select_status', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_status_publish'],'where'=>"id_ref_delete='0'"));
		render('apps/news/index',$data,'main-apps');
	}

	function records(){
		$data = $this->News_model->records();
		render('apps/news/records',$data,'blank');
	}

	function add($id=''){
		$lang_name = lang_data('name');
		if($id){
			$data = $this->News_model->findById($id);
			
			if(!$data){ die('404'); } // data not found

			$data['btn_process'] = btn_process(language('update',$lang_name));
			$tags                = $this->News_tags_model->findBy(array('id_ref_news'=>$id));
			
			foreach ($tags as $key => $value) 
            {
                $tag .=  ','.$value['tags'];
            }

            $data['tags']             = substr($tag,1);

		} else {
			$data['btn_process']      = btn_process(language('add',$lang_name));
			$data['id']               = '';
			$data['name']             = '';
			$data['uri_path']         = '';
			$data['title']            = '';
            $data['tags']             = '';
			$data['teaser']           = '';
			$data['publish_date']     = date('Y-m-d');
			$data['page_content']     = '';
			$data['seo_title']        = '';
			$data['meta_description'] = '';
			$data['meta_keywords']    = '';
			$data['youtube_link']     = '';
		}

		$tags_data = $this->News_tags_model->records_tags_all();
        foreach ($tags_data as $key => $value_tags) 
        {
            $tags_data_val .=  ",'".$value_tags['name']."'";
        }

        $data['tags_data']           = substr($tags_data_val,1);

		$img_thumb                   = image($data['img'],'small');
		$imagemanager                = imagemanager('img',$img_thumb);
		$data['img']                 = $imagemanager['browse'];
		$data['imagemanager_config'] = $imagemanager['config'];

		$data['list_language']      = select_list(array('table'=>'ref_language','title'=>language('select_language', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_language'],'where'=>"id_ref_delete='0'"));
		$data['list_news_category'] = select_list(array('table'=>'ref_news_category','title'=>language('select_news_category', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_news_category'],'where'=>"id_ref_delete='0'"));
		$data['list_status']        = select_list(array('table'=>'ref_status_publish','title'=>language('select_status', $lang_name),'id_ref_delete'=>0,'selected'=>$data['id_ref_status_publish'],'where'=>"id_ref_delete='0'"));
		$data['list_tags'] = select_list(array('table'=>'ref_tags','title'=>'','where'=> 'id_ref_delete=0'));

		render('apps/news/add',$data,'main-apps');
	}

	function process($idedit=''){
		$this->layout      = 'none';
		$post              = purify($this->input->post());
		$ret['error']      = 1;
		$where['a.uri_path'] = $post['uri_path'];

		if($idedit){
			$where['a.id !='] = $idedit;
		}

		$unik = $this->News_model->findBy($where);
		$this->form_validation->set_rules('title', '"Group Name"', 'required'); 
		$this->form_validation->set_rules('uri_path', '"Uri Path Name"', 'required'); 
		$this->form_validation->set_rules('teaser', '"Teaser"', 'required'); 
		$this->form_validation->set_rules('publish_date', '"Publish Date"', 'required'); 
		$this->form_validation->set_rules('page_content', '"Page Content"', 'required'); 
		if ($this->form_validation->run() == FALSE){
			$ret['message'] = validation_errors(' ',' ');
		} else if($unik){
			$ret['message']	= "Page URL $post[uri_path] already taken";
		} else {
			$tags = $post['tags'];
			unset($post['tags']);

			$this->db->trans_start();   
			if($idedit){
				auth_update();
				$ret['message'] = 'Update Success';
				$act			= "Update News";
				$this->News_model->update($post,$idedit);
			} else {
				auth_insert();
				$ret['message'] = 'Insert Success';
				$act			= "Insert News";
				$idedit = $this->News_model->insert($post);
			}
			detail_log();

			foreach ($tags as $key => $value) 
            {
                $value = strtolower($tags[$key]);
                if ($value)
                {
                    $cek = $this->Tags_model->fetchRow(array('name'=>$value));//liat tags name di tabel ref
                    if (!$cek)
                    {//kalo belom ada
                        $id_tags = $this->Tags_model->insert(array('name'=>$value,'uri_path'=>url_title($value)));//insert ke tabel ref
                        detail_log();
                    }
                    else
                    {
                        $id_tags = $cek['id']; //kalo udah ada, tinggal ambil idnya
                    }
                    $cekTagsNews = $this->News_tags_model->fetchRow(array('id_ref_news'=>$idedit,'id_ref_tags'=>$id_tags)); //liat di tabel news tags, (utk edit)
                    if (!$cekTagsNews)
                    {//kalo blm ada ya di insert
                        $tag['id_ref_news'] = $idedit;
                        $tag['id_ref_tags'] = $id_tags;
                        $id_news_tags = $this->News_tags_model->insert($tag);
                    }
                    else
                    {//kalo udah ada, ambil id nya utk di simpen sbg array utk kebutuhan delete
                        $id_news_tags = $cekTagsNews['id'];
                    }

                }

            }
			insert_log($act);
			$this->db->trans_complete();
			set_flash_session('message',$ret['message']);
			$ret['error'] = 0;
		}
		echo json_encode($ret);
	}

	function del(){
		auth_delete();
        $id     = $this->input->post('iddel');
        $data   = $this->News_model->delete($id);
        detail_log();
        insert_log("Delete News");
	}

	function select_category(){
		$this->load->model('News_category_model');
		$data = $this->News_category_model->records();
		render('apps/news/records-module',$data,'blank');
	}

	function export_to_xls(){
		$basedir = UPLOAD_DIR;
		if($_GET['download']) {
			$fileDir = $basedir.$_GET['download'];
			header('Content-Description: File Transfer');
			header('Content-Type: application/octet-stream');
			header('Content-Length: ' . filesize($fileDir));
			header('Content-Disposition: attachment; filename='.basename($fileDir));
			readfile($fileDir);unlink($fileDir);exit;
		} else {
			$post                          = $this->input->post();
			$alias['search_id']            = 'a.id';
			$alias['search_news_category'] = 'b.id';
			$alias['search_status']        = 'c.id';
			$alias['search_writer']        = 'd.fullname';
			$alias['search_language']      = 'e.id';
			where_grid($post, $alias);
			
			$this->load->library("PHPExcel");
			$objPHPExcel = new PHPExcel();
			$objPHPExcel->setActiveSheetIndex(0);    
			$objPHPExcel->getActiveSheet()->setCellValue('A1', 'NO');
			$objPHPExcel->getActiveSheet()->setCellValue('B1', 'ID');
			$objPHPExcel->getActiveSheet()->setCellValue('C1', 'NEWS CATEGORY');
			$objPHPExcel->getActiveSheet()->setCellValue('D1', 'NEWS TITLE');
			$objPHPExcel->getActiveSheet()->setCellValue('E1', 'TEASER');
			$objPHPExcel->getActiveSheet()->setCellValue('F1', 'URL');
			$objPHPExcel->getActiveSheet()->setCellValue('G1', 'CREATEDATE')->getStyle('H1:H1000')->getNumberFormat()->setFormatCode('[$-C09]d mmm yyyy;@');
			$objPHPExcel->getActiveSheet()->setCellValue('H1', 'PUBLISHDATE')->getStyle('H1:H1000')->getNumberFormat()->setFormatCode('[$-C09]d mmm yyyy;@');
			$objPHPExcel->getActiveSheet()->setCellValue('I1', 'STATUS PUBLISH');
			$objPHPExcel->getActiveSheet()->setCellValue('J1', 'HITS');
			$objPHPExcel->getActiveSheet()->setCellValue('K1', 'YOUTUBE LINK');
			$objPHPExcel->getActiveSheet()->setCellValue('L1', 'WRITER');
			$objPHPExcel->getActiveSheet()->setCellValue('M1', 'LANGUAGE');

			$data['data'] = $this->News_model->findBy();
			$filename     = 'news-report-'.date('Y-m-d-h-i-s').'.xlsx';
			$d = 2; $n = 0;
			foreach ($data['data'] as $key => $value){
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, ++$no);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['id']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['news_category']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['title']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['teaser']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, base_url().'article'.$value['uri_path_category'].'/'.$value['uri_path']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, date('Y-m-d H:i:s', strtotime($value['create_date'])));
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, date('Y-m-d', strtotime($value['publish_date'])));
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['status']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['hits']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['youtube_link']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['writer']);
				$objPHPExcel->getActiveSheet()->setCellValue(next_alphabet('A',$n++).$d, $value['language']);
				$d++;$n=0;
			}

			$objWriter 	= PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
			$dt 		= $objWriter->save($basedir.$filename);
			$ret['file_name'] 	= $filename;
			$ret['status'] 		= 'File Generated.';
		}
		echo json_encode($ret);
		exit;
	}
	
}

/*
 * End of file News.php
 * Location: ./application/controllers/News.php
 */