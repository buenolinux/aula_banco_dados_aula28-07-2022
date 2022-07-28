CREATE DATABASE exemplojoin;
USE exemplojoin;
CREATE TABLE tab_funcionarios(
	nome VARCHAR(50) NOT NULL,
	codigo INT NOT NULL
);
CREATE TABLE tab_profissoes(
	nome VARCHAR(50) NOT NULL,
	codigo INT NOT NULL
);

INSERT INTO tab_funcionarios(nome, codigo)
VALUES
('João',1),('Maria',2),('Kátia',3),('Sérgio',4);

INSERT INTO tab_profissoes(nome, codigo)
VALUES
('Programador',1),('Designer',2),('Analista',3),('DBA',5);

SELECT * FROM tab_funcionarios; 
SELECT * FROM tab_profissoes;
-- INNER JOIN
/*
Retorna dados apenas quando as duas tabelas tem 
chaves correspondentes na cláusula ON do JOIN

*/
