create database TRAB2 

UTILIZACAO DO BANCO DE DADOS
USE TRAB2





--CRIACAO DA TABELA PACIENTES
CREATE TABLE PACIENTES (
CODIGO INT NOT NULL,
NOME VARCHAR(20),
ENDERECO VARCHAR(20),
CIDADE VARCHAR(20),
ESTADO CHAR(02),
CEP CHAR(09),
FONE CHAR(08),
CONSTRAINT PK_PACIENTES PRIMARY KEY(CODIGO)
)

--CRIACAO DA TABELA CONSULTAS
CREATE TABLE CONSULTAS (
IDCONSULTA INT NOT NULL,
CODIGOPACIENTE INT NOT NULL,
[DATA] DATE,
HORA TIME,
VALOR MONEY,
OBS VARCHAR(200),
CONSTRAINT PK_CONSULTAS PRIMARY KEY(IDCONSULTA),
CONSTRAINT FK_CONSULTAS_CODPACIENTE
FOREIGN KEY(CODIGOPACIENTE) REFERENCES PACIENTES(CODIGO)
)


--CRIACAO DA TABELA CONSULTAS
CREATE TABLE CONSULTA (
IDCONSULTA INT NOT NULL,
CODIGOPACIENTE INT NOT NULL,
[DATA] DATE,
HORA TIME,
VALOR MONEY,
OBS VARCHAR(200),
CONSTRAINT PK_CONSULTAS PRIMARY KEY(IDCONSULTA),
CONSTRAINT FK_CONSULTAS_CODPACIENTE
FOREIGN KEY(CODIGOPACIENTE) REFERENCES PACIENTES(CODIGO)
)





--INSERCAO DE DADOS NA TABELA PACIENTE


INSERT INTO PACIENTES (CODIGO, NOME, ENDERECO, CIDADE, ESTADO, CEP, FONE) VALUES
(1, 'Sharon Stone','Rua 10','Jales','SP', '15750-000', '36323535'),
(2,'Julia Roberts','Rua 22','Urania','SP', '15670-000', '36324678'),
(3,'Jose da Silva','Rua 29','Jales','SP', '15750-000', '36789000'),
(4,'Cleo Pires','Rua 15', 'Jales','SP', '15750-000', '36321213'),
(5,'Mel Lisboa','Rua 18','Fernandopolis','SP', '15670-000', '36321567'),
(6,'Vera Fischer', NULL,'Jundiai',NULL, NULL, NULL),
(7,'Rita Cadilac','Rua 20','Valinhos','SP', NULL, NULL),
(8,'Joana Prado','Rua 18','Louveira','Sp', NULL, NULL),
(9,'Daniela Motoserra','Rua 30','Jundiai','Sp', NULL, NULL),
(10,'Joao Luis','Rua 10', 'Pocos de Caldas','MG', NULL, NULL);
SELECT * FROM PACIENTES


--INSERCAO DE DADOS NA TABELA CONSULTA

INSERT INTO CONSULTA (IDCONSULTA, CODIGOPACIENTE, [DATA], HORA, VALOR) VALUES
(1,1,'01/01/2013','10:00', 100),
(2,2,'03/01/2013','11:00', 150),
(3,3,'10/04/2013','10:00', 100),
(4,4,'20/02/2013','08:00', 150),
(5,5,'12/02/2013','15:00', 200),
(6,6,'15/04/2013','16:00', 100),
(7,1,'01/10/2013','12:00', 140),
(8,1,'15/02/2013','13:00', 150)
SELECT * FROM CONSULTA



a) Adicionar o atributo email na tabela pacientes

ALTER TABLE PACIENTES ADD EMAIL VARCHAR(20)
SELECT *FROM PACIENTES
SELECT *FROM CONSULTA

b) Adicione um email qualquer para a Mel Lisboa

UPDATE PACIENTES  SET EMAIL = 'mel.lisboa@hotmail.com' WHERE CODIGO =5
c) Excluir a Coluna Fone da tabela pacientes

ALTER TABLE PACIENTES DROP COLUMN FONE
d) Alterar o Nome do Paciente com o código 3 para ‘Joaquim Jose’

SELECT CODIGO, NOME FROM PACIENTES
UPDATE PACIENTES SET NOME = 'Joaquim jose' WHERE CODIGO= 3

e) Alterar o estado para UF e o endereço para Rua 24 da Vera Fischer

SELECT * FROM PACIENTES WHERE NOME= 'Vera Fischer' 
UPDATE PACIENTES SET ESTADO= 'UF', E O ENDEREÇO= 'RUA 24' WHERE CODIGO= 6

f) Alterar o CEP para 15700000 de todas os pacientes que morem na cidade de Jales

UPDATE PACIENTES SET CIDADE ='15700000' WHERE CIDADE = 'Jales'

g) Remover o atributo OBS na tabela consultas.

SELECT *FROM CONSULTA
ALTER TABLE CONSULTA DROP COLUMN OBS

h) Aumente o valor das consultas em 10% das datas do mês de Abril de 2013
BEGIN TRAN

UPDATE CONSULTA SET VALOR=VALOR * 1.1 WHERE [DATA] BETWEEN '20130401' AND '20130430',
SELECT *FROM CONSULTA WHERE [DATA] BETWEEN '20130401' AND '20130430'; 
ROLLBACK
COMMIT


i) Alterar o valor das consultas para 200 cujo código do pacientes seja 1,3,6

SELECT * FROM CONSULTA WHERE CODIGOPACIENTE IN (1,3,6)
UPDATE CONSULTA SET VALOR=200 WHERE CODIGOPACIENTE IN (1,3,6)

j) Diminua o valor das consultas em 20% , mas somente as consultas que foram as 10:00 da manha

SELECT VALOR, VALOR *0.8 FROM CONSULTA WHERE HORA='10:00:00.00'
UPDATE CONSULTA SET VALOR = VALOR= VALOR *0.8 WHERE HORA='10:00:00.00'

k) Faça uma exclusão dos pacientes que moram na cidade de Valinhos.
l) Faça uma exclusão dos pacientes que moram na cidade de Louveira ou na Rua 30.
m) Faça uma exclusão de todas as consultas feitas entre o dia 10/01/2003 e 15/01/2003.
n) Deletar todos os pacientes do estado de MG
Codigo (PK)
Nome
Endereço
Cidade
Estado
CEP
Fone
IDConsulta (PK)
CodigoPaciente (FK)
Data
Hora
Valor
OBS
FAZ N1
