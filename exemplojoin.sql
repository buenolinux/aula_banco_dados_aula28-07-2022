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


/*
**********************************************
*/

/*
Criando VIEWS 
A view pode ser definida como uma tabela virtual composta por linhas e colunas de dados vindos
de tabelas reclaiconadas em uma query (um agrupamento de select 's por exemplo ). As linhas e colunas da view
são geradas dinâmicamente no momento em que é feita uma referência a ela.
As views ficam armazenadas em:

Seu banco de dados 
Exibições
*/

USE escola;
/*
Criando uma view para mostrar o id, nome, email e fone dos alunos

*/
 /* é uma boa prática usar vw para VIEWS*/
 /*quando tem acento devemos usar aspas ou colchetes*/
CREATE VIEW vwAlunos
AS
SELECT id_aluno AS 'Código', 
	   nome AS Nome,
	   email AS [E-mail],
	   fone AS Celular
FROM tab_alunos;

/*
Executando a  VIEW
*/

SELECT * FROM vwAlunos;
/*
Os campos devem ser referenciados pelo rótulo que foi usado no momento da criação da VIEW
*/
SELECT Nome, Celular FROM vwAlunos;

/*
	Removendo uma view
*/

DROP VIEW vwAlunos;

/*
Alterar a VIEW
*/

ALTER VIEW vwAlunos
AS 
SELECT id_aluno AS 'Código', 
	   nome AS Nome,
	   email AS [E-mail],
	   fone AS Celular
FROM tab_alunos 
WHERE email LIKE '%@gmail.com';

/*
Criar uma view para mostrar o nome da turma, 
do aluno, número da sala e nome do professor
o nome da view será vwTurmas
*/
