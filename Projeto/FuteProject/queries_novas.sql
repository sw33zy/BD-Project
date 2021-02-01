USE `FuteProject`;

SELECT *
	FROM Jogador;
    
    
-- Query 11 - Obter número de jogadores agenciados
drop  procedure if exists nr_agenciados;
DELIMITER //
create procedure nr_agenciados()
Begin
SELECT COUNT(id) FROM Jogador
	WHERE Tipo_id=1;
end //
DELIMITER //
call nr_agenciados();
    

    
-- 12.    Obter número de jogadores de uma determinada nacionalidade.    

drop  procedure if exists jogadores_nacionalidade;
DELIMITER //
create procedure jogadores_nacionalidade(in nac VARCHAR(45))
begin
SELECT * From Nacionalidade n INNER JOIN Jogador j on n.id=j.Nacionalidade_id
where n.designacao = nac;
end //
DELIMITER //
call jogadores_nacionalidade("Português");


-- 13.  Consultar jogadores por posição.

drop procedure if exists jogadores_posicao; 
DELIMITER // 
create procedure jogadores_posicao(in pos VARCHAR(45))
begin 
SELECT * FROM Posicao p INNER JOIN Jogador j on j.Posicao_id = p.id
where p.designacao=pos;
end //
DELIMITER ;
call jogadores_posicao("Extremo Direito");

-- 14.    Obter top 3 de agentes com mais jogadores associados.


drop  procedure if exists top3Agentes;
DELIMITER //
create procedure top3Agentes()
Begin
SELECT Count(j.Agente_id),a.nome
From Jogador j INNER JOIN Agente a on a.id = j.Agente_id
Group by (j.Agente_id)
Order by (Count(j.Agente_id)) DESC
Limit 3;
end //
DELIMITER //

call top3Agentes();


-- 16.    Obter top 3 de jogadores com mais golos marcados.
SET GLOBAL log_bin_trust_function_creators = 1;
Drop function if exists soma_golos_l;
DELIMITER //
CREATE FUNCTION soma_golos_l(jog VARCHAR(45)) RETURNS INT
BEGIN
DECLARE golos INT;
SET golos = (SELECT SUM(h.golos) FROM Jogador j inner join Historico_clubes h on j.id = h.Jogador_id WHERE j.nome = jog);
RETURN golos;
END //
DELIMITER //

drop  procedure if exists top3Golos;
DELIMITER //
create procedure top3Golos()
Begin
SELECT j.nome, soma_golos_l(j.nome)+j.golos_marcados as Golos_Totais From Jogador j
Where j.Tipo_id=1
Group by (j.id)
Order by (Golos_Totais) desc
Limit 3;
end //
DELIMITER //
call top3Golos();

-- 16.    Obter top 3 de jogadores com maior reputacao.

drop  procedure if exists top3Reputacao;
DELIMITER //
create procedure top3Reputacao()
begin
SELECT * From Jogador j
Where j.Tipo_id=1
Order by (j.reputacao) desc
Limit 3;
end //
DELIMITER //

call top3Reputacao();


-- 18.    Obter top 3 de jogadores com maior valor de mercado.

drop  procedure if exists top3Valor;
DELIMITER //
create procedure top3Valor()
begin
SELECT * From Jogador j
Where j.Tipo_id=1
Order by (j.valor_mercado) desc
Limit 3;
end //
DELIMITER //

call top3Valor();

-- 19.    Obter lista de jogadores que jogaram num determinado clube.

drop procedure if exists historico_clube; 
DELIMITER // 
create procedure historico_clube (in clube VARCHAR(45)) 
begin 
SELECT nome, ca.designacao, id, ca.inicio_contrato from historico_clubes_clube ca, clube c
where c.designacao = clube and ca.designacao = c.designacao
order by ca.inicio_contrato;
end //
DELIMITER //
call historico_clube("Real Madrid");


-- 20.    Consultar número de golos de um determinado jogador no clube atual.

drop procedure if exists golos_jogador; 
DELIMITER // 
create procedure golos_jogador (in jog VARCHAR(45)) 
begin 
Select j.nome, j.golos_marcados From Jogador j
Where j.nome = jog;
end//
DELIMITER //
Call golos_jogador("Cristiano Ronaldo");

-- 21.    Consultar agente de um determinado jogador.

drop procedure if exists agente_jogador; 
DELIMITER // 
create procedure agente_jogador (in jog VARCHAR(45)) 
begin 
Select j.nome, a.nome , a.id From Jogador j INNER JOIN Agente a on a.id = j.Agente_id
where j.nome = jog;
end//
DELIMITER //
Call agente_jogador("Cristiano Ronaldo");

-- 22.    Consultar telefone de agente de um determinado jogador.

drop procedure if exists telefone_agente_jogador; 
DELIMITER // 
create procedure telefone_agente_jogador (in jog VARCHAR(45)) 
begin 
Select j.nome, a.nome , a.telefone From Jogador j INNER JOIN Agente a on a.id = j.Agente_id
where j.nome = jog;
end//
DELIMITER //
Call telefone_agente_jogador("Cristiano Ronaldo");


-- 23. Dado um determinado olheiro, obter lista de reputações de jogadores observados por ele.

drop procedure if exists olheiro_jogador_reputacao; 
DELIMITER // 
create procedure olheiro_jogador_reputacao (in o VARCHAR(45)) 
begin 
Select j.nome as Nome , j.reputacao as Reputacao From Jogador j 
INNER JOIN Olheiro ol on ol.id=j.Olheiro_id
Where ol.nome=o;
end//
DELIMITER //
Call olheiro_jogador_reputacao ("Aurélio Pereira");



-- 24.    Obter o top 5 de jovens promessas mais novas.

SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER //
CREATE FUNCTION idade (dta date) RETURNS INT
BEGIN
RETURN TIMESTAMPDIFF(MONTH, dta, CURDATE());
END //
DELIMITER //


drop  procedure if exists top5MaisJovens;
DELIMITER //
create procedure top5MaisJovens()
begin
Select * From Jogador j 
Where j.Tipo_id=2
Order by idade(j.data_nascimento)
Limit 5;
end //
DELIMITER //

call top5MaisJovens();


-- 25.    Obter o top 5 de melhores jogadores sem clube.

drop  procedure if exists top5SemClube;
DELIMITER //
create procedure top5SemClube()
begin 
Select * From Jogador j 
Where j.Clube_id = null
Order by j.reputacao
Limit 5;
end //
DELIMITER //

call top5SemClube();

-- 26 - Obter jogadores de uma posição abaixo de um determinado preço.

drop procedure if exists jogador_abaixo_valor; 
DELIMITER // 
create procedure jogador_abaixo_valor (in valor INT,in pos VARCHAR(45))
begin 
Select * From Jogador j INNER JOIN Posicao p on j.posicao_id = p.id
Where j.valor_mercado<= valor and p.designacao=pos
Order by j.valor_mercado desc;
end//
DELIMITER //
Call jogador_abaixo_valor ("80", "Ponta de Lança");


-- 27 acabar contrato


Drop function if exists mesescontratoj;
DELIMITER //
CREATE FUNCTION mesescontratoj (data date) RETURNS INT
BEGIN
RETURN TIMESTAMPDIFF(MONTH, CURDATE(), data);
END //
DELIMITER //


Drop procedure if exists meses_contrato;
DELIMITER //
create procedure meses_contrato (in n VARCHAR(45))
BEGIN
Select j.nome , mesescontratoj(j.fim_contrato) as Meses_de_contrato From Jogador j
INNER JOIN Agente a on a.id=j.Agente_id
Where a.nome=n;
End //
DELIMITER //
Call meses_contrato("Jorge Mendes");


-- 28-Devolver o historico de clubes e o clube atual para ver a reputação

Drop procedure if exists evolucao_reputacao;
DELIMITER //
Create procedure evolucao_reputacao (in jog VARCHAR(45))
Begin 
SELECT * FROM historico_reputacao_jogador h
Where h.nome=jog
ORDER BY inicio_contrato;
END //
DELIMITER //
call evolucao_reputacao("Cristiano Ronaldo");

-- 29 Golos marcados

Drop function if exists soma_golos;
DELIMITER //
CREATE FUNCTION soma_golos(jog VARCHAR(45)) RETURNS INT
BEGIN
DECLARE golos INT;
SET golos = (SELECT SUM(h.golos) FROM Jogador j inner join Historico_clubes h on j.id = h.Jogador_id WHERE j.nome = jog);
RETURN golos;
END //
DELIMITER //

Drop procedure if exists golos_jogador;
DELIMITER //
Create procedure golos_jogador(in jog VARCHAR(45))
Begin
Select j.nome, soma_golos(jog) + j.golos_marcados as Golos
From Jogador j
Where j.nome= jog;
-- GROUP BY j.nome;
END //
DELIMITER //
call golos_jogador("Cristiano Ronaldo");


-- 30

Drop procedure if exists golos_clube;
DELIMITER //
Create procedure golos_clube (in jog VARCHAR(45), in equip VARCHAR(45))
Begin 
Select j.nome,ca.designacao as Equipa , h.golos 
From Jogador j INNER JOIN Historico_clubes h on j.id=h.Jogador_id 
INNER JOIN Clube_anterior ca on h.Clube_anterior_id=ca.id
WHERE j.nome = jog and ca.designacao = equip;
END //
DELIMITER //
call golos_clube("Cristiano Ronaldo","Manchester United");

-- 31 Histórico de clubes de um jogador

Drop procedure if exists historicoClubesJogador;
DELIMITER //
CREATE PROCEDURE historicoClubesJogador ( IN designacao VARCHAR(128))
Begin 
Select Clube_anterior, ca.inicio_contrato, ca.fim_contrato from historico_clubes_jogador ca, Jogador j
where j.nome = designacao and j.nome = ca.nome
Order by ca.inicio_contrato;
END //
DELIMITER //

call historicoClubesJogador("Cristiano Ronaldo");

-- 32 Jogadores agenciados por um agente

Drop procedure if exists jogadoresAgente;
DELIMITER //
CREATE PROCEDURE jogadoresAgente (IN designacao VARCHAR(45))
Begin 
Select j.nome as Nome from Jogador j INNER JOIN Agente a on j.Agente_id = a.id
where a.nome = designacao;
END //
DELIMITER //

call jogadoresAgente("Jorge Mendes");











