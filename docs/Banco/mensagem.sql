create table mensagem
(
    codigo int not null auto_increment,
    mensagem text,
    dataEnvio datetime,
    codTopico int,
    primary key (codigo),
    foreign key (codigo) references topico(codigo)
);