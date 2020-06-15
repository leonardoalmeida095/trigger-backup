

--Criação do gatilho "utg_moverImvDel" para backup de dados deletados da tabela "imovel" para "imovelDel"

CREATE TRIGGER utg_moverImvDel
	ON imovel AFTER DELETE AS
	BEGIN
		DECLARE @COD INT, @TIPO VARCHAR(30), @AREA FLOAT, @VALOR FLOAT, @CODCLI INT

		SELECT @COD = codImovel, @TIPO = tipo, @AREA = area, 
			@VALOR = valor, @CODCLI = cod_cliente FROM deleted

		INSERT INTO imovelDel(codImovel, tipo, area, valor, cod_cliente) 
			VALUES(@COD, @TIPO, @AREA, @VALOR, @CODCLI)
		
	END
GO





--Trigger para evitar exclusões de tabelas no banco
--CREATE TRIGGER utg_evitarExcluirTabela
--	ON DATABASE FOR DROP_TABLE AS
--		
--		PRINT 'Não é permitido excluir tabelas.'
--		ROLLBACK
