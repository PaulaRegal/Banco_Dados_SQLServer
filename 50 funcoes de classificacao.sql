--RANK EXEMPLO 2 1
/*As funções de classificação retornam um valor de classificação 
para cada linha em uma partição. Dependendo da função usada, 
algumas linhas podem receber o mesmo valor que outras. 
As funções de classificação são não determinísticas
*/
select rank() OVER (ORDER BY estado ASC) AS rank_uf ,
       estado 
from uf

--RANK EXEMPLO 2 por regiao e estado
select rank() OVER (ORDER BY estado ASC) AS rank_uf ,
	   regiao,
	   estado  
from regiao_uf

--RANK EXEMPLO 3
select rank() OVER (ORDER BY regiao ASC) AS rank_uf ,
       regiao,
	   estado
from regiao_uf

--NTILE
/*Distribui as linhas de uma partição ordenada em um número de grupos especificado. 
Os grupos são numerados, iniciando em um. Como são 27 estados e coloquei NTILE(3)
ele vai enumerar 27/3=9 em 3 grupos de 9 estados.
*/
select NTILE(3) OVER (ORDER BY regiao ASC) AS NTILE_uf ,
regiao,estado
regiao_uf 
from regiao_uf

--DENSE_RANK
/*Retorna a classificação de linhas dentro da partição de um conjunto de resultados, 
sem qualquer lacuna na classificação. A classificação de uma linha é um mais 
o número de classificações distintas que vêm antes da linha em questão.
*/
SELECT DENSE_RANK() OVER (ORDER BY regiao ASC) AS DENSE_RANK_uf ,
	  regiao,
	  estado
FROM regiao_uf


--ROW_NUMBER
/*Retorna o número sequencial de uma linha em uma partição de um conjunto de resultados, 
iniciando em 1 para a primeira linha de cada partição.
*/
SELECT ROW_NUMBER() OVER (ORDER BY estado ASC) AS ROW_NUMBER_uf ,
	  regiao,
	  estado
FROM regiao_uf

--combinando valores 1
SELECT ROW_NUMBER() OVER (ORDER BY regiao ASC) AS ROW_NUMBER_uf ,
       DENSE_RANK() OVER (ORDER BY regiao ASC) AS DENSE_RANK_uf ,
	   NTILE(6) OVER (ORDER BY regiao ASC) AS NTILE_uf ,
	   rank() OVER (ORDER BY regiao ASC) AS rank_uf ,
       regiao,
	   estado
regiao_uf 
FROM regiao_uf
ORDER BY 5,6
--5 é a regiao e 6 é o estado

--combinando valores 1
select ROW_NUMBER() OVER (ORDER BY estado ASC) AS ROW_NUMBER_uf ,
       DENSE_RANK() OVER (ORDER BY estado ASC) AS DENSE_RANK_uf ,
	   NTILE(5) OVER (ORDER BY estado ASC) AS NTILE_uf ,
	   rank() OVER (ORDER BY estado ASC) AS rank_uf ,
regiao,estado
regiao_uf 
from regiao_uf
order by 4,6

--simulando classificacao de campeonato
--drop table campeonato
CREATE TABLE campeonato
(
 nometime VARCHAR(30)not null,
 pontos INT not null
 )
 --populando tabela
INSERT INTO campeonato VALUES ('Corinthians','53');
INSERT INTO campeonato VALUES  ('Grêmio','43');
INSERT INTO campeonato VALUES  ('Santos','41');
INSERT INTO campeonato VALUES  ('Palmeiras','40');
INSERT INTO campeonato VALUES ('Flamengo','38');
INSERT INTO campeonato VALUES  ('Cruzeiro','37');
INSERT INTO campeonato VALUES  ('Botafogo','37');
INSERT INTO campeonato VALUES ('Atlético-PR','34');
INSERT INTO campeonato VALUES  ('Vasco','31');
INSERT INTO campeonato VALUES  ('Atlético-MG','31');
INSERT INTO campeonato VALUES ('Fluminense','31');
INSERT INTO campeonato VALUES  ('Sport','29');
INSERT INTO campeonato VALUES  ('Avaí','29');
INSERT INTO campeonato VALUES  ('Chapecoense','28');
INSERT INTO campeonato VALUES  ('Ponte Preta','28');
INSERT INTO campeonato VALUES  ('Bahia','27');
INSERT INTO campeonato VALUES  ('São Paulo','27');
INSERT INTO campeonato VALUES  ('Coritiba','27');
INSERT INTO campeonato VALUES  ('Vitória','26');
INSERT INTO campeonato VALUES  ('Atlético-GO','22');

SELECT * FROM campeonato

--Classificacao do campeonato
	SELECT RANK() OVER (ORDER BY pontos desc) AS classif ,
		    nometime,
			pontos 
	FROM campeonato

