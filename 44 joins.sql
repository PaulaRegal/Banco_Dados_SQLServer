/* join é usada para combinar as linhas de duas ou mais tabelas baseado no relacionamento entre elas.
*/
use curso
--drop table alunos

--CRIACAO DE TABELA ALUNOS
CREATE TABLE alunos
(id_aluno int identity(1,1),
 nome varchar(20) not null
 )
 --drop table disciplina
CREATE TABLE disciplina
(
 id_disciplina int identity(1,1),
 nome_disc varchar(20)
 )
 --drop table matricula
 CREATE TABLE matricula
 (id_aluno int,
  id_disciplina int,
  periodo varchar(10)
  )

  --ALTERANDO TABELA CAMPO ID_ALUNO PARA NAO PERMITIR NOT NULL
  ALTER TABLE MATRICULA ALTER COLUMN id_aluno INT NOT NULL
  --ALTERANDO TABELA 
  ALTER TABLE MATRICULA ALTER COLUMN id_disciplina INT NOT NULL

  --CRIANDO CHAVE PRIMARIA COMPOSTA
  ALTER TABLE MATRICULA ADD CONSTRAINT PK_1 PRIMARY KEY (id_aluno,id_disciplina)
 --ADICIONANDO CHAVE PRIMARIA TABELA DISCIPLINA
  ALTER TABLE DISCIPLINA ADD CONSTRAINT PK2 PRIMARY KEY (id_disciplina)
  --ADICIONANDO CHAVE PRIMARIA TABELA ALUNOS
  ALTER TABLE ALUNOS ADD CONSTRAINT PK1 PRIMARY KEY (ID_ALUNO)
  
  --ADICIONANDO CHAVE ESTRANGEIRA NA TABELA MATRICULA CAMPO ID_ALUNO
  ALTER TABLE MATRICULA 
  ADD CONSTRAINT FK_MAT1 FOREIGN KEY  (ID_ALUNO) REFERENCES ALUNOS(ID_ALUNO)

  --ADICIONANDO CHAVE ESTRANGEIRA NA TABELA MATRICULA CAMPO ID_ALUNO
  ALTER TABLE MATRICULA 
  ADD CONSTRAINT FK_MAT2 FOREIGN KEY  (id_disciplina) REFERENCES DISCIPLINA(id_disciplina)


  

  
  --INSERINDO REGISTRO ALUNOS
  INSERT INTO alunos VALUES ('Joao'),('Maria'),('Pedro'),('Tiago'),('Henrique')

  SELECT * FROM alunos

  --INSERINDO REGISTRO DISCIPLINAS
  INSERT INTO disciplina VALUES 
  ('Fisica'),('Quimica'),('Matematica'),('Banco de Dados'),('Programacao')

  SELECT * FROM disciplina

  --INSERINDO MATRICULAS DE ALUNOS
INSERT INTO matricula VALUES ('1','1','Noturno')
INSERT INTO matricula VALUES ('1','2','Vespertino')
INSERT INTO matricula VALUES ('1','3','Matutino')

  -- insert para aluno 2 nas disciplinas 3 e 4, periodo noturno
  INSERT INTO matricula VALUES ('2','3','Noturno')
  INSERT INTO matricula VALUES ('2','4','Noturno')

  -- insert para aluno 3 nas disciplinas 1, 3 e 4, periodo noturno
  INSERT INTO matricula VALUES ('3','1','Noturno')
  INSERT INTO matricula VALUES ('3','3','Noturno')
  INSERT INTO matricula VALUES ('3','4','Noturno')

  -- insert para aluno 5 nas disciplinas 1, 2 e 4, nos periodos abaixo
  INSERT INTO matricula VALUES ('5','1','Matutino')
  INSERT INTO matricula VALUES ('5','2','Vespertino')
  INSERT INTO matricula VALUES ('5','4','Noturno')

  SELECT * FROM matricula

  --ALUNO CODIGO 4 NAO TEM MATRICULA
  --DISCIPLINA 5 NAO TEM ALUNOS

  --INNER JOIN: registros que tem valores correspondentes em ambas tabelas, intersecção

  SELECT a.nome,c.nome_disc,b.periodo
  FROM alunos a
  INNER JOIN matricula b 
  ON a.id_aluno=b.id_aluno
  INNER JOIN disciplina c
  ON b.id_disciplina=c.id_disciplina

  --LEFT JOIN: retorna todos os registros da tabela à esquerda e os registros correspondentes da tabela da direita

  SELECT a.nome,c.nome_disc,b.periodo
  FROM alunos a
  LEFT JOIN matricula b 
  on a.id_aluno=b.id_aluno
  left join disciplina c
  on b.id_disciplina=c.id_disciplina
  

 --RIGHT JOIN: retorna todos os registros da tabela da direita e os registros correspondentes da tabela da esquerda
  select a.nome,c.nome_disc,b.periodo
  from alunos a
  right join matricula b 
  on a.id_aluno=b.id_aluno
  right join disciplina c
  on b.id_disciplina=c.id_disciplina

  --FULL JOIN: retorna todos os registros quando houver uma correspondencia na tabela à esquerda ou à direita, consome muito recurso do bd
  SELECT a.nome,c.nome_disc,b.periodo
  FROM alunos a
  FULL JOIN matricula b 
  ON a.id_aluno=b.id_aluno
  FULL JOIN disciplina c
  ON b.id_disciplina=c.id_disciplina

--INNER JOIN

SELECT orders.orderid, 
       customers.CompanyName 
FROM   orders 
       INNER JOIN customers 
       ON orders.customerid = customers.customerid; 

--INNER JOIN
SELECT orders.orderid, 
       customers.CompanyName, 
       shippers.CompanyName 
FROM   orders 
         INNER JOIN customers 
                 ON orders.customerid = customers.customerid 
        INNER JOIN shippers 
                ON orders.shipvia = shippers.shipperid; 


--LEFT JOIN
SELECT customers.CompanyName, 
       orders.orderid 
FROM   customers 
       LEFT JOIN orders 
              ON customers.customerid = orders.customerid 
ORDER  BY customers.CompanyName; 

--Rigth Join
SELECT orders.orderid, 
       employees.lastname, 
       employees.firstname 
FROM   orders 
       RIGHT JOIN employees 
               ON orders.employeeid = employees.employeeid 
ORDER  BY orders.orderid; 

--FULL JOIN
SELECT customers.CompanyName, 
       orders.orderid 
FROM   customers 
       FULL OUTER JOIN orders 
                    ON customers.customerid = orders.customerid 
ORDER  BY customers.CompanyName; 

