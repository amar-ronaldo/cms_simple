<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Controller untuk handle halaman ubah password
 * @author  Ismatul Maula <ismatul.maula@deptechdigital.com>
 * 
 */

class Backup_data extends CI_Controller{

    function __construct(){
        parent::__construct();
        $this->load->library('recurse_zip_library');
    }
    
    
    function index(){

        $backup_dir = BACKUP_DIR;
        $backup     = scandir($backup_dir.'db/',1);
        $this->load->helper('number');
        foreach ($backup as $key => $value) {
            if($value != '.' && $value !='..' && is_file($backup_dir.'db/'.$value)){
                $property1              = get_file_info($backup_dir.'db/'.$value);
                $data_db[$key]['file']  = $value;
                $data_db[$key]['size']  = byte_format($property1['size']);
                $data_db[$key]['nomor'] = ++$n;
                $data_db[$key]['path']  = base_url().'file-backup/db/'.$value;
            }
        }
        $data['data_db'] = $data_db;


        $dir    = $backup_dir.'/';
        $backup = scandir($backup_dir.'script/',1);
        $this->load->helper('number');
        foreach ($backup as $key => $value) {
            if($value != '.' && $value !='..' && is_file($backup_dir.'script/'.$value)){
                $property2                  = get_file_info($backup_dir.'script/'.$value);
                $data_script[$key]['file']  = $value;
                $data_script[$key]['size']  = byte_format($property2['size']);
                $data_script[$key]['nomor'] = ++$m;
                $data_script[$key]['path']  = base_url().'file-backup/script/'.$value;
            }
        }
        $data['data_script'] = $data_script;

        render('apps/backup-data/index',$data,'main-apps');
    }

    function download($file,$dir=''){
        $dir = $dir ? "$dir/" : '';
        $this->load->helper('download');
        force_download($file,read_file(BACKUP_DIR.$dir.$file));
    }

    function run_backup(){
        $post = $this->input->post();
        $ret['error'] = 1;
        $type = $post['backup_type'];
        switch ($type) {
            case 'db': // backup db
                $this->backup_database();
                $ret['error'] = 0;
                $ret['msg']   = '';
                break;
            default: // backup script
                $this->backup_script();
                $ret['error'] = 0;
                $ret['msg']   = '';
                break;
        }
        echo json_encode($ret);exit;
    }

    // backup files in directory
    function files(){
        $opt = array(
            'src' => dirname(__FILE__)."/../../../", // dir name to backup
            'dst' => BACKUP_DIR.'script/' // dir name backup output destination
        );
        $download = $this->recurse_zip_library->call($opt);
        redirect(base_url($download));
    }

    function backup_database(){
        $this->load->dbutil();

        $right_now = date("Y-m-d H-i-s");
        $prefs     = array(
            'format' => 'zip',
            'filename' => 'backup-db.sql'
        );

        $backup  =& $this->dbutil->backup($prefs);
        
        $db_name = BACKUP_NAME.'database-' . $right_now . '.zip'; // file name
        $save    = 'file-backup/db/' . $db_name; // dir name backup output destination

        $this->load->helper('file');
        write_file($save, $backup);

        $backup_dir = BACKUP_DIR.'db/';
        $backup     = scandir($backup_dir,1);
        foreach ($backup as  $value) {
            if($value != '.' && $value !='..'){
                $n++;
                if( $n > KEEP_BACKUP_FILE ){
                    unlink($backup_dir.$value);
                }
            }
        }

        // $this->load->helper('download');
        // force_download($db_name, $backup);
    }

    // function backup_database(){
    //     $this->load->dbutil();
    //     $right_now = date("Y-m-d H-i-s");
    //     $prefs = array(
    //         'format'      => 'zip',             
    //         'filename'    => BACKUP_NAME.'database-'.$right_now.'.sql'
    //     );

    //     $backup   =& $this->dbutil->backup($prefs); 
    //     $db_name  = 'file-backup/db/'. $right_now .'.zip';
    //     $save     = 'file-backup/db/'.$db_name;
    //     $this->load->helper('file');
    //     write_file($save, $backup);

    //     $backup = scandir(BACKUP_DIR.'db/',1);
    //     foreach ($backup as  $value) {
    //         if($value != '.' && $value !='..'){
    //             $n++;
    //             if( $n > KEEP_BACKUP_FILE ){
    //                 unlink($backup_dir.$value);
    //             }
    //         }
    //     }
    //     // optional
    //     // $this->load->model('Email_recipients_model');
    //     // $emails = $this->Email_recipients_model->findBy(array('is_delete'=>0));
    //     // foreach ($emails as $key => $value) {
    //     //     $this->sent_to_email($value['email'],$save,$right_now);
    //     // }
    //     // echo "Backup database success at ".$right_now;exit;
    // }

    function backup_script(){
        $this->benchmark->mark('code_start');
        $this->load->library('zip');
        $files  = array(
            '.htaccess',
            'index.php',
            'robots.txt',
            'info.php',
        );

        $folders = array(
            'application',
            'asset',
            'DB',
            'design',
            'external',
            'file_upload',
            'files',
            'images',
            'system',
            'template',
            'tests',
        );
        $base = str_replace('\\', '/',dirname(__FILE__).'/../../');;
        $backup_dir = BACKUP_DIR.'script/';
        foreach ($folders as $dir) {
            $this->zip->read_dir($base.$dir.'/', FALSE);
        }
        foreach ($files as $file) {
            $this->zip->read_file($base.$file); 
        }
        $date     = date('Y-m-d.h.i.s');
        $filename = BACKUP_NAME.'script-'.$date.".zip";
        $this->zip->archive($backup_dir.$filename);
        
        $this->benchmark->mark('code_end');
        // echo 'backup time : '.$this->benchmark->elapsed_time('code_start', 'code_end');
        $backup = scandir(BACKUP_DIR.'script/',1);
        foreach ($backup as  $value) {
            if($value != '.' && $value !='..'){
                $n++;
                if( $n > KEEP_BACKUP_FILE ){
                    unlink($backup_dir.$value);
                }
            }
        }
    }

}

/*
 * End of file Backup_data.php
 * Location: ./application/controllers/Backup_data.php
 */