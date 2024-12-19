<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Checkout extends CI_Controller {

	public function __construct(){
        parent::__construct();
        $this->load->model('Categories_model');
        $this->load->model('Payment_model');
        $this->load->model('Settings_model');
        $this->load->model('Order_model');
        $this->load->helper('cookie');
        $this->load->library('form_validation');
    }

    public function index(){
        if(!$this->session->userdata('login')){
            $cookie = get_cookie('ibq2cy38y');
            if($cookie == NULL){
                redirect(base_url() . 'login?redirect=checkout');
            }else{
                $getCookie = $this->db->get_where('user', ['cookie' => $cookie])->row_array();
                if($getCookie){
                    $dataCookie = $getCookie;
                    $dataSession = [
                        'id' => $dataCookie['id']
                    ];
                    $this->session->set_userdata('login', true);
                    $this->session->set_userdata($dataSession);
                }else{
                    redirect(base_url() . 'login?redirect=chekout');
                }
            }
        }
        $data['title'] = 'Pembayaran - ' . $this->Settings_model->general()["app_name"];
        $data['css'] = 'payment';
        $data['cart'] = $this->Order_model->getProductChekout();
        $data['provinces'] = $this->Payment_model->getProvinces();
        $this->load->view('templates/header', $data);
        $this->load->view('templates/navbar');
        $this->load->view('page/checkout', $data);
        $this->load->view('templates/footerv2');
    }

}
