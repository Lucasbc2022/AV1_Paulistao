CREATE DATABASE Campeonato
GO

USE Campeonato
GO

CREATE TABLE Times (
CodigoTime           INT              NOT NULL,
NomeTime             VARCHAR(100)     NOT NULL,
Cidade               VARCHAR(100)     NOT NULL,
Estadio              VARCHAR(100)     NOT NULL,
MaterialEsportivo    VARCHAR(100)     NOT NULL
PRIMARY KEY(CodigoTime)
)
GO

CREATE TABLE Grupos (
Grupo                CHAR(1)      CHECK(Grupo = 'A' OR Grupo = 'B' OR Grupo ='C' OR Grupo = 'D')             NOT NULL,
CodigoTime           INT                       NOT NULL
PRIMARY KEY(CodigoTime)
FOREIGN KEY(CodigoTime) REFERENCES Times(CodigoTime)
)
GO

CREATE TABLE Jogos (
CodigoTimeA               INT           NOT NULL,
CodigoTimeB               INT           NOT NULL,
GolsTimeA                 INT           NULL,
GolsTimeB                 INT           NULL,
Data                      DATE     NOT NULL
PRIMARY KEY(CodigoTimeA, CodigoTimeB)
FOREIGN KEY(CodigoTimeA) REFERENCES Times(CodigoTime),
FOREIGN KEY(CodigoTimeB) REFERENCES Times(CodigoTime)
)
GO





INSERT INTO  Times VALUES 
(1, 'Água Santa', 'Diadema', 'Distrital do Inamar', 'Karilu'),
(2, 'Botafogo-SP', 'Riberão Preto', 'Santa Cruz', 'Volt Sport'),
(3, 'Corinthians', 'São Paulo', 'Neo Química Arena', 'Nike'),
(4, 'Ferroviária', 'Araraquara','Fonte Luminosa', 'Lupo'),
(5, 'Guarani', 'Campinas', 'Brinco de Ouro', 'Kappa'),
(6, 'Inter de Limeira', 'Limeira', 'Limerão', 'Alluri Sports'),
(7, 'Ituano', 'Itu', 'Novelli Júnior', 'Kanxa'),
(8, 'Mirassol', 'Mirassol', 'José Maria de Campos Maia', 'Super Bolla'),
(9, 'Novorizontino', 'Novo Horizonte', 'Jorge  Ismael de Biasi', 'Physicus'),
(10, 'Palmeiras', 'São Paulo', 'Allianz Parque', 'Puma'),
(11, 'Ponte Preta', 'Campinas', 'Moisés Lucarelli', '1900 (Marca Própria)'),
(12, 'Red Bull Bragantino', 'Bragança Paulista', 'Nabi Abi Chedid', 'Nike'),
(13, 'Santo André', 'Santo André', 'Bruno José Daniel', 'Icone Sports'),
(14, 'Santos', 'Santos', 'Vila Belmiro', 'Umbro'),
(15, 'São Bernardo', 'São Bernardo do Campo', 'Primeiro de Maio', 'Magnum Group'),
(16, 'São Paulo', 'São Paulo', 'Morumbi', 'Adidas')
GO




-- 1 - procedure de separa os times nos grupos
-- (Coritnthians - 3, Palmeiras - 10 , Santos - 14 e São Paulo - 16 NÃO PODEM estar no mesmo grupo
CREATE PROCEDURE p_sorteio
AS 
BEGIN
DELETE Grupos

DECLARE @query VARCHAR(MAX),
        @quantidade_Times INT,
		@codigoTime INT,
		@verficarTime INT,
		@verificarGrupo INT,
		@grupo CHAR(1),
		@valor_aleatorio INT

		SELECT @quantidade_Times = COUNT(CodigoTime) FROM Grupos
		SET @query = 'INSERT INTO Grupos VALUES (''A'', 3),
		                                        (''B'', 10),
												(''C'', 14),
												(''D'', 16)'
		EXEC (@query)
	SET @codigoTime = 0
	WHILE @codigoTime < 16
	BEGIN
	     SET @codigoTime += 1
		 SELECT @verficarTime = (SELECT CodigoTime FROM Grupos WHERE CodigoTime = @codigoTime)
		 IF(@verficarTime IS NULL)
		 BEGIN
		      SET @valor_aleatorio = RAND() * 4 + 1
			  IF(@valor_aleatorio = 1) 
			          SET @grupo = 'A'
			  ELSE IF(@valor_aleatorio = 2)
			          SET @grupo = 'B'
		      ELSE IF(@valor_aleatorio = 3)
			          SET @grupo = 'C'
			  ELSE IF(@valor_aleatorio = 4)
			          SET @grupo = 'D'
              SELECT @verificarGrupo = (SELECT COUNT(Grupo) FROM Grupos WHERE Grupo = @grupo)
			  WHILE @verificarGrupo > 3
			  BEGIN
			       SET @valor_aleatorio = RAND() * 4 + 1
				   IF(@valor_aleatorio = 1) 
				       SET @grupo = 'A'
				   ELSE IF(@valor_aleatorio = 2)
				       SET @grupo = 'B'
				   ELSE IF(@valor_aleatorio = 3)
				       SET @grupo = 'C'
				   ELSE IF(@valor_aleatorio = 4)
				       SET @grupo = 'D'
                   SELECT @verificarGrupo = (SELECT COUNT(Grupo) FROM Grupos WHERE Grupo = @grupo)
			 END
			 SET @query = 'INSERT INTO Grupos VALUES ('''+@grupo+''', '+CAST(@codigoTime AS VARCHAR)+')'
			 EXEC(@query)
		END
	END
END

EXEC p_agrupamento

 
 -- 2 - select da exibicao dos jogos seguindo as regras 
CREATE PROCEDURE p_gerar_rodadas  
AS
	DELETE FROM Jogos
	DECLARE @I AS INT,
			@Data_jogosDT AS DATE,
			@A AS INT,
			@B AS INT,
			@F AS INT,
			@RA AS INT,
			@RB AS INT,
			@ID AS INT,
			@J AS INT,
			@FLAG AS INT,
			@DTJOGO AS DATE

	CREATE TABLE #Todos_Jogos(
	ID INT,
	TimeA INT,
	TimeB INT)

	CREATE TABLE #Referencias(
	ID INT,
	R INT)

	CREATE TABLE #Todas_Datas(
	ID INT,
	Data_Jogo DATE UNIQUE)

	SET @I = 0
	SET @Data_jogosDT = '2021-02-28'

	WHILE(@I < 12)
	BEGIN
		IF (@I <> 0 AND @I % 2 <> 0)
		BEGIN 
			SET @Data_jogosDT = (DATEADD(DAY, 3, @Data_jogosDT))
		END
		IF (@I <> 0 AND @I % 2 = 0)
		BEGIN
			SET @Data_jogosDT = (DATEADD(DAY, 4, @Data_jogosDT))
		END
	
		INSERT INTO #Todas_Datas VALUES
		((@I + 1),(@Data_jogosDT))

		SET @I = @I + 1
	END
	
	INSERT INTO #Referencias VALUES
	(1,1), (2,5), (3,9), (4,13),
	(5,1), (6,9), (7,5), (8,13),
	(9,1), (10,13), (11,5), (12,9)

	DELETE FROM #TODOS_JOGOS	
		
	SET @I = 1
	SET @ID = 1
	
	WHILE(@I < 12)
	BEGIN
		SET @RA = (SELECT R.R FROM #Referencias R WHERE R.ID = @I)
		SET @RB = (SELECT R.R FROM #Referencias R WHERE R.ID = @I + 1)
		SET @F = 1
		SET @A = @RA
		SET @B = @RB
	
		WHILE(@F < 17)
		BEGIN
			INSERT INTO #Todos_Jogos VALUES
			(@ID, @A, @B)
			SET @ID = @ID + 1
	
			IF(@B = (@RB + 3))
			BEGIN
				SET @B = @RB
			END
			ELSE
			BEGIN
				SET @B =  @B + 1
			END
	
			IF(@A = (@RA + 3))
			BEGIN
				SET @A =  @RA
				SET @B =  @B + 1
			END
			ELSE
			BEGIN
				SET @A = @A +1	
			END
			SET @F = @F + 1	
		END
		SET @I = @I + 2
	END

	SET @FLAG = 0
	SET @J = 1

	SET @DTJOGO = (SELECT TOP 1 t.Data_Jogo FROM #Todas_Datas t ORDER BY NEWID())
	DELETE FROM #Todas_Datas WHERE #Todas_Datas.Data_Jogo = @DTJOGO
	WHILE(@J < 92)
	BEGIN
		IF(@FLAG = 0)
		BEGIN
			INSERT INTO Jogos VALUES
			((SELECT J.TimeA FROM #Todos_Jogos J WHERE J.ID = @J) , (SELECT J.TimeB FROM #Todos_Jogos J WHERE J.ID = @J), NULL, NULL, @DTJOGO),
			((SELECT J.TimeA FROM #Todos_Jogos J WHERE J.ID = (@J + 16)) , (SELECT J.TimeB FROM #Todos_Jogos J WHERE J.ID = (@J + 16)), NULL, NULL, @DTJOGO)
		END
		ELSE
		BEGIN
			INSERT INTO Jogos VALUES
			((SELECT J.TimeB FROM #Todos_Jogos J WHERE J.ID = @J) , (SELECT J.TimeA FROM #Todos_Jogos J WHERE J.ID = @J), NULL, NULL, @DTJOGO),
			((SELECT J.TimeB FROM #Todos_Jogos J WHERE J.ID = (@J + 16)) , (SELECT J.TimeA FROM #Todos_Jogos J WHERE J.ID = (@J + 16)), NULL, NULL, @DTJOGO)
		END
		IF(@J % 16 = 0)
		BEGIN
			SET @J = @J + 16
		END

		IF(@J % 4 = 0)
		BEGIN
			SET @DTJOGO = (SELECT TOP 1 t.Data_Jogo FROM #Todas_Datas t ORDER BY NEWID())
			DELETE FROM #Todas_Datas WHERE #Todas_Datas.Data_Jogo = @DTJOGO
			IF(@FLAG = 0)
			BEGIN
				SET @FLAG = 1
			END
			ELSE
			BEGIN
				SET @FLAG = 0
			END
		END
		SET @J = @J +1
	END



			EXEC p_gerar_rodadas
 

 -- 3 - select da telas das tabelas dos grupos A, B, C e D com cores diferentes
SELECT t.NomeTime,
       g.Grupo
FROM Grupos g, Times t
WHERE t.CodigoTime = g.CodigoTime
  AND g.Grupo = 'A'

SELECT t.NomeTime,
       g.Grupo
FROM Grupos g, Times t
WHERE t.CodigoTime = g.CodigoTime
  AND g.Grupo = 'B'

SELECT t.NomeTime,
       g.Grupo
FROM Grupos g, Times t
WHERE t.CodigoTime = g.CodigoTime
  AND g.Grupo = 'C'

SELECT t.NomeTime,
       g.Grupo
FROM Grupos g, Times t
WHERE t.CodigoTime = g.CodigoTime
  AND g.Grupo = 'D'


 -- 4 - select da tela de exibicao dos nomes dos times em ordenados pelo nome
 SELECT CodigoTime,
        NomeTime,
		Cidade,
		Estadio,
		MaterialEsportivo
 FROM Times
 ORDER BY NomeTime

-- 5 - select da tela de exibicao dos jogos pela pequisa de data

 SELECT ta.NomeTime AS NomeTimeA,
        j.GolsTimeA,
		tb.NomeTime AS NomeTimeB,
		j.GolsTimeB,
		j.Data 
 FROM Jogos j, Times ta, Times tb
 WHERE j.CodigoTimeA = ta.CodigoTime
   AND j.CodigoTimeB = tb.CodigoTime

   

SELECT * FROM Grupos
SELECT * FROM Times
SELECT * FROM Jogos
