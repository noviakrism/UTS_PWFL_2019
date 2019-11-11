<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class M_mahasiswa extends CI_Model {
    public function tampil(){
        $query = $this->db->get('tampilkan_data');
        return $query->result_array();
    }
 
    public function tampilubah($id){
        $this->db->where('id', $id);
        $query = $this->db->get('mahasiswa');
        return $query->result_array();
    }

    public function tambah_data(){
        $data = array(
            'id' => $this->input->post('id'),
            'nim' => $this->input->post('nim'),
            'nama_mahasiswa' => $this->input->post('nama_mahasiswa'),
            'jenis_kelamin' => $this->input->post('jenis_kelamin'),
            'alamat' => $this->input->post('alamat'),
            'nomor_hp' => $this->input->post('nomor_hp')
        );
        return $this->db->insert('mahasiswa',$data);
    }

    public function edit_data(){
        $data = array(
            'id' => $this->input->post('id'),
            'nim' => $this->input->post('nim'),
            'nama_mahasiswa' => $this->input->post('nama_mahasiswa'),
            'jenis_kelamin' => $this->input->post('jenis_kelamin'),
            'alamat' => $this->input->post('alamat'),
            'nomor_hp' => $this->input->post('nomor_hp')
        );
        $id = $this->input->post('id');
        $this->db->where('id', $id);
        return $this->db->update('mahasiswa',$data);
    }

    public function hapus($id){
        return $this->db->delete('mahasiswa',array('id' =>$id));
    }
}