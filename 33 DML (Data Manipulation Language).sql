--DDL  CRIACAO DA TABELA PARA MANIPULAR:
CREATE TABLE FUNCIONARIOS
(
  ID int identity(1,1), --INICIA A NUMERAÇÃO A PARTIR DO 1 E VAI INCREMENTANDO DE 1 EM 1
  NOME VARCHAR(50) NOT NULL,
  SALARIO DECIMAL(10,2),
  SETOR VARCHAR(30)
  )

--DML SELECT
--EXEMPLO SELECT: assim consulta todo o bd então a consulta não fica otimizada
SELECT * FROM   funcionarios

--EXEMPLO SELECT: quando selecionamos os campos especificos conseguimos otimizar, performance melhor
	SELECT nome,setor 
	FROM   funcionarios 

--EXEMPLO SELECT:
	SELECT nome,setor as depto
	FROM   funcionarios 

--DML INSERT
	INSERT INTO funcionarios VALUES  ('Joao',1000,''), ('Jose',2000,''),('Alexandre',3000,'') 

--OU
	INSERT INTO funcionarios (nome,salario) VALUES ('Pedro',1000)

--DML UPDATE
	UPDATE funcionarios SET    salario = '1500' 
	WHERE  id = '1'

--OU Aumento de 50% sobre Salário atual.
	UPDATE funcionarios SET    salario = salario*1.5 
	WHERE  id = '1' 

	SELECT * FROM   funcionarios

--exemplo update com mais de um campo
	UPDATE funcionarios SET    salario = salario*1.5,setor='TI'
	WHERE  id <> '1' 

--DML DELETE
	DELETE funcionarios 
	where id='1'



