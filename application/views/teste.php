<table>
            <tr>
                <td>Código</td>
                <td>Título</td>
                <td>Descrição</td>
                <td>Hora de Cadastro</td>
                <td>Popularidade</td>
                <td>Usuário</td>
            </tr>
<?php
foreach($topico->result() as $top){
    echo "<tr>
            <td>$top->codigo</td>
            <td>$top->titulo</td>
            <td>$top->descricao</td>
            <td>$top->horaCriacao</td>
            <td>$top->popularidade</td>
            <td>$top->codUsuario</td>
        </tr>";
}
?>
</table>

<a href="<?php echo base_url(); ?>adicionar">Teste</a>

<!--
$query = $this->db->query("select * From usuario");

echo "<table>
            <tr>
                <td>Código</td>
                <td>Título</td>
                <td>Descrição</td>
                <td>Hora de Cadastro</td>
                <td>Popularidade</td>
                <td>Usuário</td>
            </tr>";

foreach ($query->result() as $row)
{
   echo $row->codigo;
   echo $row->name;
   echo $row->body;
}
--> a
