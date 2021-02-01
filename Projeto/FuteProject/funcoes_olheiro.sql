-- funções do olheiro

-- adicionar uma jovem promessa à base de dados

Drop procedure if exists adicionaJovemPromessa;
DELIMITER //
Create procedure adicionaJovemPromessa(in nome VARCHAR(45), dataNascimento date, idade int, altura int, nr_internacionalizacoes int, valor_mercado int, reputacao int, 
                                     golos_marcados int, posicao_id int, clube_id int, localidade_id int, nacionalidade_id int, olheiro_id int, avaliacao int, comentario text, fim_contrato date, inicio_contrato date)
BEGIN 
UPDATE Jogador

SET n =(SELECT COUNT(*) From Jogador);
INSERT INTO Jogador (id,nome,data_nascimento,idade,altura,nr_internacionalizacoes,valor_mercado,reputacao,golos_marcados,Tipo_id,Posicao_id,Clube_id,Localidade_id,Nacionalidade_id,Agente_id,Olheiro_id,avaliacao,comentario,fim_contrato,inicio_contrato)
Values(n+1, nome, dataNascimento, idade, altura, nr_internacionalizacoes, valor_mercado, reputacao, golos_marcados, "02", posicao_id, clube_id, localidade_id, nacionalidade_id, null, olheiro_id, avaliacao, comentario, fim_contrato, inicio_contrato);
END //
DELIMITER //