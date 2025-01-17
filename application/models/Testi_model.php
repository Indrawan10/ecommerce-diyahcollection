<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Testi_model extends CI_Model
{
    public function getTesti()
    {
        $this->db->order_by('id', 'desc');
        return $this->db->get('testimonial');
    }

    public function insertTesti()
    {
        $name = $this->input->post('name');
        $content = $this->input->post('content');
        $rating = $this->input->post('rating');
        $data = [
            'name' => $name,
            'content' => $content,
            'rating' => $rating
        ];
        $this->db->insert('testimonial', $data);
    }

    public function getTestiById($id)
    {
        return $this->db->get_where('testimonial', ['id' => $id])->row_array();
    }

    public function updateTesti($id)
    {
        $name = $this->input->post('name');
        $content = $this->input->post('content');
        $rating = $this->input->post('rating');
        $data = [
            'name' => $name,
            'content' => $content,
            'rating' => $rating
        ];
        $this->db->where('id', $id);
        $this->db->update('testimonial', $data);
    }
}
