--criando ta tabelas cliente

USE curso
CREATE TABLE  clientes
(cod_cli nchar(5) primary key,
 cli_nome nvarchar(40) not null
 ) 

--inserindo dados da tabelas cliente apartir da tabela customers do db Northwnd
INSERT INTO clientes 
SELECT customerid,companyname FROM NORTHWND.dbo.Customers

--criando tabelas pedidos
DROP TABLE pedidos
--realizei drop porque já havia criado antes

CREATE TABLE pedidos
	(
	 num_ped int primary key,
	 cod_cliente nchar(5)not null,
     data datetime not null,
	 total decimal(10,2)
	 )

--inserindo dados na tabela pedido com dados da tabela orders do bd Northwnd
INSERT INTO pedidos (num_ped,cod_cliente,data)
SELECT OrderID,customerid,OrderDate FROM NORTHWND.dbo.Orders 


--atualizando campo total da tabela pedido com update em subselect
--coloquei apelido de b na table Order Details, além disso, usei o colchete para 
--entender que é uma tabela, pois a tabela foi criada com esse espaço entre os nomes:

SELECT * FROM pedidos

  UPDATE pedidos SET total=(SELECT SUM(b.unitprice*b.quantity) 
  FROM NORTHWND.dbo.[Order Details] b
  WHERE num_ped=b.orderid)
  
 
--Aqui somente apresentamos os clientes que fizeram compras antes da data atual (Getdate())
SELECT * FROM clientes

SELECT cod_cli , 
       cli_nome 
FROM   clientes 
WHERE  cod_cli IN (SELECT cod_cliente
              FROM   pedidos 
              WHERE  data < Getdate() )

--Aqui apresentamos todos os clientes  que cliente já fizeram algum pedido.
--trocando "in" por "Not in" apresenta os clientes que nao fizeram pedidos

SELECT cod_cli, 
       cli_nome 
FROM   clientes 
WHERE  cod_cli NOT IN(SELECT cod_cliente 
                  FROM   pedidos) 



/*
Nesta query estamos retornando o campo NOM_CLI da tabela CLIENTES.
Porém, não estamos filtrando a tabela PEDIDO de modo que se houver 
algum COD_CLI na tabela PEDIDOS que não se encontre na tabela CLIENTE o 
valor NULL será retornado para o campo
NOME_CLI calculado através da subquery

*/
  SELECT P.num_ped, 
       P.data, 
       P.cod_cliente, 
       (SELECT C.cli_nome 
        FROM   clientes C 
        WHERE  P.cod_cliente = C.cod_cli) AS NOME_CLI 
FROM   pedidos AS P 


--Nesta Query com Subquery vamos trazer  o total de cada cliente partindo da tabela pedidos 
--processo muito utilizado no mercado. Se uso SUM tenho que usar GROUP BY

SELECT P.cod_cliente, 
       (SELECT C.cli_nome 
        FROM   clientes C 
        WHERE  P.cod_cliente = C.cod_cli) AS NOME_CLI, 
       Sum(p.total) total 
FROM   pedidos AS P 
GROUP  BY P.cod_cliente 

/*
Nesta Query vamos trazer todos clientes e através de subconsulta o valor de suas compras.
Utilizando Sum coloco GROUP BY. isnull só para trazer 0 no lugar de NULL.
*/

SELECT c.cod_cli, 
      (SELECT isnull(Sum(p.total),0)
        FROM   pedidos p
        WHERE  c.cod_cli = p.cod_cliente) AS total 
FROM   clientes c 
GROUP  BY c.cod_cli 

--eliminando clientes da tabela cliente que nao fizeram pedidos
DELETE FROM clientes
WHERE cod_cli NOT IN (SELECT cod_cliente FROM pedidos)

/*antes de aplicar o delete é importante dar um select com where para garantir que selecionamos 
corretamente o que será deletado
*/
select * from clientes
where cod_cli not in (select cod_cliente from pedidos)