<?php 
defined('BASEPATH') or exit('No direct script access allowed');

class Rating extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Rating_model');
    }
    public function index() 
    {
        
    }

    public function store() 
    {
        $data =[
            'product_id' => $this->input->post('product_id'),
            'user_id' => $this->session->userdata('id'),
            'invoice_code' => $this->input->post('invoice_code'),
            'star' => $this->input->post('star') ? $this->input->post('star') : 0,
            'ulasan' => $this->input->post('ulasan'),
        ];
        
        $this->db->insert('rating', $data);
        redirect($this->agent->referrer());
    }
}
