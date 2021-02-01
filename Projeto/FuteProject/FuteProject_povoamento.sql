USE `FuteProject`;


INSERT INTO `FuteProject`.`Tipo`
    (id,designacao)
VALUES
    ("01","Contratado"),
    ("02","Jovem Promessa");

INSERT INTO `FuteProject`.`Posicao`
    (id,designacao)
VALUES
    ("01","Guarda-Redes"),
    ("02","Defesa Central"),
    ("03","Lateral Esquerdo"),
    ("04","Lateral Direito"),
    ("05","Médio Defensivo"),
    ("06","Médio Centro"),
    ("07","Médio Ofensivo"),
    ("08","Extremo Esquerdo"),
    ("09","Extremo Direito"),
    ("10","Segundo Avançado"),
    ("11","Ponta de Lança");

INSERT INTO `FuteProject`.`Clube`
    (id,designacao)
VALUES
    ("01","FC Porto"),
    ("02","Juventus"),
    ("03","Wolves"),
    ("04","Liverpool"),
    ("05","Barcelona"),
    ("06","Real Madrid"),
    ("07","Lyon"),
    ("08","Dortmund"),
    ("09","Atlético Madrid"),
    ("10","AC Milan"),
    ("11","Manchester United"),
    ("12","Everton"),
    ("13","PSG"),
    ("14","FC Porto B"),
    ("15","Famalicão"),
    ("16","Académica");

INSERT INTO `FuteProject`.`País`
    (id,designacao)
VALUES
    ("01","Portugal"),
    ("02","México"),
    ("03","Máli"),
    ("04","Inglaterra"),
    ("05","Alemanha"),
    ("06","Holanda"),
    ("07","Noruega"),
    ("08","Espanha"),
    ("09","Suécia"),
    ("10","França"),
    ("11","Colômbia"),
    ("12","Argentina"),
    ("13","Brasil");

INSERT INTO `FuteProject`.`Nacionalidade`
    (id,designacao)
VALUES
    ("01","português"),
    ("02","mexicano"),
    ("03","maliano"),
    ("04","inglês"),
    ("05","alemão"),
    ("06","holandês"),
    ("07","noruegues"),
    ("08","espanhol"),
    ("09","sueco"),
    ("10","francês"),
    ("11","colombiano"),
    ("12","argentino"),
    ("13","brasileiro");


INSERT INTO `FuteProject`.`Localidade`
    (id,designacao,País_id)
VALUES
    ("01","Madeira","01"),
    ("02","Hermosillo","02"),
    ("03","Santa Maria da Feira","01"),
    ("04","Porto","01"),
    ("05","Les Ullis","03"),
    ("06","Liverpool","04"),
    ("07","Monchengladbach","05"),
    ("08","Sevilla","08"),
    ("09","Moordrecht","06"),
    ("10","Leeds","04"),
    ("11","Viseu","01"),
    ("12","Breda","06"),
    ("13","Malmo","09"),
    ("14","Lagny-sur-Marne","10"),
    ("15","Cucuta","11"),
    ("16","Rosario","12"),
    ("17","Barcelos","01"),
    ("18","Famalicão","01"),
    ("19","Aveiro","01"),
    ("20","São Paulo","13"),
    ("21","Londres","04"),
    ("22","Amsterdão","06"),
    ("23","Lisboa","01"),
    ("24","Braga","01");

INSERT INTO `FuteProject`.`Agente`
    (id,data_nascimento,idade,nome,reputacao,telefone,email,Nacionalidade_id)
VALUES
    ("01","1966-01-07","54","Jorge Mendes","10","931238129","jorgemendes@gmail.com","01"),
    ("02","1985-09-23","35","Valério Sousa","8","912934726","valeriosousa@gmail.com","01"),
    ("03","1976-03-11","44","Gilson Ribeiro","7","921353172","gilson76ribeiro@gmail.com","13"),
    ("04","1980-02-28","40","Hipólito Crispim","8","912645859","hipocrispo@gmail.com","01"),
    ("05","1985-11-09","35","John Blake","9","912276645","j_blake@gmail.com","04"),
    ("06","1960-11-30","60","Mino Raiola","6","917639758","mraiola@gmail.com","06");

INSERT INTO `FuteProject`.`Olheiro`
    (id,nome,data_nascimento,idade,reputacao,telefone,Nacionalidade_id)
VALUES
    ("01","Aurélio Pereira","1975-05-15","45","8","963838381","01"),
    ("02","Rod Ruddick","1989-12-27","31","7","933728983","04"),
    ("03","Gilmar Francisco","1970-01-03","50","9","923609390","13"),
    ("04","Ricardo Bochini","1983-06-19","37","8","910293930","02"),
    ("05","Rafa Monfort","1981-09-23","39","6","951938128","08");

-- ECT * FROM `FuteProject`.`Jogador`;
INSERT INTO `FuteProject`.`Jogador`
    (id,nome,data_nascimento,idade,altura,nr_internacionalizacoes,valor_mercado,reputacao,golos_marcados,Tipo_id,Posicao_id,Clube_id,Localidade_id,Nacionalidade_id,Agente_id,Olheiro_id,avaliacao,comentario,fim_contrato,inicio_contrato)
VALUES
    ("01","Cristiano Ronaldo","1985-02-05","35","187","204","60","97","89","01","08","02","01","01","01","01","10","Melhor de todos os tempos","2023-07-15","2018-07-13"),
    ("02","Jesús Corona","1993-01-06","27","173","42","30","89","49","01","09","01","02","02","02","02",null,null,"2021-09-13","2016-10-25"),
    ("03","Rúben Neves","1997-03-13","23","180","18","50","91","110","01","05","03","03","01","03","03",null,null,"2022-08-29","2017-06-29"),
    ("04","Fábio Silva","2002-07-19","18","185","0","25","78","67","01","11","03","04","01","04","04",null,null,"2024-07-18","2020-07-15"),
    ("05","Moussa Marega","1991-04-14","29","183","24","100","89","89","01","10","01","05","03","05","05","10","Um bocado melhor que o Ronaldo","2021-09-15","2017-07-29"),
    ("06","Trent Alexander-Arnold","1998-10-07","22","180","12","110","93","12","01","04","04","06","04","06","01",null,null,"2021-09-19","2015-06-14"),
    ("07","Marc-André ter Stegen","1992-04-30","28","187","24","75","95","0","01","01","05","07","05","01","02",null,null,"2022-07-13","2014-07-17"),
    ("08","Sérgio Ramos","1986-03-30","34","184","178","14","95","95","01","03","06","08","08","02","03",null,null,"2023-08-04","2013-08-14"),
    ("09","Memphis Depay","1994-02-13","26","176","54","45","83","120","01","08","07","09","06","03","04",null,null,"2021-09-02","2014-08-12"),
    ("10","Erling Haaland","2000-07-21","20","194","7","100","90","80","01","11","08","10","07","04","05",null,null,"2024-08-19","2020-01-10"),
    ("11","João Félix","1999-11-10","21","180","11","100","85","48","01","10","09","11","01","05","01",null,null,"2023-09-14","2019-08-05"),
    ("12","Virgil Van Djik","1991-07-08","29","193","34","80","96","43","01","03","04","12","06","06","02",null,null,"2021-09-09","2017-08-14"),
    ("13","Zlatan Ibrahimovic","1981-10-03","39","195","116","3","81","45","01","11","10","13","09","01","03","9","Nada a apontar. Todos conhecem o Zlatan","2021-09-13","2019-07-03"),
    ("14","Paul Pogba","1993-03-15","27","191","74","80","93","67","01","06","11","14","10","02","04",null,null,"2021-10-01","2018-09-14"),
    ("15","James Rodriguez","1991-07-12","29","181","76","35","85","79","01","07","12","15","11","03","05",null,null,"2021-08-13","2018-09-05"),
    ("16","Ángel Di Maria","1988-02-14","32","180","102","32","84","128","01","09","13","16","12","04","01",null,null,"2021-06-29","2018-07-30"),
    ("17","Gonçalo Almeida","2000-05-19","20","186","0","5","70","15","02","11","14","17","01",null,"02","5","Melhor jogador que já passou pelo Arrentela","2021-09-13","2019-10-02"),
    ("18","Diogo Amaro","2000-06-26","20","193","0","3","69","0","02","01","15","18","01",null,"03",null,null,"2022-10-01","2018-08-06"),
    ("19","Luís Pereira","2000-06-21","20","190","0","3","65","2","02","02","01","17","01",null,"04",null,null,"2021-06-29","2019-08-13"),
    ("20","Leonardo Marreiros","2000-12-05","19","183","0","3","68","5","02","09","16","19","01",null,"05",null,null,"2021-06-25","2019-09-16");



INSERT INTO `FuteProject`.`Clube_anterior`
    (id,designacao)
VALUES
    ("01","Manchester United"),
    ("02","Real Madrid"),
    ("03","Sporting"),
    ("04","Southampton"),
    ("05","Celtic"),
    ("06","FC Porto"),
    ("07","PSV"),
    ("08","Juventus"),
    ("09","Salzburg"),
    ("10","PSG"),
    ("11","AC Milan"),
    ("12","Barcelona"),
    ("13","Inter"),
    ("14","Benfica"),
    ("15","Monaco"),
    ("16","Bayern"),
    ("17","Sevilla"),
    ("18","Liverpool Formation"),
    ("19","Twente"),
    ("20","Monterrey"),
    ("21","Marítimo"),
    ("22","Vitória SC"),
    ("23","Amiens SC"),
    ("24","Monchengladbach");

INSERT INTO `FuteProject`.`Historico_clubes`
    (Jogador_id,Clube_anterior_id,fim_contrato,inicio_contrato,golos,reputacao)
VALUES
    ("01","01","2009-07-01","2003-08-12","118","80"),
    ("01","02","2018-07-13","2009-07-01","408","95"),
    ("01","03","2003-08-12","1998-08-14","10","65"),
    ("02","19","2016-10-25","2013-06-08","15","60"),
    ("02","20","2013-06-08","2009-07-14","7","57"),
    ("03","06","2017-06-29","2014-07-14","8","60"),
    ("04","06","2020-07-15","2018-07-14","2","65"),
    ("05","21","2017-07-29","2015-07-13","18","65"),
    ("05","22","2015-07-13","2014-06-14","13","65"),
    ("05","23","2014-06-14","2012-07-20","9","55"),
    ("06","18","2015-06-14","2010-07-13","5","40"),
    ("07","24","2014-07-17","2010-08-19","1","60"),
    ("08","17","2013-08-14","2009-07-14","6","65"),
    ("09","01","2018-07-09","2014-08-12","15","60"),
    ("09","07","2014-08-12","2010-09-09","10","50"),
    ("10","09","2020-01-10","2017-07-27","29","70"),
    ("11","14","2019-08-05","2018-09-18","14","70"),
    ("12","04","2017-08-14","2015-09-02","4","50"),
    ("12","05","2015-09-02","2012-08-14","1","40"),
    ("13","13","2013-07-14","2009-08-15","26","65"),
    ("13","12","2015-08-10","2013-07-14","14","70"),
    ("13","11","2017-09-28","2015-08-10","28","70"),
    ("13","08","2009-08-15","2006-07-17","14","60"),
    ("13","10","2019-07-03","2017-09-28","80","80"),
    ("14","08","2018-09-14","2013-08-08","31","75"),
    ("15","06","2013-07-23","2008-09-25","16","70"),
    ("15","15","2015-08-27","2013-07-23","19","75"),
    ("15","02","2018-09-05","2015-08-27","13","75"),
    ("16","14","2014-07-29","2010-09-07","37","70"),
    ("16","02","2017-09-01","2014-07-29","23","75"),
    ("16","01","2018-07-30","2017-09-01","9","70");
