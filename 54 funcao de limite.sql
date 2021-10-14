--TOP
--recuperando 3 registros da tabela
use NORTHWND
SELECT TOP 3 * FROM customers

--selecionando os campos especificos que quero visualizar da tabela:
SELECT TOP 10 a.CustomerID,a.CompanyName 
FROM customers a
 
--10 clientes com maior volume de pedido(compras)
use NORTHWND
SELECT TOP 10
       RANK() OVER(ORDER BY SUM(c.Quantity*c.UnitPrice) desc)posicao,
	   a.CompanyName,
	   sum(c.Quantity*c.UnitPrice) Tot_compras
FROM Customers a
  INNER JOIN Orders b
  ON a.CustomerID=b.CustomerID
  INNER JOIN [Order Details] c
  ON b.OrderID=c.OrderID
  GROUP BY a.CompanyName

  --order by 3 desc

--recuperando 10 cidades mais populosas Brasil
USE curso
SELECT TOP 10 * FROM cidades
ORDER BY populacao desc

use curso
select top 10 *,rank() over(order by populacao desc) as posicao 
from cidades
order by populacao desc

