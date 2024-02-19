/* CRIANDO NOVO BANCO DE DADOS */ 

CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M', 'F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES', 'COMER', 'CEL') NOT NULL,
	NUMERO VARCHAR(30) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY (ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

INSERT INTO CLIENTE VALUES(NULL, 'ANNA', 'F', 'ANNA@GMAIL.COM', '19876544565');
INSERT INTO CLIENTE VALUES(NULL, 'JOAO', 'M', 'JOAO@GMAIL.COM', '19866567898');
INSERT INTO CLIENTE VALUES(NULL, 'JULIA', 'F', 'JULIA@GMAIL.COM', '23476544565');
INSERT INTO CLIENTE VALUES(NULL, 'CARLOS', 'M', 'CARLOS@GMAIL.COM', '19876776565');
INSERT INTO CLIENTE VALUES(NULL, 'ANDRE', 'M', 'ANDRE@GMAIL.COM', '19876549925');
INSERT INTO CLIENTE VALUES(NULL, 'LUAN', 'M', 'LUAN@GMAIL.COM', '08976544565');
INSERT INTO CLIENTE VALUES(NULL, 'LUIZA', 'F', 'LUIZA@GMAIL.COM', '06876564565');

INSERT INTO ENDERECO VALUES(NULL, 'ALFANDEGA','COPACABANA','RIO DE JANEIRO','RJ',7);
INSERT INTO ENDERECO VALUES(NULL, 'PROCOPIO FERREIRA','IPANEMA','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL, 'DINAMARCA','CENTRO','VITORIA','ES',6);
INSERT INTO ENDERECO VALUES(NULL, 'OLIVEIRA LIMA','CENTRO','SAO PAULO','SP',2);
INSERT INTO ENDERECO VALUES(NULL, 'TIRADENTES','DIAMONTINA','BELO HORIZONTE','MG',3);
INSERT INTO ENDERECO VALUES(NULL, 'BRIGADERIO','CAXIAS','RIO DE JANEIRO','RJ',4);
INSERT INTO ENDERECO VALUES(NULL, 'URUGUAIANA','CENTRO','SAO PAULO','SP',5);

INSERT INTO TELEFONE VALUES(NULL, 'COMER', '965184681', 3);
INSERT INTO TELEFONE VALUES(NULL, 'RES', '965186521', 2);
INSERT INTO TELEFONE VALUES(NULL, 'COMER', '991184681', 2);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '969914681', 1);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '965199521', 4);
INSERT INTO TELEFONE VALUES(NULL,'RES', '965017681', 5);
INSERT INTO TELEFONE VALUES(NULL, 'RES', '963186581', 6);
INSERT INTO TELEFONE VALUES(NULL, 'COMER', '965132761', 5);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '912187681', 3);

SELECT NOME, SEXO, TIPO, NUMERO
FROM CLIENTE
	INNER JOIN TELEFONE
	ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F';

SELECT NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO
FROM CLIENTE
	INNER JOIN ENDERECO
	ON IDCLIENTE = ID_CLIENTE
	INNER JOIN TELEFONE
	ON IDCLIENTE = ID_CLIENTE;
	
CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO FLOAT(10,2),
	FRETE FLOAT(10,2) NOT NULL
);

/*ALTERANDO NOME DA COLUNA*/
ALTER TABLE PRODUTO
CHANGE PRECO PRECO_UNITARIO FLOAT(10,2) NOT NULL;

/*ALTERANDO TIPO DA COLUNA*/
ALTER TABLE PRODUTO
CHANGE PRECO_UNITARIO PRECO_UNITARIO INT NOT NULL;

/*ALTERANDO TIPO DA COLUNA COM MODFY*/
ALTER TABLE PRODUTO
MODIFY PRECO_UNITARIO FLOAT(10,2) NOT NULL;

/*ADICIONANDO COLUNAS*/
ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

/*DELETANDO COLUNAS*/
ALTER TABLE PRODUTO
DROP COLUMN PESO;

/*ADICIONANDO COLUNAS EM ORDEM ESPECIFICA*/
ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

ALTER TABLE PRODUTO
ADD COLUMN DESCRICAO VARCHAR(100)
FIRST;
