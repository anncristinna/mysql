CREATE DATABASE filmes;

USE filmes;

CREATE TABLE ator(
    cod_numerico int primary key,
    nome_artistico varchar(30) not null,
    sexo char(1),
    data_nascimento date
);

CREATE TABLE filme(
    id_numerico int primary key,
    titulo varchar(50) not null,
    ano_lancamento int
);

CREATE TABLE atua(
    ator_codigo int,
    id_filme int,
    papel varchar(50),
    primary key(ator_codigo, id_filme, papel),
    constraint fk_ator_atua foreign key (ator_codigo) references ator(cod_numerico),
    constraint fk_filme_atua foreign key (id_filme) references filme(id_numerico)
);

CREATE TABLE genero(
    nome varchar(30) primary key
);

CREATE TABLE usuario(
    apelido varchar(30) primary key,
    email varchar(60) unique not null,
    senha varchar(30) not null
);

CREATE TABLE avalia(
    nota int not null CHECK(nota between 1 and 10),
    comentario text,
    data date not null,
    id_filme int,
    usuario_apelido varchar(30),
    primary key(id_filme, usuario_apelido),
    constraint unica_avaliacao UNIQUE(id_filme, usuario_apelido),
    constraint fk_filme_avalia foreign key (id_filme) references filme(id_numerico),
    constraint fk_usuario_avalia foreign key (usuario_apelido) references usuario(apelido)
);







