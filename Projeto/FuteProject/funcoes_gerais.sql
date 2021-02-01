-- funções usadas pelos agentes e olheiros


-- adicionar localidade nova

Drop procedure if exists addLocalidade;
DELIMITER //
CREATE PROCEDURE addLocalidade ( IN designacao VARCHAR(45), idPais INT)
Begin 
DECLARE n INT;
declare teste VARCHAR(45);
SET n =(SELECT COUNT(*) From Localidade);
set teste = (select l.designacao from Localidade l where l.designacao = designacao);
IF (teste is null) then
INSERT INTO Localidade(id,designacao,País_id)
Values(n+1,designacao,idPais);
END IF;
END //
DELIMITER //




-- adicionar país novo

Drop procedure if exists addPais;
DELIMITER //
CREATE PROCEDURE addPais (IN designacao VARCHAR(45))
Begin 
DECLARE n INT;
declare teste VARCHAR(45);
SET n =(SELECT COUNT(*) From País);
set teste = (select p.designacao from País p where p.designacao = designacao);
IF (teste is null) then
INSERT INTO País(id,designacao)
Values(n+1,designacao);
END IF;
END //
DELIMITER //


-- adicionar nacionalidade nova

Drop procedure if exists addNacionalidade;
DELIMITER //
CREATE PROCEDURE addNacionalidade (IN designacao VARCHAR(45))
Begin 
DECLARE n INT;
declare teste VARCHAR(45);
SET n =(SELECT COUNT(*) From Nacionalidade);
set teste = (select n.designacao from Nacionalidade n where n.designacao = designacao);
IF (teste is null) then
INSERT INTO Nacionalidade(id,designacao)
Values(n+1,designacao);
END IF;
END //
DELIMITER //









