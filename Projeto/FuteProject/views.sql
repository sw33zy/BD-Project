-- Aplicada na querie 19 para ir buscar os jogadores que passaram por um clube
Drop view if exists historico_clubes_clube;
Create view historico_clubes_clube as
Select j.nome, c.designacao, t.inicio_contrato From Historico_clubes t INNER JOIN Clube_anterior c on
c.id=t.Clube_anterior_id INNER JOIN Jogador j on t.Jogador_id = j.id;


-- Aplicada na querie 31 para ir buscar os clubes pelos quais um determinado jogador já passou
Drop view if exists historico_clubes_jogador;
Create view historico_clubes_jogador as
Select j.nome as nome , ca.designacao as Clube_anterior, h.inicio_contrato as inicio_contrato , h.fim_contrato as fim_contrato From Jogador j
INNER JOIN Historico_clubes h on j.id = h.Jogador_id
INNER JOIN Clube_anterior ca on h.Clube_anterior_id=ca.id;

-- Aplicada na querie 28 para ir buscar a info da passagem do jogador por um clube
Drop view if exists historico_reputacao_jogador;
Create view historico_reputacao_jogador as
SELECT j.id, nome, h.inicio_contrato, h.fim_contrato, c.designacao, h.reputacao
FROM Historico_clubes h
INNER JOIN Jogador j on h.Jogador_id = j.id
INNER JOIN Clube_anterior c on h.Clube_anterior_id = c.id
UNION
SELECT j.id, j.nome, j.inicio_contrato, j.fim_contrato, cl.designacao, j.reputacao From Clube cl 
INNER JOIN Jogador j on j.Clube_id = cl.id;