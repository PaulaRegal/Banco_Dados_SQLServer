--Comando IF

--Primeiro�exemplo�IF AND (AS DUAS CONDI��ES S�O VERDADEIRAS)
IF�1�=�1 AND� 2�=�2�
	BEGIN���
		PRINT�'Correto��TRUE'�
	END�
	ELSE�
		PRINT�'Errado��FALSE';

--Segundo�exemplo And
IF�1�=�1�AND�2�=�17�
	BEGIN��
		�PRINT�'Correto��TRUE'�
	END�
	ELSE�
		PRINT�'Errado��FALSE';

--Terceiro exemplo OR IF ELSE
IF�1�=�1�OR�2�=�17�
	BEGIN��
		�PRINT�'Correto��TRUE'�
	END�
	ELSE
		PRINT�'Errado��FALSE';
		
--4 Exemplo 
--criacao da tabela

select a.OrderID pedido,a.ProductID cod_mat,a.Quantity qtd,a.UnitPrice preco 
   into ped_detalhe
 from NORTHWND.dbo.[Order Details] a


 select pedido,count(*)
	from ped_detalhe
group by pedido

10411 3 ITENS
10720 2 ITENS
10789 4 ITENS

--Teste com IF ELSE
DECLARE @pedido int;
SET @pedido='10720';
IF�(SELECT�Count(*)�����
	FROM���ped_detalhe�����WHERE��pedido�=�@pedido����
	GROUP��BY�pedido)�>�3
		BEGIN���
			PRINT�'Condicao�Satisfeita'�
		END
		ELSE���
		BEGIN�������
		PRINT 'Passei por aqui'	SELECT 'Os�Itens�s�o' Msg,pedido,cod_mat
			FROM���ped_detalhe�������
			WHERE��pedido�=�@pedido;�
		END�

--IF 
--�Declara��o�da�vari�vel�
	DECLARE�@Idade�INT;�
--�Atribui��o�do�valor�a�vari�vel
	SET�@Idade=65;�
--�Se...�for�menor�que�18�anos
	IF�@Idade�<�18�
		PRINT�'Menor�que�18�anos';�
--�Se�n�o�...�
	ELSE�IF�@Idade�>=18 and @Idade<65
		PRINT 'Maior que 18 anos'; 
	ELSE  
		PRINT 'Maior que 65 anos'; 
