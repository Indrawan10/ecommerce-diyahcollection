<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Transaction extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$params = array('server_key' => $this->Settings_model->general()["server_api_midtrans"], 'production' => $this->config->item('midtrans_production'));
		$this->load->library('midtrans');
		$this->midtrans->config($params);
		$this->load->helper('url');
		$this->load->model('Categories_model');
		$this->load->model('Order_model');
	}

	public function process()
	{
		$order_id = $this->input->post('order_id');
		$action = $this->input->post('action');

		$mid = $this->midtrans_status($order_id);

		// switch ($mid->transaction_status) {
		// 	case 'settlement':
		// 		break;
		// 	case 'approve':
		// 		break;
		// 	case 'expire':
		// 		break;
		// 	case 'cancel':
		// 		break;
		// 	default:
		// 		break;
		// }

		if ($mid->transaction_status == "") {
			$this->session->set_flashdata('status', "<div class='alert alert-danger' role='alert'>
	            Pesanan Belum di bayar , Silahkan lakukan pembayaran
	            </div>");
		} else {
			$this->db->set('pay_status', $mid->transaction_status);
			$this->db->where('invoice_code', $order_id);
			$this->db->update('invoice');
			$this->session->set_flashdata('status', "<div class='alert alert-secondary' role='alert'>
	            Status pesanan dengan Order ID $order_id adalah $mid->transaction_status
	            </div>");
		}


		// switch ($action) {
		//     case 'status':

		//     	var_dump();die;
		//         // $this->status($order_id);
		//         break;
		//     case 'approve':
		//         $this->approve($order_id);
		//         break;
		//     case 'expire':
		//         $this->expire($order_id);
		//         break;
		//    	case 'cancel':
		//         $this->cancel($order_id);
		//         break;
		// }

		redirect(base_url() . 'administrator/orders');
	}

	public function status($order_id)
	{
		$status = $this->midtrans->status($order_id);
		$this->db->set('pay_status', $status->transaction_status);
		$this->db->where('invoice_code', $order_id);
		$this->db->update('invoice');
		$this->session->set_flashdata('status', "<div class='alert alert-secondary' role='alert'>
            Status pesanan dengan Order ID $order_id adalah $status->transaction_status
            </div>");
	}


	private function midtrans_status($order_id)
	{
		$curl = curl_init();
		$key = base64_encode($this->Settings_model->general()['server_api_midtrans']);

		curl_setopt_array($curl, [
			CURLOPT_URL => "https://api.sandbox.midtrans.com/v2/$order_id/status",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 30,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => "GET",
			CURLOPT_HTTPHEADER => [
				"accept: application/json",
				"authorization: Basic $key"
			],
		]);

		$response = curl_exec($curl);
		$err = curl_error($curl);

		curl_close($curl);

		if ($err) {
			return "cURL Error #:" . $err;
		} else {
			return json_decode($response);
		}
	}

	public function cancel($order_id)
	{
		$status = $this->midtrans->cancel($order_id);
		$this->db->set('pay_status', $status->transaction_status);
		$this->db->where('invoice_code', $order_id);
		$this->db->update('invoice');
		$this->session->set_flashdata('status', "<div class='alert alert-secondary' role='alert'>
            Status pesanan dengan Order ID $order_id telah dibatalkan
            </div>");
	}
	public function cancel_order($order_id)
	{

		$this->db->set('status', 5);
		$this->db->set('alasan_cancel', $this->input->post('alasan'));
		$this->db->set('rekening_pengembalian', $this->input->post('rekening_pengembalian'));
		$this->db->set('nama_rekening_pengembalian', $this->input->post('nama_rekening_pengembalian'));
		$this->db->where('invoice_code', $order_id);
		$this->db->update('invoice');
		$this->session->set_flashdata('status', "<div class='alert alert-secondary' role='alert'>
            Status pesanan dengan Order ID $order_id telah dibatalkan
            </div>");
		redirect(base_url('profile/transaction/' . $order_id));
	}
	public function konfirmasi_cancel()
	{
		$order_id = $this->input->post('invoice_code');
		$this->db->set('status', $this->input->post('status'));
		// $this->db->set('alasan', $this->input->post('alasan'));
		$this->db->where('invoice_code', $order_id);
		$this->db->update('invoice');
		if ($this->input->post('status')) {
			# code...
		}
		$this->session->set_flashdata('status', "<div class='alert alert-secondary' role='alert'>
            Status pesanan dengan Order ID $order_id telah dibatalkan
            </div>");
		redirect(base_url('administrator/orders/'));
	}
	public function approve($order_id)
	{
		echo 'test get approve </br>';
		print_r($this->midtrans->approve($order_id));
	}

	public function expire($order_id)
	{
		$status = $this->midtrans->expire($order_id);
		$this->db->set('pay_status', $status->transaction_status);
		$this->db->where('invoice_code', $order_id);
		$this->db->update('invoice');
		$this->session->set_flashdata('status', "<div class='alert alert-secondary' role='alert'>
            Status pesanan dengan Order ID $order_id telah diubah ke expired
            </div>");
	}
	public function invoice($id)
	{
		$product = $this->User_model->getProductByInvoice($id)->row();
		$data['ord'] = $this->User_model->getOrderByInvoice($id);
		if (!$data['ord']) {
			redirect(base_url() . 'profile/transaction');
		}
		$data['title'] = 'Detail Pesanan - ' . $this->Settings_model->general()["app_name"];
		$data['css'] = 'profile';
		$data['product_order'] = $this->User_model->getProductByInvoice($id);

		// $data['prd'] = $this->db->get_where('products', ['title' => $product->product_name])->row();
		$data['retur'] = $this->db->get_where('retur_penjualan', ['id_invoice' => $id])->row();

		$this->load->view('templates/header', $data);
		$this->load->view('templates/navbar');
		$this->load->view('page/invoice', $data);
	}
	public function print($id)
	{
		$data['title'] = 'Detail Pesanan - Admin Panel';
		$data['orders'] = $this->Order_model->getOrderByInvoice($id);
		$data['invoice'] = $this->Order_model->getDataInvoice($id);
		// Load view untuk print
		$this->load->view('page/invoice_print', $data);
	}
}
