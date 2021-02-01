-- funções agente
USE `FuteProject`;

-- Função que cria clube anterior

Drop procedure if exists addClubeAnterior;
DELIMITER //
CREATE PROCEDURE addClubeAnterior ( IN designacao VARCHAR(128))
Begin 
DECLARE n INT;
declare teste VARCHAR(45);
SET n =(SELECT COUNT(*) From Clube_anterior);
set teste = (select c.designacao from Clube_anterior c where c.designacao = designacao);
IF (teste is null) then
INSERT INTO Clube_anterior(id,designacao)
Values(n+1,designacao);
END IF;
END //
DELIMITER //




-- criar Historivo_clube
    
Drop procedure if exists addHistorico_clube;
DELIMITER //
Create procedure addHistorico_clube (IN id_jogador INT,inicio_contrato DATE ,fim_contrato DATE,golos INT,id_clubeAntigo INT, reputacao INT)
BEGIN
    INSERT INTO Historico_clubes (Jogador_id,Clube_anterior_id,inicio_contrato,fim_contrato,golos,reputacao)
Values (id_jogador,id_clubeAntigo,inicio_contrato,fim_contrato,golos, reputacao);
END //
DELIMITER //


-- cria uma entrada na tabela clube
Drop procedure if exists criaClube;
DELIMITER //
CREATE PROCEDURE criaClube ( IN designacao VARCHAR(128))
Begin
declare teste VARCHAR(45);
DECLARE n INT;
set teste = (select c.designacao from Clube c where c.designacao = designacao);
IF (teste is null) then
SET n =(SELECT COUNT(*) From Clube);
INSERT INTO Clube (id,designacao)
Values(n+1,designacao);
END IF;
END //
DELIMITER //



-- iniciar dados de jogador num novo clube
Drop procedure if exists resetaDadosJogador;
DELIMITER //
CREATE PROCEDURE resetaDadosJogador ( IN id_novoClube VARCHAR(128), inicio_contrato date, fim_contrato date, id_jogador int)
Begin
Update Jogador
SET Clube_id=id_novoClube,golos_marcados=0, inicio_contrato=inicio_contrato, fim_contrato=fim_contrato
where id=id_jogador;
END //
DELIMITER //




DELIMITER //
Create procedure alteraStatusJogador(in id_jogador INT, in golos INT,in valor INT, in rep INT, IN nr_inter INT)
BEGIN 
UPDATE Jogador
SET golos_marcados = golos, reputacao=rep, valor_mercado=valor, nr_internacionalizacoes=nr_inter, idade=idade(j.dataNascimento)
Where j.id=id_jogador;
END //
DELIMITER //



-- agente adiciona um jogador à base de dados

Drop procedure if exists adicionaJogador;
DELIMITER //
Create procedure adicionaJogador(in nome VARCHAR(45), dataNascimento date, idade int, altura int, nr_internacionalizacoes int, valor_mercado int, reputacao int, 
                                     golos_marcados int, tipo_id int, posicao_id int, clube_id int, localidade_id int, nacionalidade_id int, agente_id int, olheiro_id int, avaliacao int, comentario text, fim_contrato date, inicio_contrato date)
BEGIN 
UPDATE Jogador

SET n =(SELECT COUNT(*) From Jogador);
INSERT INTO Jogador (id,nome,data_nascimento,idade,altura,nr_internacionalizacoes,valor_mercado,reputacao,golos_marcados,Tipo_id,Posicao_id,Clube_id,Localidade_id,Nacionalidade_id,Agente_id,Olheiro_id,avaliacao,comentario,fim_contrato,inicio_contrato)
Values(n+1, nome, dataNascimento, idade, altura, nr_internacionalizacoes, valor_mercado, reputacao, golos_marcados, tipo_id, posicao_id, clube_id, localidade_id, nacionalidade_id, agente_id, olheiro_id, avaliacao, comentario, fim_contrato, inicio_contrato);
END //
DELIMITER //


-- agente remove um jogador da base de dados

Drop procedure if exists removeJogador;
DELIMITER //
Create procedure removeJogador(in idJogador INT)
BEGIN
delete from Historico_clubes h where h.Jogador_id = idJogador;
delete from Jogador j where j.id = idJogador;
END //
DELIMITER //

call removeJogador("02");

-- agente recruta uma jovem promessa

Drop procedure if exists recrutarJovemPromessa;
DELIMITER //
Create procedure recrutarJovemPromessa(in idJogador INT, agente_id int)
BEGIN
UPDATE Jogador
SET Tipo_id="01", Agente_id=agente_id
WHERE id=idJogador;
END //
DELIMITER //

