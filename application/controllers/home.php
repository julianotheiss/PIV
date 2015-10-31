<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	public function index()
	{
        $dadosTopico['topico'] = $this->db->query('select * From topico order by horaCriacao desc limit 3');

		$this->load->view('html_header');
        $this->load->view('header');
        $this->load->view('menu_horizontal');
        $this->load->view('menu_lateral');
        //$this->load->view('inicio');
        $this->load->view('teste',$dadosTopico);
        $this->load->view('footer');
        $this->load->view('html_footer');
	}
}
