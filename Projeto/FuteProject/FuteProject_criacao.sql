-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema FuteProject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FuteProject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FuteProject` DEFAULT CHARACTER SET utf8 ;
USE `FuteProject` ;

-- -----------------------------------------------------
-- Table `FuteProject`.`Tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FuteProject`.`Tipo` (
  `id` INT NOT NULL,
  `designacao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FuteProject`.`Posicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FuteProject`.`Posicao` (
  `id` INT NOT NULL,
  `designacao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FuteProject`.`Clube`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FuteProject`.`Clube` (
  `id` INT NOT NULL,
  `designacao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FuteProject`.`País`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FuteProject`.`País` (
  `id` INT NOT NULL,
  `nacionalidade` VARCHAR(45) NULL,
  `designacao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FuteProject`.`Localidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FuteProject`.`Localidade` (
  `id` INT NOT NULL,
  `designacao` VARCHAR(45) NULL,
  `País_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Localidade_País1_idx` (`País_id` ASC) VISIBLE,
  CONSTRAINT `fk_Localidade_País1`
    FOREIGN KEY (`País_id`)
    REFERENCES `FuteProject`.`País` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FuteProject`.`Nacionalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FuteProject`.`Nacionalidade` (
  `id` INT NOT NULL,
  `designacao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FuteProject`.`Agente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FuteProject`.`Agente` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `data_nascimento` DATE NULL,
  `idade` INT NULL,
  `reputacao` INT NULL,
  `telefone` VARCHAR(9) NULL,
  `email` VARCHAR(75) NULL,
  `Nacionalidade_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Agente_Nacionalidade1_idx` (`Nacionalidade_id` ASC) VISIBLE,
  CONSTRAINT `fk_Agente_Nacionalidade1`
    FOREIGN KEY (`Nacionalidade_id`)
    REFERENCES `FuteProject`.`Nacionalidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FuteProject`.`Olheiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FuteProject`.`Olheiro` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `data_nascimento` DATE NULL,
  `idade` INT NULL,
  `reputacao` INT NULL,
  `telefone` VARCHAR(9) NULL,
  `Nacionalidade_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Olheiro_Nacionalidade1_idx` (`Nacionalidade_id` ASC) VISIBLE,
  CONSTRAINT `fk_Olheiro_Nacionalidade1`
    FOREIGN KEY (`Nacionalidade_id`)
    REFERENCES `FuteProject`.`Nacionalidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FuteProject`.`Jogador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FuteProject`.`Jogador` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `data_nascimento` DATE NULL,
  `idade` INT NULL,
  `altura` INT NULL,
  `nr_internacionalizacoes` INT NULL,
  `valor_mercado` DECIMAL(5,2) NULL,
  `reputacao` INT NULL,
  `golos_marcados` INT NULL,
  `Tipo_id` INT NOT NULL,
  `Posicao_id` INT NOT NULL,
  `Clube_id` INT NOT NULL,
  `Localidade_id` INT NOT NULL,
  `Nacionalidade_id` INT NOT NULL,
  `Agente_id` INT NULL,
  `Olheiro_id` INT NOT NULL,
  `avaliacao` INT NULL,
  `comentario` VARCHAR(45) NULL,
  `fim_contrato` DATE NOT NULL,
  `inicio_contrato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Jogador_Tipo1_idx` (`Tipo_id` ASC) VISIBLE,
  INDEX `fk_Jogador_Posicao1_idx` (`Posicao_id` ASC) VISIBLE,
  INDEX `fk_Jogador_Clube1_idx` (`Clube_id` ASC) VISIBLE,
  INDEX `fk_Jogador_Localidade1_idx` (`Localidade_id` ASC) VISIBLE,
  INDEX `fk_Jogador_Agente1_idx` (`Agente_id` ASC) VISIBLE,
  INDEX `fk_Jogador_Nacionalidade1_idx` (`Nacionalidade_id` ASC) VISIBLE,
  INDEX `fk_Jogador_Olheiro1_idx` (`Olheiro_id` ASC) VISIBLE,
  CONSTRAINT `fk_Jogador_Tipo1`
    FOREIGN KEY (`Tipo_id`)
    REFERENCES `FuteProject`.`Tipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogador_Posicao1`
    FOREIGN KEY (`Posicao_id`)
    REFERENCES `FuteProject`.`Posicao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogador_Clube1`
    FOREIGN KEY (`Clube_id`)
    REFERENCES `FuteProject`.`Clube` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogador_Localidade1`
    FOREIGN KEY (`Localidade_id`)
    REFERENCES `FuteProject`.`Localidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogador_Agente1`
    FOREIGN KEY (`Agente_id`)
    REFERENCES `FuteProject`.`Agente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogador_Nacionalidade1`
    FOREIGN KEY (`Nacionalidade_id`)
    REFERENCES `FuteProject`.`Nacionalidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogador_Olheiro1`
    FOREIGN KEY (`Olheiro_id`)
    REFERENCES `FuteProject`.`Olheiro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FuteProject`.`Clube_anterior`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FuteProject`.`Clube_anterior` (
  `id` INT NOT NULL,
  `designacao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FuteProject`.`Historico_clubes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FuteProject`.`Historico_clubes` (
  `Jogador_id` INT NOT NULL,
  `Clube_anterior_id` INT NOT NULL,
  `fim_contrato` DATE NOT NULL,
  `inicio_contrato` DATE NOT NULL,
  `golos` INT NOT NULL,
  `reputacao` INT NOT NULL,
  INDEX `fk_Jogador_has_Historico_clubes_Historico_clubes1_idx` (`Clube_anterior_id` ASC) VISIBLE,
  INDEX `fk_Jogador_has_Historico_clubes_Jogador1_idx` (`Jogador_id` ASC) VISIBLE,
  CONSTRAINT `fk_Jogador_has_Historico_clubes_Jogador1`
    FOREIGN KEY (`Jogador_id`)
    REFERENCES `FuteProject`.`Jogador` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogador_has_Historico_clubes_Historico_clubes1`
    FOREIGN KEY (`Clube_anterior_id`)
    REFERENCES `FuteProject`.`Clube_anterior` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
