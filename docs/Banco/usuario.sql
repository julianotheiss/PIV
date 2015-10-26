create table usuario
(
    codigo int not null auto_increment,
    nome varchar(255),
    email varchar(255),
    telefone varchar(255),
    descricao text,
    dataCadastro datetime,
    primary key (codigo)
);
