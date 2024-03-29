/*EXERCICIO DML*/

INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',21);

INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',20);

/*RELATORIO GERAL DE TODOS OS CLIENTE*/

SELECT C.IDCLIENTE, C.SEXO, C.NOME, C.EMAIL, C.CPF, E.RUA, E.BAIRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C 
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE;
	
/*UPDATE*/

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 17;
	
/* RELATORIO DE HOMENS*/

SELECT C.IDCLIENTE, C.SEXO, C.NOME, C.EMAIL, C.CPF,
 E.RUA, E.BAIRO, E.CIDADE, E.ESTADO,
 T.TIPO, T.NUMERO
FROM CLIENTE C 
	INNER JOIN ENDERECO E 
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T 
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';
	
/*RELATORIO DE MULHERES */

SELECT C.IDCLIENTE, C.SEXO, C.NOME, C.EMAIL, C.CPF,
 E.RUA, E.BAIRO, E.CIDADE, E.ESTADO,
 T.TIPO, T.NUMERO
FROM CLIENTE C
	INNER JOIN ENDERECO E 
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T 
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F';

/*QUANTIDADE DE HOMENS E MULHERES*/

SELECT COUNT(*) AS QUANTIDADE, SEXO
FROM CLIENTE
GROUP BY SEXO;

/*PROJETAR MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E NAO TENHAM CELULAR*/

SELECT C.IDCLIENTE,C.NOME, C.SEXO, C.EMAIL, T.TIPO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND E.BAIRO = 'CENTRO' AND E.CIDADE = 'RIO DE JANEIRO'
AND (T.TIPO = 'COMER' OR T.TIPO = 'RES');

SELECT C.IDCLIENTE,C.NOME, C.SEXO, C.EMAIL, T.TIPO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND E.BAIRO = 'CENTRO' AND E.CIDADE = 'RIO DE JANEIRO'
AND T.TIPO != 'CEL';

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR, T.TIPO, E.ESTADO
FROM CLIENTE C
	INNER JOIN TELEFONE T 
	ON C.IDCLIENTE = T.ID_CLIENTE 
	INNER JOIN ENDERECO E 
	ON C.IDCLIENTE = E.ID_CLIENTE
WHERE T.TIPO = 'CEL'
AND E.ESTADO = 'RJ';

SELECT NOME,
		IFNULL(EMAIL, 'EMAIL NÃO CADASTRADO') AS EMAIL
		FROM CLIENTE;

ALTER TABLE ENDERECO 
CHANGE BAIRO BAIRRO VARCHAR(30) NOT NULL;

CREATE VIEW V_RELATORIO AS 
SELECT C.NOME,
	   C.SEXO,
	   C.EMAIL,
	   E.CIDADE,
	   E.BAIRRO,
	   E.ESTADO,
	   T.NUMERO,
	   T.TIPO
FROM CLIENTE C
	INNER JOIN ENDERECO E 
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T 
	ON C.IDCLIENTE = T.ID_CLIENTE;
	

/*ORDENANDO DADOS*/

CREATE TABLE ALUNOS(
	NUMERO INT,
	NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1, 'JOAO');
INSERT INTO ALUNOS VALUES(1, 'MARIA');
INSERT INTO ALUNOS VALUES(2, 'ZOE');
INSERT INTO ALUNOS VALUES(2, 'ANDRE');
INSERT INTO ALUNOS VALUES(3, 'CLARA');
INSERT INTO ALUNOS VALUES(1, 'CLARA');
INSERT INTO ALUNOS VALUES(4, 'MAFRA');
INSERT INTO ALUNOS VALUES(5, 'JANAINA');
INSERT INTO ALUNOS VALUES(1, 'JANAINA');
INSERT INTO ALUNOS VALUES(3, 'MARCELO');
INSERT INTO ALUNOS VALUES(4, 'GIVANI');
INSERT INTO ALUNOS VALUES(5, 'ANTONIO');
INSERT INTO ALUNOS VALUES(6, 'ANNA');
INSERT INTO ALUNOS VALUES(6, 'VIVIANE');

/*ORDER BY - NOME DA COLUNA*/
SELECT * FROM ALUNOS
ORDER BY NUMERO;
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | JOAO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | MAFRA   |
|      4 | GIVANI  |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANNA    |
|      6 | VIVIANE |
+--------+---------+

/*ORDER BY - INDICE DA COLUNA*/
SELECT * FROM ALUNOS
ORDER BY 2;
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      2 | ANDRE   |
|      6 | ANNA    |
|      5 | ANTONIO |
|      3 | CLARA   |
|      1 | CLARA   |
|      4 | GIVANI  |
|      5 | JANAINA |
|      1 | JANAINA |
|      1 | JOAO    |
|      4 | MAFRA   |
|      3 | MARCELO |
|      1 | MARIA   |
|      6 | VIVIANE |
|      2 | ZOE     |
+--------+---------+

/*ORDER BY - ORDENANDO POR MAIS DE UMA COLUNA*/
SELECT * FROM ALUNOS
ORDER BY 1,2;
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | CLARA   |
|      1 | JANAINA |
|      1 | JOAO    |
|      1 | MARIA   |
|      2 | ANDRE   |
|      2 | ZOE     |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | GIVANI  |
|      4 | MAFRA   |
|      5 | ANTONIO |
|      5 | JANAINA |
|      6 | ANNA    |
|      6 | VIVIANE |
+--------+---------+

/* ORDER BY - MESCLANDO PROJEÇÃO COM ORDER BY*/
SELECT NOME FROM ALUNOS
ORDER BY NUMERO, NOME;
+---------+
| NOME    |
+---------+
| CLARA   |
| JANAINA |
| JOAO    |
| MARIA   |
| ANDRE   |
| ZOE     |
| CLARA   |
| MARCELO |
| GIVANI  |
| MAFRA   |
| ANTONIO |
| JANAINA |
| ANNA    |
| VIVIANE |
+---------+

/*ORDER BY DESC E ASC*/
SELECT * FROM ALUNOS
ORDER BY NUMERO DESC, NOME ASC; 
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      6 | ANNA    |
|      6 | VIVIANE |
|      5 | ANTONIO |
|      5 | JANAINA |
|      4 | GIVANI  |
|      4 | MAFRA   |
|      3 | CLARA   |
|      3 | MARCELO |
|      2 | ANDRE   |
|      2 | ZOE     |
|      1 | CLARA   |
|      1 | JANAINA |
|      1 | JOAO    |
|      1 | MARIA   |
+--------+---------+

SELECT * FROM ALUNOS
ORDER BY NUMERO DESC, NOME DESC;
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      6 | VIVIANE |
|      6 | ANNA    |
|      5 | JANAINA |
|      5 | ANTONIO |
|      4 | MAFRA   |
|      4 | GIVANI  |
|      3 | MARCELO |
|      3 | CLARA   |
|      2 | ZOE     |
|      2 | ANDRE   |
|      1 | MARIA   |
|      1 | JOAO    |
|      1 | JANAINA |
|      1 | CLARA   |
+--------+---------+

/*ORDER BY COM JOIN*/
SELECT C.NOME,
	   C.SEXO,
	   C.EMAIL,
	   E.CIDADE,
	   E.BAIRRO,
	   E.ESTADO,
	   T.NUMERO,
	   T.TIPO
FROM CLIENTE C
	INNER JOIN ENDERECO E 
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T 
	ON C.IDCLIENTE = T.ID_CLIENTE
ORDER BY 1,7,8;




