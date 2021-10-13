--conhecendo as tabelas
use curso
SELECT TOP 1 * FROM cidades
SELECT TOP 1 * FROM senso_2013
SELECT * FROM uf
SELECT * FROM regiao_uf


--AVG Retorna a média dos valores em um grupo. Valores nulos são ignorados
SELECT AVG(populacao) FROM cidades

--AVG MEDIA POR ESTADO:
SELECT UF,AVG(POPULACAO) FROM CIDADES
GROUP BY UF
ORDER BY 2

--AVG POR REGIAO:
SELECT * FROM cidades
SELECT * FROM regiao_uf

SELECT B.regiao,AVG(A.POPULACAO) AS media 
	FROM cidades A
INNER JOIN regiao_uf B
ON A.cod_uf=B.ID
GROUP BY B.regiao
ORDER BY 2 desc
-- ORDER BY 2 DESC significa ordernar pelo campo 2 neste caso AVG(A.POPULACAO).

--MIN Retorna o valor mínimo na expressão. Pode ser seguido pela cláusula OVER
SELECT MIN(populacao) AS Minimo FROM cidades

--MIN  POR ESTADO:

SELECT UF,MIN(POPULACAO) AS menor_populacao
	FROM CIDADES
GROUP BY UF
ORDER BY 2

--MIN POR REGIAO:

SELECT B.regiao,MIN(POPULACAO) AS minimo_regiao FROM CIDADES A
INNER JOIN regiao_uf B
ON A.cod_uf=B.ID
GROUP BY B.regiao
ORDER BY 2

--MAX Retorna o valor máximo na expressão
SELECT MAX(populacao) FROM cidades

--MAX  POR ESTADO
SELECT UF,MAX(POPULACAO) AS maxima_populacao FROM CIDADES
GROUP BY UF
ORDER BY 2

--MAX POR REGIAO
SELECT B.regiao,MAX(a.POPULACAO)maximo FROM CIDADES a
INNER JOIN regiao_uf B
ON A.cod_uf=B.ID
GROUP BY B.regiao
ORDER BY 2


--SUM Retorna a soma de todos os valores ou somente os valores DISTINCT na expressão. 
--SUM pode ser usado exclusivamente com colunas numéricas.Valores nulos são ignorados.

SELECT SUM(populacao)soma FROM cidades

--SUM  POR ESTADO

SELECT UF,SUM(POPULACAO)populacao_estado FROM CIDADES
GROUP BY UF
ORDER BY 2

--SUM POR REGIAO

SELECT B.regiao,SUM(a.POPULACAO) FROM CIDADES a
INNER JOIN regiao_uf B
ON A.cod_uf=B.ID
GROUP BY B.regiao
ORDER BY 2

--COUNT Retorna o número de itens de um grupo

select COUNT(*) from cidades

--Descobrindo qtd estados. DISTINCT faz contar apenas uma vez cada estado:
SELECT COUNT(DISTINCT uf) FROM cidades

--exemplo sem distinct puxa os valores que se repetem:
SELECT COUNT(uf) FROM cidades


--COUNT  POR ESTADO

SELECT UF,COUNT(*) FROM CIDADES
GROUP BY UF
ORDER BY 2

--COUNT POR REGIAO
SELECT * FROM cidades

SELECT B.regiao,COUNT(*)cidades_regiao FROM CIDADES a
INNER JOIN regiao_uf B
ON A.cod_uf=B.ID
GROUP BY B.regiao
ORDER BY 2

--usando varias funçoes de agregacao

SELECT AVG(populacao)media_pop,
	   MIN(populacao)minimo_pop,
	   MAX(populacao)maximo_pop,
	   SUM(populacao)total_pop,
	   COUNT(*) qtd_cidades
FROM cidades

--POR ESTADO: sempre colocar select uf colocar group by uf

SELECT UF,
	   AVG(populacao)media_pop,
	   MIN(populacao)minimo_pop,
	   MAX(populacao)maximo_pop,
	   SUM(populacao)total_pop,
	   COUNT(*) qtd_cidades
FROM CIDADES
GROUP BY UF
ORDER BY 2

--POR REGIAO:

SELECT B.regiao,
	  AVG(populacao)media_pop,
	  MIN(populacao)minimo_pop,
	  MAX(populacao)maximo_pop,
	  SUM(populacao)total_pop,
	  COUNT(*) qtd_cidades
 FROM CIDADES a
INNER JOIN regiao_uf B
ON A.cod_uf=B.ID
GROUP BY B.regiao
ORDER BY 2

--STDEV Retorna o desvio padrão estatístico de todos os valores da expressão especificada

SELECT STDEV(populacao)  FROM cidades

--STDEVP Retorna o desvio padrão estatístico para a população de todos os 
--valores na expressão especificada

SELECT STDEVP(populacao)  FROM cidades

--GROUPING Indica se uma expressão de coluna especificada em uma lista 
--GROUP BY é agregada ou não. GROUPING retorna 1 para agregada ou 0 
--para não agregada no conjunto de resultados. ROLLUP 

SELECT uf,SUM(populacao) AS populacao,
GROUPING(uf) AS grupo 
FROM cidades
GROUP BY uf WITH ROLLUP

--COMPARANDO CRESCIMENTO DA CIDADES
SELECT TOP 3 *  FROM CIDADES
SELECT TOP 1 *  FROM senso_2013

--Concatenar: ver se campos são varchar ou char, se fosse um tipo numerico ele faria a soma
SELECT cod_uf,cod_mun,cod_uf+cod_mun AS concatenado FROM cidades

--usando exemplo para calculo do % de crescimento do senso 2007 para senso 2013:
SELECT a.nome_mun,
       a.populacao as senso_2007,
	   b.populacao as senso_2013,
100/cast(a.populacao as float)*cast(b.populacao as float)-100 percentual_crescim
FROM cidades a
INNER JOIN senso_2013 b
ON a.cod_uf+a.cod_mun=b.cod_mun

--por estado
SELECT a.uf,
       sum(a.populacao) as senso_2007,
	   sum(b.populacao) as senso_2013,
100/cast(sum(a.populacao) as float)*cast(sum(b.populacao) as float)-100
from cidades a
inner join senso_2013 b
on a.cod_uf+a.cod_mun=b.cod_mun
group by a.uf



--GROUPING_ID
/*
É uma função que calcula o nível de agrupamento. 
GROUPING_ID pode ser usada apenas na lista SELECT <select>, 
na cláusula HAVING ou ORDER BY, quando GROUP BY for especificada.
*/
SELECT b.regiao,a.uf,sum(a.populacao) populacao,
GROUPING_ID(b.regiao,a.uf) AS grupo 
FROM cidades a
INNER JOIN regiao_uf b
ON a.cod_uf=b.id
GROUP BY ROLLUP(b.regiao,a.uf)



--VAR Retorna a variância estatística de todos os valores da expressão especificada
SELECT VAR(POPULACAO) FROM CIDADES

SELECT UF,VAR(POPULACAO) FROM CIDADES
GROUP BY UF


--VARP Retorna a variância estatística para o preenchimento 
--de todos os valores da expressão especificada.
SELECT VARP(POPULACAO) FROM CIDADES

SELECT UF,VARP(POPULACAO) FROM CIDADES
GROUP BY UF

--COMPARANDO VAR COM VARP
SELECT UF,VAR(POPULACAO) var,VARP(POPULACAO)varp FROM CIDADES
GROUP BY UF



--exemplo com Grouping
use AdventureWorks2014
SELECT salesquota,        Sum(salesytd)        'TotalSalesYTD',        
Grouping(salesquota) AS 'Grouping' 
from sales.salesperson 
GROUP  BY salesquota WITH rollup;









