--CHOOSE
--Retorna o item ao �ndice especificado de uma lista de valores no SQL Server.
--Exemplo 1
SELECT�Choose�(3,�'Gerente',�'Diretor',�'Desenvolvedor',�'Tester')�AS Escolhido�

--Exemplo 2
USE AdventureWorks2014
�SELECT�productcategoryid,�����
Choose�(productcategoryid,�'A',�'B',�'C',�'D',�'E')�AS�Expressao�
FROM���production.productcategory;�

--exemplo 3

�SELECT�jobtitle,��������
        hiredate,
		Month(hiredate)mes,��������
		Choose(Month(hiredate),�'Winter',�'Winter',�'Spring',�'Spring',�
		                        'Spring','Summer',�'Summer','Summer',�
								'Autumn',�'Autumn',�'Autumn','Winter') AS Quarter_Hired�
		FROM���humanresources.employee�
		WHERE��Year(hiredate)�>�2005�
		ORDER��BY�Year(hiredate);


--IIF
--Retorna um de dois valores, dependendo de a express�o booliana 
--ser avaliada como true ou false no SQL Server�
--Exemplo 1
�DECLARE�@a�INT�=�45,��������� 
		 @b�INT�=�40;�  
		 SELECT�IIF�(@a�>�@b,�'TRUE',�'FALSE')�AS�Resultado;

DECLARE�@a�INT�=�45,��������� 
		 @b�INT�=�40;�  
		 SELECT�IIF�(@a�>�@b,�'Maior',�'Menor')�AS�Resultado;

DECLARE�@a�INT�=�45,��������� 
		 @b�INT�=�40;�  
		 SELECT�IIF�(@a�<�@b,�'Menor',�'Maior')�AS�Resultado;


--EXEMPLO 2
--IIF com constantes NULL
--O resultado dessa instru��o � um erro
SELECT�IIF�(45�>�30,�NULL,�NULL)�AS�Result;

--EXEMPLO 3
/*IIF com par�metros NULL
O retorno NULL.*/
	DECLARE�@P�INT�=�NULL,���������
			@S�INT�=�NULL;�
	SELECT� IIF (45�>�30,�@p,�@s)�AS�Result
