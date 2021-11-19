--DIFERENCA EM DIAS
SELECT Datediff (day, '2015-03-12', '2017-07-13') 

--DIFERENCA EM MESES
SELECT Datediff (month, '2015-03-12', '2017-07-13') 

--DIFERENCA EM ANOS
SELECT Datediff (year, '2015-03-12', '2017-07-13')
 
--Atraves deste comando podemos descobrir ha quantos dias/meses ou anos nascemos. 
--DIFERENCA EM DIA
SELECT Datediff (day, '1981-02-15', Getdate()) 

--DIFERENCA EM MESES
SELECT Datediff (month, '1981-02-15', Getdate()) 

--DIFERENCA EM ANOS
SELECT Datediff (year, '1981-02-15', Getdate())

--EXEMPLO
USE NORTHWND

	SELECT a.OrderID,
		   a.OrderDate,
		   a.RequiredDate,
		   Datediff (day,a.OrderDate,a.RequiredDate) dif_dia,
		   Datediff (month,a.OrderDate,a.RequiredDate) dif_mes,
		   Datediff (YEAR,a.OrderDate,a.RequiredDate) dif_anos
    FROM Orders A 
	where Datediff (day,a.OrderDate,a.RequiredDate)<28