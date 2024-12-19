<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Order_model extends CI_Model
{

    public function getCartUser()
    {
        $id = $this->session->userdata('id');
        return $this->db->get_where('cart', ['user' => $id]);
    }
    public function getProductChekout()
    {
        $id = $this->session->userdata('id');
        $this->db->where('id', $this->input->get('id'));
        return $this->db->get('products');
    }
    public function checkProductCart()
    {
        $id = $this->session->userdata('id');
        $this->db->select('cart.*, products.stock');
        $this->db->from('cart');
        $this->db->join('products', 'cart.id_product = products.id');
        $this->db->where('cart.user', $id);
        $query = $this->db->get();

        $cart_items = $query->result_array();
        $is_any_insufficient_stock = false;

        foreach ($cart_items as $item) {
            if ($item['qty'] > $item['stock']) {
                $is_any_insufficient_stock = true;
                break;
            }
        }

        if ($is_any_insufficient_stock) {
            return true;
        } else {
            return false;
        }
    }

    public function getOrders($number, $offset)
    {
        $this->db->order_by('id', 'desc');
        return $this->db->get('invoice', $number, $offset);
    }

    public function getOrderByInvoice($id)
    {
        return $this->db->get_where('transaction', ['id_invoice' => $id]);
    }

    public function getDataInvoice($id)
    {
        return $this->db->get_where('invoice', ['invoice_code' => $id])->row_array();
    }

    public function uploadFile()
    {
        $config['upload_path'] = './assets/images/confirmation/';
        $config['allowed_types'] = 'jpg|png|jpeg|pdf';
        $config['max_size'] = '2048';
        $config['file_name'] = round(microtime(true) * 1000);

        $this->load->library('upload', $config);
        if ($this->upload->do_upload('file')) {
            $return = array('result' => 'success', 'file' => $this->upload->data(), 'error' => '');
            return $return;
        } else {
            $return = array('result' => 'failed', 'file' => '', 'error' => $this->upload->display_errors());
            return $return;
        }
    }

    public function insertPaymentConfirmation($upload)
    {
        $invoice = $this->input->post('invoice', true);
        $file = $upload['file']['file_name'];
        $data = [
            'invoice' => $invoice,
            'file' => $file
        ];
        $this->db->insert('payment_proof', $data);
    }
}
