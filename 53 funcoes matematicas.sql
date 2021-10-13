--ABS
--Uma função matemática que retorna o valor absoluto (modulo) 


SELECT Abs(-1.0),        
       Abs(0.0),        
	   Abs(1.0),
	   Abs(-9.0),
	   Abs(9.0),
	   abs(-5.4),
	   abs(5.4);

--RAND
--Retorna um valor float pseudoaleatório de 0 a 1, exclusivo.


SELECT Rand(), 
       Rand(), 
	   Rand()

--exemplo

DECLARE @cont smallint;
SET @cont = 1;
WHILE @cont < 5
   BEGIN
      SELECT RAND() Random_Number
      SET @cont = @cont + 1
   END;

--ROUND
--Retorna um valor numérico, arredondado, para o comprimento ou precisão especificados.

SELECT Round(123.9994, 3), --apos a terceira casa é 4 arredonda para 0 ficando 123.9990   
       Round(123.9995, 3); --apos a terceira casa é 5 arredonda para cima 124.0000

--exemplo 2

SELECT Round(123.4545, 2); --123.4500
SELECT Round(123.45,-2); --100
SELECT Round(193.45,-2); --200

--exemplo 3
SELECT Round(150.75, 0);  --151.00
SELECT Round(150.75, 0, 1); --150.00

