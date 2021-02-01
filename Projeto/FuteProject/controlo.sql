USE FUTEPROJECT;

CREATE ROLE Agentes;
CREATE ROLE Olheiros;

### Agente
Grant SELECT,UPDATE,INSERT ON FuteProject.* TO Agentes;
Grant EXECUTE ON PROCEDURE FUTEPROJECT.addClubeAnterior TO Agentes;
Grant EXECUTE ON PROCEDURE FUTEPROJECT.addHistorico_clube TO Agentes;
Grant EXECUTE ON PROCEDURE FUTEPROJECT.criaclube TO Agentes;
Grant EXECUTE ON PROCEDURE FUTEPROJECT.resetaDadosJogador TO Agentes;
Grant EXECUTE ON PROCEDURE FUTEPROJECT.alteraStatusJogador TO Agentes;
Grant EXECUTE ON PROCEDURE FUTEPROJECT.adicionaJogador TO Agentes;
Grant EXECUTE ON PROCEDURE FUTEPROJECT.removeJogador TO Agentes;
Grant EXECUTE ON PROCEDURE FUTEPROJECT.recrutarJovemPromessa TO Agentes;
Grant EXECUTE ON PROCEDURE FUTEPROJECT.addLocalidade TO Agentes;
Grant EXECUTE ON PROCEDURE FUTEPROJECT.addPais TO Agentes;
Grant EXECUTE ON PROCEDURE FUTEPROJECT.addNacionalidade TO Agentes;

### Olheiro
Grant INSERT, SELECT ON FuteProject.* TO Olheiros;
Grant EXECUTE ON PROCEDURE FUTEPROJECT.adicionaJovemPromessa TO Olheiros;
Grant EXECUTE ON PROCEDURE FUTEPROJECT.addLocalidade TO Olheiros;
Grant EXECUTE ON PROCEDURE FUTEPROJECT.addPais TO Olheiros;
Grant EXECUTE ON PROCEDURE FUTEPROJECT.addNacionalidade TO Olheiros;
##

CREATE USER 'Jorge_Mendes'@'localhost' IDENTIFIED BY 'Jorge_mendes';
GRANT Agentes to 'Jorge_Mendes'@'localhost';

CREATE USER 'Aurelio Pereira'@'localhost' IDENTIFIED BY 'Aurelio_Pereira';
GRANT Olheiro to 'Aurelio Pereira'@'localhost';
