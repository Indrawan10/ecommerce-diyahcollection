<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Complain extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->model('Categories_model');
		$this->load->model('Products_model');
		$this->load->model('Settings_model');
		$this->load->model('Promo_model');
		$this->load->helper('cookie');
	}


	public function index(){
		if ($_POST){
			$data = $this->input->post();
			$data['user_id'] = $_SESSION['id'];
			
			$this->db->insert('complain',$data);

			$this->session->set_flashdata('success', 'Complain Berhasil dibuat , Kami akan segera menanggapi');

			redirect('complain');
		} else {
			$data['title'] = 'Complain - ' . $this->Settings_model->general()["app_name"];
		    $data['css'] = 'products';
		    $data['responsive'] = 'product-responsive';

			$this->load->view('templates/header', $data);
			$this->load->view('templates/navbar');
			$this->load->view('complain');
			$this->load->view('templates/footerv2');
		}
	}

}