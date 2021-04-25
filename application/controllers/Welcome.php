<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$data['penandatanganan'] = $this->db->get("penandatanganan")->result();
		$data['jenisperjalanan'] = $this->db->get("jenis_perjalanan")->result();
		$data['tingkatan'] = $this->db->get("tingkatan")->result();	
		$data['pegawai'] = $this->db->get("pegawai")->result();	
		$data['a'] = $this->db->get_where("tingkatan",array("ket"=>"kdh_wkdh"))->row();	
		$data['b'] = $this->db->get_where("tingkatan",array("ket"=>"pejabat_daerah"))->row();	
		$data['c'] = $this->db->get_where("tingkatan",array("ket"=>"eselon2"))->row();	
		$data['d'] = $this->db->get_where("tingkatan",array("ket"=>"eselon3"))->row();	
		$data['e'] = $this->db->get_where("tingkatan",array("ket"=>"eselon4"))->row();	
		$data['f'] = $this->db->get_where("tingkatan",array("ket"=>"noneselon"))->row();	
		$data['g'] = $this->db->get_where("tingkatan",array("ket"=>"nonpns"))->row();	
		$this->load->view('welcome_message',$data);
	}

	function pelaksana_spt($jumlah)
	{

		if( $jumlah <= 0  ){
			$jumlah = 1;
		}
		$pegawai = $this->db->get("pegawai")->result();	
		for( $i = 0 ; $i < $jumlah ; $i++ ){
			echo "<div class='row'><div class='col-md-6'><div class='form-group'><label class='label label-control'><b>Pegawai</b></label><select class='form-control' name='pegawai'>";
			foreach( $pegawai as $k =>  $v ){
				echo "<option value='".$v->idpegawai."'>".$v->nama."</option>";
			}
            echo "</select></div></div><div class='col-md-6'><div class='form-group'><br><br><div class='checkbox'><input id='checkbox' type='checkbox'><label for='checkbox'>Supir (Melayani)</label></div></div></div></div>";
		}

	}

	function hitung_spt($jumlah)
	{
		if( $jumlah <= 0  ){
			$jumlah = 1;
		}
		$tingkatan = $this->db->get("tingkatan")->result();	
		for( $i = 0 ; $i < $jumlah ; $i++ ){
			// echo "<select class='form-control' id='jenis_perjalanan'>"; foreach( $tingkatan as $k => $v ){ echo "<option value='".$v->idtingkatan."'>". $v->uraian."</option></select>"; }
			echo "<div class='row'>
			<div class='col-lg-6 col-md-6'>
				<div class='form-group'>
					<label>Tingkatan</label>
					<select class='form-control' id='jenis_perjalanan'>
					";
					foreach( $tingkatan as $k => $v ){
						echo "<option value='".$v->idtingkatan."'>". $v->uraian."</option>";
					}
				echo "
					</select>
				</div>
			</div>
			<div class='col-lg-6 col-md-6'>
				<div class='form-group'>
				<label>Jumlah Orang</label>
				<input type='number' class='form-control' name='jumlah_spt_rinc' id='jumlah_spt_rinc' />
				</div>
			</div>
			</div>";
		}

	}

}
