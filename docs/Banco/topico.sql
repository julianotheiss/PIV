create table topico
(
    codigo int not null auto_increment,
    titulo varchar(255),
    descricao varchar(255),
    horaCriacao date,
    popularidade int,
    primary key (codigo)
);