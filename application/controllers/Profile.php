<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profile extends CI_Controller {

	public function __construct(){
        parent::__construct();
        $this->load->model('Categories_model');
        $this->load->helper('cookie');
        $this->load->library('form_validation');
        if(!$this->session->userdata('login')){
            $cookie = get_cookie('e382jxndj');
            if($cookie == NULL){
                redirect(base_url() . 'login?redirect=profile');
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
                    redirect(base_url() . 'login?redirect=profile');
                }
            }
        }
    }

    public function index(){
        $data['title'] = 'Profil - ' . $this->Settings_model->general()["app_name"];
        $data['css'] = 'profile';
        $this->load->view('templates/header', $data);
        $this->load->view('templates/navbar');
        $this->load->view('profile/index');
        $this->load->view('templates/footerv2');
    }

    public function transaction(){
        $data['title'] = 'Transaksi - ' . $this->Settings_model->general()["app_name"];
        $data['css'] = 'profile';
        $data['transaction'] = $this->User_model->getOrder();
        $this->load->view('templates/header', $data);
        $this->load->view('templates/navbar');
        $this->load->view('profile/order', $data);
        $this->load->view('templates/footerv2');
    }

    public function detail_order($id){
        $product = $this->User_model->getProductByInvoice($id)->row();
        $data['ord'] = $this->User_model->getOrderByInvoice($id);
        if(!$data['ord']){
            redirect(base_url() . 'profile/transaction');
        }
        $data['title'] = 'Detail Pesanan - ' . $this->Settings_model->general()["app_name"];
        $data['css'] = 'profile';
        $data['product_order'] = $this->User_model->getProductByInvoice($id);
       
        // $data['prd'] = $this->db->get_where('products', ['title' => $product->product_name])->row();
        $data['retur'] = $this->db->get_where('retur_penjualan',['id_invoice'=>$id])->row();
      
        $this->load->view('templates/header', $data);
        $this->load->view('templates/navbar');
        $this->load->view('profile/detail_order', $data);
        $this->load->view('templates/footerv2');
    }

    public function cararetur($id){
        if ($_POST) {
            $insert = $_POST;

            $config['upload_path']          = './uploads/';
            $config['allowed_types']        = '*';
     
            $this->load->library('upload', $config);
     
            if ( ! $this->upload->do_upload('bukti')){
                $error = array('error' => $this->upload->display_errors());
            }else{
                $imageDetailArray = array('upload_data' => $this->upload->data());
                $insert['bukti'] = $imageDetailArray['upload_data']['file_name'];
            }

            $this->db->where('id',$id);
            $this->db->set('norek',$insert['norek']);
            $this->db->set('jenis_bank',$insert['jenis_bank']);
            $this->db->set('bukti',$insert['bukti']??'');
            $this->db->update('retur_penjualan');

            $this->session->set_flashdata('success', "<script>
                    swal({
                    text: 'Berhasil',
                    icon: 'success'
                    });
                    </script>");

            redirect(base_url() . 'profile/histories');
        } else {
            $data['title'] = 'Cara Retur - ' . $this->Settings_model->general()["app_name"];
            $data['css'] = 'profile';
            $data['retur'] = $this->db->get_where('retur_penjualan',['id_invoice'=>$id])->row();
            
            $this->load->view('templates/header', $data);
            $this->load->view('templates/navbar');
            $this->load->view('profile/cara_retur', $data);
            $this->load->view('templates/footerv2');
        }
    }

    public function retur($id){
        if ($_POST) {
            $insert = $_POST;
            $insert['id_invoice'] = $id;
            
            $config['upload_path']          = './uploads/';
            $config['allowed_types']        = '*';
     
            $this->load->library('upload', $config);
     
            if ( ! $this->upload->do_upload('file')){
                $error = array('error' => $this->upload->display_errors());
            }else{
                $imageDetailArray = array('upload_data' => $this->upload->data());
                $insert['file'] = $imageDetailArray['upload_data']['file_name'];
            }

            $this->db->insert('retur_penjualan',$insert);

            $this->session->set_flashdata('success', "<script>
                    swal({
                    text: 'Berhasil Membuat Retur',
                    icon: 'success'
                    });
                    </script>");

            redirect(base_url() . 'profile/histories');
        } else {
            $data['ord'] = $this->User_model->getOrderByInvoice($id);
            if(!$data['ord']){
                redirect(base_url() . 'profile/transaction');
            }
            $data['title'] = 'Retur - ' . $this->Settings_model->general()["app_name"];
            $data['css'] = 'profile';
            $data['product_order'] = $this->User_model->getProductByInvoice($id);

            $this->load->view('templates/header', $data);
            $this->load->view('templates/navbar');
            $this->load->view('profile/retur_order', $data);
            $this->load->view('templates/footerv2');
        }
    }

    public function finish_transaction(){
        $invoice = $_GET['invoice'];
        $resi = $_GET['resi'];
        $this->db->set('status', 4);
        $this->db->where('invoice_code', $invoice);
        $this->db->where('resi', $resi);
        $this->db->update('invoice');
        $this->session->set_flashdata('success', "<script>
            swal({
            text: 'Selamat, transaksi telah selesai',
            icon: 'success'
            });
        </script>");
        redirect(base_url() . 'profile/histories');
    }

    public function histories(){
        $data['title'] = 'Riwayat Transaksi - ' . $this->Settings_model->general()["app_name"];
        $data['css'] = 'profile';
        $data['finish'] = $this->User_model->getFinishOrder();
        $this->load->view('templates/header', $data);
        $this->load->view('templates/navbar');
        $this->load->view('profile/histories', $data);
        $this->load->view('templates/footerv2');
    }

    public function edit_profile(){
        $this->form_validation->set_rules('name', 'Nama', 'required', ['required' => 'Nama wajib diisi'
	    ]);
	    if($this->form_validation->run() == false){
            $data['title'] = 'Edit Profil - ' . $this->Settings_model->general()["app_name"];
            $data['css'] = 'profile';
            $data['user'] = $this->User_model->getProfile();
            $this->load->view('templates/header', $data);
            $this->load->view('templates/navbar');
            $this->load->view('profile/edit_profile', $data);
            $this->load->view('templates/footerv2');
        }else{
            if($_FILES['newphoto']['name'] != ""){
                $data = array();
                $upload = $this->User_model->uploadPhoto();

                if($upload['result'] == 'success'){
                    $file = $upload['file']['file_name'];
                    $this->User_model->updateProfile($file);
                    $this->session->set_flashdata('success', "<script>
                        swal({
                        text: 'Profil berhasil diupdate',
                        icon: 'success'
                        });
                        </script>");
                        redirect(base_url() . 'profile/edit-profile');
                }else{
                    $this->session->set_flashdata('failed', "<div class='alert alert-danger' role='alert'>
                    Gagal update profil, pastikan foto profil baru berukuran maksimal 2mb dan berformat png, jpg, jpeg. Silakan ulangi lagi.
                    </div>");
                    redirect(base_url() . 'profile/edit-profile');
                }
            }else{
                $file = '';
                $this->User_model->updateProfile($file);
                $this->session->set_flashdata('success', "<script>
                    swal({
                    text: 'Profil berhasil diupdate',
                    icon: 'success'
                    });
                    </script>");
                    redirect(base_url() . 'profile/edit-profile');
            }
        }
    }

    public function change_password(){
        $this->form_validation->set_rules('oldpassword', 'Password Lama', 'required', ['required' => 'Password lama wajib diisi'
	    ]);
        $this->form_validation->set_rules('newpassword', 'Password Baru', 'required', ['required' => 'Password baru wajib diisi'
	    ]);
	    if($this->form_validation->run() == false){
            $data['title'] = 'Ganti Kata Sandi - ' . $this->Settings_model->general()["app_name"];
            $data['css'] = 'profile';
            $this->load->view('templates/header', $data);
            $this->load->view('templates/navbar');
            $this->load->view('profile/change_password', $data);
            $this->load->view('templates/footerv2');
        }else{
            $user = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();
            if(password_verify($this->input->post('oldpassword'), $user['password'])){
                if($this->input->post('newpassword') ==  $this->input->post('confirmpassword')){
                    $pass = password_hash($this->input->post('newpassword'), PASSWORD_DEFAULT);
                    $this->db->set('password', $pass);
                    $this->db->where('id', $this->session->userdata('id'));
                    $this->db->update('user');
                    $this->session->set_flashdata('failed', "<script>
                        swal({
                        text: 'Password berhasil diubah',
                        icon: 'success'
                        });
                        </script>");
                    redirect(base_url() . 'profile/change-password');
                }else{
                    $this->session->set_flashdata('failed', "<script>
                        swal({
                        text: 'Konfirmasi password tidak sama. Silakan coba lagi',
                        icon: 'error'
                        });
                        </script>");
                    redirect(base_url() . 'profile/change-password');
                }
            }else{
                $this->session->set_flashdata('failed', "<script>
                    swal({
                    text: 'Password lama salah. Silakan coba lagi',
                    icon: 'error'
                    });
                    </script>");
                redirect(base_url() . 'profile/change-password');
            }
        }
    }

}