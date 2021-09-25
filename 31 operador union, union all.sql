USE NORTHWND
--SIMULANDO ERRO UNION: sempre tenho que ter um número igual de expressões na lista de destino. Neste caso, tinha que colocar no 
--segundo SELECT , 2 (uma virgula e um numero)

SELECT '1',1
UNION 
SELECT 'A'

--EXEMPLO USANDO UNION: apresenta uma vez cada valor, tem o comando distinct embutido.
	
	SELECT city 
	FROM   customers 
	UNION  
	SELECT city 
	FROM   suppliers 
	ORDER  BY city

----EXEMPLO USANDO UNION ALL: permite valor duplicado

	SELECT 'CLI',city 
	FROM   customers 

	UNION ALL

	SELECT 'FORNEC', city 
	FROM   suppliers 
	ORDER  BY city

--EXEMPLO COM UNION: intersecção
	SELECT city,        
		   country 
	FROM   customers 
		WHERE  country = 'Germany' 
		
	UNION
	 
	SELECT city,        
		   country 
	FROM   suppliers 
		WHERE  country = 'Germany' 
	ORDER  BY city

--EXEMPLO COM UNION ALL
	SELECT city,        
		   country 
	FROM   customers 
		WHERE  country = 'Germany' 
		
	UNION ALL
	 
	SELECT city,        
		   country 
	FROM   suppliers 
		WHERE  country = 'Germany' 
	ORDER  BY city