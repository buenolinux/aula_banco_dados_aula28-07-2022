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

SELECT tab_funcionarios. * ,
		tab_profissoes.*
	FROM tab_funcionarios
	INNER JOIN tab_profissoes
	ON tab_funcionarios.codigo = tab_profissoes.codigo;
/*
LEFT JOIN
Retorna a tabela A inteira e apenas os registros que coincidirem com a igualdade do join na tabela B
ou nulos para os campos sem correspondência

*/

SELECT tab_funcionarios. * ,
		tab_profissoes.*
	FROM tab_funcionarios
	LEFT JOIN tab_profissoes
	ON tab_funcionarios.codigo = tab_profissoes.codigo;

/*
RIGHT JOIN
Retorna a tabela A inteira e apenas os registros que coincidirem com a igualdade do join na tabela B
ou nulos para os campos sem correspondência

*/

SELECT tab_funcionarios. * ,
		tab_profissoes.*
	FROM tab_funcionarios
	RIGHT JOIN tab_profissoes
	ON tab_funcionarios.codigo = tab_profissoes.codigo;

/*
	FULL OUTER JOIN (exclusivo do SQL Server)
	Retorna todos os registros de ambas as tabelas.
*/

SELECT tab_funcionarios. * ,
		tab_profissoes.*
	FROM tab_funcionarios
	FULL OUTER JOIN tab_profissoes
	ON tab_funcionarios.codigo = tab_profissoes.codigo;

/*
CROSS JOIN
Basicamente é o produto cartesiano entre as duas tabelas.
Para cada linha da tabela A, são retornadas todas as linhas da tabela B
*/

SELECT tab_funcionarios. * ,
		tab_profissoes.*
	FROM tab_funcionarios
	CROSS JOIN tab_profissoes;
