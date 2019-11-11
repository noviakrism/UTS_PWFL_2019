<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class M_mahasiswa extends CI_Model {
    public function tampil(){
        $query = $this->db->get('tampil_data');
        return $query->result_array();
    }
 
    public function tampilubah($nim){
        $this->db->where('nim', $nim);
        $query = $this->db->get('mahasiswa');
        return $query->result_array();
    }

    public function tambah_data(){
        $data = array(
            'nim' => $this->input->post('nim'),
            'nama_mahasiswa' => $this->input->post('nama_mahasiswa'),
            'jk' => $this->input->post('jk'),
            'alamat' => $this->input->post('alamat'),
            'no_hp' => $this->input->post('no_hp')
        );
        return $this->db->insert('mahasiswa',$data);
    }

    public function edit_data(){
        $data = array(
            'nim' => $this->input->post('nim'),
            'nama_mahasiswa' => $this->input->post('nama_mahasiswa'),
            'jk' => $this->input->post('jk'),
            'alamat' => $this->input->post('alamat'),
            'no_hp' => $this->input->post('no_hp')
        );
        $nim = $this->input->post('nim');
        $this->db->where('nim', $nim);
        return $this->db->update('mahasiswa',$data);
    }

    public function hapus($nim){
        return $this->db->delete('mahasiswa',array('nim' =>$nim));
    }
}