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
SELECT * FROM tab_alunos;
SELECT * FROM tab_professores;
SELECT * FROM tab_salas;
SELECT * FROM tab_turmas;

CREATE VIEW vwTurmas
AS
SELECT tab_turmas.nome AS 'Nome da turma',
	   tab_alunos.nome AS 'Nome do aluno',
	   tab_salas.numero AS 'Número da sala',
	   tab_professores.nome AS 'Nome do professor'
	   FROM tab_alunos
	   
	   INNER JOIN tab_turmas
	   ON tab_turmas.id_aluno = tab_alunos.id_aluno

	   INNER JOIN tab_professores
	   ON tab_professores.id_professor = tab_turmas.id_professor

	   INNER JOIN tab_salas
	   ON tab_salas.id_sala = tab_turmas.id_sala

/*
Executando a VIEW
*/

SELECT * FROM vwTurmas

/*
Corrigindo os rotulos da VIEW
*/
ALTER VIEW vwTurmas
AS
SELECT tab_turmas.nome AS 'Turma',
	   tab_alunos.nome AS 'Aluno',
	   tab_salas.numero AS 'Sala',
	   tab_professores.nome AS 'Professor'
	   FROM tab_alunos
	   
	   INNER JOIN tab_turmas
	   ON tab_turmas.id_aluno = tab_alunos.id_aluno

	   INNER JOIN tab_professores
	   ON tab_professores.id_professor = tab_turmas.id_professor

	   INNER JOIN tab_salas
	   ON tab_salas.id_sala = tab_turmas.id_sala


SELECT * FROM vwTurmas WHERE Sala =2;
SELECT Turma, Professor FROM vwTurmas;

/*
Exercício 
Criar um view para mostrar o nome do professor e
dos alunos de cada turma
*/

CREATE VIEW vwProfessorAluno
AS
SELECT tab_professores.nome As Professor,
		tab_alunos.nome AS Aluno,
		tab_turmas.nome
	FROM tab_turmas
		INNER JOIN tab_professores
	ON tab_professores.id_professor = tab_turmas.id_professor

	INNER JOIN tab_alunos
	ON tab_turmas.id_aluno = tab_alunos.id_aluno;


CREATE VIEW vwProfessorAlunoSql
AS
SELECT tab_professores.nome As Professor,
		tab_alunos.nome AS Aluno,
		tab_turmas.nome AS Turma
	FROM tab_turmas
		INNER JOIN tab_professores
	ON tab_professores.id_professor = tab_turmas.id_professor

	INNER JOIN tab_alunos
	ON tab_turmas.id_aluno = tab_alunos.id_aluno
	WHERE tab_turmas.nome = 'SQL';

-- ***********************************

CREATE VIEW vwProfessorAlunoC
AS
SELECT tab_professores.nome As Professor,
		tab_alunos.nome AS Aluno,
		tab_turmas.nome AS Turma
	FROM tab_turmas
		INNER JOIN tab_professores
	ON tab_professores.id_professor = tab_turmas.id_professor

	INNER JOIN tab_alunos
	ON tab_turmas.id_aluno = tab_alunos.id_aluno
	WHERE tab_turmas.nome = 'C#';

-- *******************************

CREATE VIEW vwProfessorAlunoRedes
AS
SELECT tab_professores.nome As Professor,
		tab_alunos.nome AS Aluno,
		tab_turmas.nome AS Turma
	FROM tab_turmas
		INNER JOIN tab_professores
	ON tab_professores.id_professor = tab_turmas.id_professor

	INNER JOIN tab_alunos
	ON tab_turmas.id_aluno = tab_alunos.id_aluno
	WHERE tab_turmas.nome = 'Redes';


--****************************
CREATE VIEW vwProfessorAlunoExcel
AS
SELECT tab_professores.nome As Professor,
		tab_alunos.nome AS Aluno,
		tab_turmas.nome AS Turma
	FROM tab_turmas
		INNER JOIN tab_professores
	ON tab_professores.id_professor = tab_turmas.id_professor

	INNER JOIN tab_alunos
	ON tab_turmas.id_aluno = tab_alunos.id_aluno
	WHERE tab_turmas.nome = 'Excel';

SELECT * FROM vwProfessorAluno;
SELECT * FROM 	vwProfessorAlunoSql;
SELECT * FROM 	vwProfessorAlunoC;
SELECT * FROM 	vwProfessorAlunoRedes;
SELECT * FROM	vwProfessorAlunoExcel;

/*
Criar uma VIEW para mostrar o nome do professor Fábio e sua turma
*/

CREATE VIEW vwMostraTurmaFabio 
AS
SELECT tab_professores.nome AS Professor,
		tab_alunos.nome AS Alunos,
		tab_turmas.nome AS Turmas

		FROM tab_turmas
		INNER JOIN tab_professores
		ON tab_professores.id_professor = tab_turmas.id_professor

		INNER JOIN tab_alunos
		ON tab_alunos.id_aluno = tab_turmas.id_aluno
		WHERE tab_professores.nome = 'Fábio';

/*
	**************************************************
	Criando Stored Procedure, que traduzido significa Procedimento
	Armazenado, é um conjunto de comandos em SQL que podem 
	Ser executado de uma só vez, como em uma função.
	Ele armazena tarefas repetitivas e aceita parâmetros
	de entrada para que a tarefa seja efetuada de acordo com a
	necessidade individual
	As Stored Procedure ficam armazenadas em:
	Seu banco de dados
	programação
	Procedimentos armazenados

	Criando uma Stored Procedure para buscar um  email do aluno
*/


/*
Declarando a procedure
É uma boa prática crar as procedures iniciando com sp
*/

CREATE PROCEDURE spBuscaEmailAluno
/*
Declarando uma variável, as variáveis são criadas com @ antes do nome da variável
*/
@busca VARCHAR(50)
AS 
/*
Realiza a consul 
*/
SELECT * FROM tab_alunos
/*
Utilizando a variável como filtro da pesquisa
*/
WHERE email LIKE @busca;

/*
Executando a SP (stored procedure)
*/
EXECUTE spBuscaEmailAluno '%gmail%'; /* filtra os emails que tenha gmail*/
EXECUTE spBuscaEmailAluno 'fatima@gmail.com';
