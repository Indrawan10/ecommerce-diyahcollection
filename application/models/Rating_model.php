<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Rating_model extends CI_Model
{

    public function insertRating($data)
    {
        return $this->db->insert('rating', $data);
    }

    public function getReviewsByProductId($product_id)
    {
        $this->db->select('rating.*, user.name, user.photo_profile');
        $this->db->from('rating');
        $this->db->join('user', 'user.id = rating.user_id');
        $this->db->where('rating.product_id', $product_id);
        return $this->db->get()->result_array();
    }
}
