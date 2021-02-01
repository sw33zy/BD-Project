CREATE VIEW `viewHistoricoClubes` AS

Select j.nome as nome , ca.designacao as Clube_antigo, ca.inicio_contrato as inicio_contrato , ca.fim_contrato as fim_contrato From Jogador j 
INNER JOIN Historico_clubes h on j.Historico_clubes_id = h.id 
INNER JOIN Clube_antigo ca on h.Clube_anterior_id=ca.id
Order by ca.inicio_contrato