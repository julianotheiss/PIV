<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	public function index()
	{
        // $dadosTopico['topico'] = $this->db->query('select * From topico order by horaCriacao desc limit 3');
        $dadosTopico['topico'] = $this->db->query('select * From topico order by horaCriacao desc');

		$this->load->view('html_header');
        $this->load->view('header');
        $this->load->view('menu_horizontal');
        $this->load->view('menu_lateral');
        //$this->load->view('inicio');
        $this->load->view('teste',$dadosTopico);
        $this->load->view('footer');
        $this->load->view('html_footer');
	}

    public function adicionar(){
            //$data['usuario'] = $this->input->post('usuario');
            //$data['senha'] = $this->input->post('senha');

            //$this->db->insert('usuarios',$data);

            //redirect(base_url()."administracao/usuarios");

        $this->load->view('html_header');
        $this->load->view('header');
        $this->load->view('menu_horizontal');
        $this->load->view('menu_lateral');
        $this->load->view('inicio');
        $this->load->view('footer');
        $this->load->view('html_footer');
    }

}
