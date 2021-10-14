
DECLARE�@meuvalor�DECIMAL�(5,�2);�--declarando variavel
SET�@meuvalor�=�193.57;�-- atribuindo um valor

--�Or,�using�CAST��
SELECT�Cast(@meuvalor�AS�VARBINARY(20));�
SELECT�Cast(Cast(@meuvalor�AS�VARBINARY(20))�AS�DECIMAL(5,�2));�

--�Or,�using�CONVERT��
SELECT�CONVERT(VARBINARY(20),�@meuvalor);�
SELECT�CONVERT(DECIMAL(5,�2),�CONVERT(VARBINARY(20),�@meuvalor));



--�Use�CAST: converte uma expressao de um tipo de dados em outro��
    use AdventureWorks2014
	SELECT�Substring(NAME,�1,�15)�AS�ProductName,�--traz os 15 primeiros caracteres do nome no campo ProductName�������
	listprice�
    FROM���production.product�
	WHERE��Cast(listprice�AS�INT)�LIKE�'3%'; --lista de pre�o que come�a com 3

--�Use�CONVERT.���
	SELECT�Substring(NAME,�1,�20)�AS�ProductName,��������
	listprice�
	FROM���production.product�
    WHERE��CONVERT(INT,�listprice)�LIKE�'3%';

--Formatando cast e arrendondando
--Usando CAST com operadores aritm�ticos
	SELECT�Cast(Round(salesytd�/�commissionpct,�0)�AS�INT)�AS�formatado,��������
					 (salesytd�/�commissionpct�)��nao_format�
	FROM���sales.salesperson�
	WHERE��commissionpct�<>�0

--Usando CAST para concatenar
	SELECT� 'A lista de preco �'+�Cast(listprice�AS�VARCHAR(12))�AS�ListPrice�
	FROM���production.product�
	WHERE��listprice�BETWEEN�350.00�AND�400.00;

--Usando CAST para concatenar Distinct
	SELECT�DISTINCT  'A lista de preco �'+�Cast(listprice�AS�VARCHAR(12))�AS�ListPrice�
	FROM���production.product�
	WHERE��listprice�BETWEEN�350.00�AND�400.00;

--Usando CAST para concatenar Distinct (!Simulando erro -CONCATENAR TEXTO COM CARACTER)
	SELECT�distinct  'A lista de preco �'+�listprice�AS�ListPrice�
	FROM���production.product�
	WHERE��listprice�BETWEEN�350.00�AND�400.00;


--Usando CAST para produzir texto mais leg�vel
	SELECT�DISTINCT�
	p.NAME,
	Cast(p.NAME�AS�CHAR(10))�AS�NAME,�-- reduz para 10 caracteres o campo NAME ����������������
		s.unitprice�
	FROM���sales.salesorderdetail�AS�s��������
		JOIN�production.product�AS�p����������
		ON�s.productid�=�p.productid�
	WHERE��p.NAME�LIKE�'Long-Sleeve Logo Jersey, M';

--Usando CAST com a cl�usula LIKE

	SELECT�p.firstname,��������
		   p.lastname,��������
		   s.salesytd,��������
		   s.businessentityid,��������
		   Cast(Cast(s.salesytd�AS�INT)�AS�CHAR(20)),��������
		   Cast(s.salesytd�AS�CHAR(20))�
	FROM���person.person�AS�p��������
		JOIN�sales.salesperson�AS�s����������
		ON�p.businessentityid�=�s.businessentityid�--sempre que faz join tem que fazer on para comparar campos
		WHERE��Cast(Cast(s.salesytd�AS�INT)�AS�CHAR(20))�LIKE�'2%' 