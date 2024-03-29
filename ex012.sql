CREATE DATABASE CURSORES;

USE CURSORES;

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	JAN INT, 
	FEV INT, 
	MAR INT
);

CREATE TABLE VEND_TOTAL(
	NOME VARCHAR(30),
	JAN INT,
	FEV INT,
	MAR INT,
	TOTAL INT, 
	MEDIA INT
);

DELIMITER $

CREATE PROCEDURE INSEREDADOS()
BEGIN
		DECLARE FIM INT DEFAULT 0;
		DECLARE VAR1, VAR2, VAR3, VTOTAL, VMEDIA INT;
		DECLARE NOME VARCHAR(30);
		
		DECLARE REG CURSOR FOR(
		SELECT NOME, JAN, FEV, MAR FROM VENDEDORES);
		
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;
		
		OPEN REG;
		
		REPEAT 
		
			FETCH REG INTO VNOME, VAR1, VAR2, VAR3;
			IF NOT FIM THEN 
				VTOTAL = VAR1 + VAR2 + VAR3;
				VMEDIA = VTOTAL / 3;
				
				INSERT INTO VEND_TOTAL VALUES(VNOME, VAR1, VAR2, VAR3, VTOTAL, VMEDIA);
			END IF
			
		UNTIL FIM END REPEAT;
		
		CLOSE REG;
		
END
$

SELECT * FROM VEND_TOTAL;
CALL INSEREDADOS();

