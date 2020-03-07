-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `mydb`.`news`  -- OK
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `news` (
  `idnew` INT NOT NULL,
  `topic_key` VARCHAR(80) NOT NULL,
  `date` VARCHAR(10) NOT NULL DEFAULT '24-12-2023',
  `location1` TINYINT NOT NULL DEFAULT '1',
  `location2` TINYINT NOT NULL DEFAULT '1',
  `video_img` VARCHAR(200) NULL DEFAULT NULL,
  `video_url` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`idnew`)
  );


-- -----------------------------------------------------
-- Table `news_text_types` -- Ok
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `news_text_types` (
  `text_type_id` INT NOT NULL,
  `type_name` VARCHAR(255) NOT NULL,
  `type_code` VARCHAR(50) NOT NULL DEFAULT 'p',
  PRIMARY KEY (`text_type_id`));


-- -----------------------------------------------------
-- Table `news_cat` -- OK
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`news_cat` (
  `id_text_cat` INT NOT NULL,
  `order` INT NOT NULL DEFAULT '0',
  `text` VARCHAR(1000) NOT NULL,
  `news_fk` INT NOT NULL,
  `text_types_fk` INT NOT NULL,
  PRIMARY KEY (`id_text_cat`, `news_fk`, `text_types_fk`),
  UNIQUE INDEX `order_UNIQUE` (`order` ASC) VISIBLE,
  INDEX `fk_news_text_cat_text_types1_idx` (`text_types_fk` ASC) VISIBLE,
  INDEX `fk_news_text_cat_news1_idx` (`news_fk` ASC) VISIBLE,
  CONSTRAINT `fk_news_text_cat_news1`
    FOREIGN KEY (`news_fk`)
    REFERENCES `mydb`.`news` (`idnew`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_news_cat_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `mydb`.`news_text_types` (`text_type_id`));


-- -----------------------------------------------------
-- Table `mydb`.`news_eng` -- OK
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `news_eng` (
  `id_text_eng` INT NOT NULL,
  `order` INT NOT NULL DEFAULT '0',
  `text` VARCHAR(1000) NOT NULL,
  `news_fk` INT NOT NULL,
  `text_types_fk` INT NOT NULL,
  PRIMARY KEY (`id_text_eng`, `news_fk`, `text_types_fk`),
  CONSTRAINT `fk_news_text_eng_news1`
    FOREIGN KEY (`news_fk`)
    REFERENCES `news` (`idnew`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_news_text_eng_text_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `news_text_types` (`text_type_id`));


-- -----------------------------------------------------
-- Table `news_eus` -- Ok
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `news_eus` (
  `id_text_eus` INT NOT NULL,
  `order` INT NOT NULL DEFAULT '0',
  `text` VARCHAR(1000) NOT NULL,
  `news_fk` INT NOT NULL,
  `text_types_fk` INT NOT NULL,
  PRIMARY KEY (`id_text_eus`, `news_fk`, `text_types_fk`),
  CONSTRAINT `fk_news_text_eus_news1`
    FOREIGN KEY (`news_fk`)
    REFERENCES `news` (`idnew`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_news_text_eus_text_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `news_text_types` (`text_type_id`));


-- -----------------------------------------------------
-- Table `news_glg` -- Ok
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `news_glg` (
  `id_text_glg` INT NOT NULL,
  `order` INT NOT NULL DEFAULT '0',
  `text` VARCHAR(1000) NOT NULL,
  `news_fk` INT NOT NULL,
  `text_types_fk` INT NOT NULL,
  PRIMARY KEY (`id_text_glg`, `news_fk`, `text_types_fk`),
  CONSTRAINT `fk_news_text_glg_news1`
    FOREIGN KEY (`news_fk`)
    REFERENCES `news` (`idnew`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_news_text_glg_text_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `news_text_types` (`text_type_id`));


-- -----------------------------------------------------
-- Table `mydb`.`news_spa`  -- Ok
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `news_spa` (
  `id_text_spa` INT NOT NULL,
  `order` INT NOT NULL DEFAULT '0',
  `text` VARCHAR(1000) NOT NULL,
  `news_fk` INT NOT NULL,
  `text_types_fk` INT NOT NULL,
  PRIMARY KEY (`id_text_spa`, `news_fk`, `text_types_fk`),
  CONSTRAINT `fk_news_text_spa_news1`
    FOREIGN KEY (`news_fk`)
    REFERENCES `news` (`idnew`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_news_text_spa_text_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `news_text_types` (`text_type_id`));


-- -----------------------------------------------------
-- Table `tips` -- Ok
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tips` (
  `idTips` INT NOT NULL,
  `id` VARCHAR(50) NOT NULL,
  `location1` INT(1) NOT NULL,
  `location2` INT(1) NOT NULL,
  PRIMARY KEY (`idTips`),
  UNIQUE (`id` ASC) );


-- -----------------------------------------------------
-- Table `related_new_items` -- Ok
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `related_new_items` (
  `idrelated_new_items` INT NOT NULL,
  `source_new_fk` INT NOT NULL,
  `target_new_fk` INT NULL DEFAULT NULL,
  `target_tip_fk` INT NULL,
  PRIMARY KEY (`idrelated_new_items`),
  CONSTRAINT `new_source_fk`
    FOREIGN KEY (`source_new_fk`)
    REFERENCES `news` (`idnew`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `new_target_fk`
    FOREIGN KEY (`target_new_fk`)
    REFERENCES `news` (`idnew`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `tips_target_fk`
    FOREIGN KEY (`target_tip_fk`)
    REFERENCES `tips` (`idTips`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `tags` -- Ok
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tags` (
  `idtags` INT NOT NULL,
  `order` INT NOT NULL,
  `text_cat` VARCHAR(45) NULL,
  `text_eng` VARCHAR(45) NULL,
  `text_eus` VARCHAR(45) NULL,
  `text_glg` VARCHAR(45) NULL,
  `text_spa` VARCHAR(45) NULL,
  `news_fk` INT NOT NULL,
  PRIMARY KEY (`idtags`),
  CONSTRAINT `fk_tags_news`
    FOREIGN KEY (`news_fk`)
    REFERENCES `news` (`idnew`));


-- -----------------------------------------------------
-- Table `tip_text_types` -- Ok
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tip_text_types` (
  `idtiptexttypes` INT NOT NULL,
  `type_name` VARCHAR(100) NULL,
  `type_code` VARCHAR(50) NULL,
  PRIMARY KEY (`idtiptexttypes`));


-- -----------------------------------------------------
-- Table `tips_spa` -- Ok
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tips_spa` (
  `idtips` INT NOT NULL,
  `tips_idTips` INT NOT NULL,
  `tip_text_fk` INT NOT NULL,
  `order` INT NOT NULL DEFAULT 0,
  `text` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`idtips`, `tips_idTips`, `tip_text_fk`),
  CONSTRAINT `fk_tips_spa_tips1`
    FOREIGN KEY (`tips_idTips`)
    REFERENCES `tips` (`idTips`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tips_spa_tip_text_types1`
    FOREIGN KEY (`tip_text_fk`)
    REFERENCES `tip_text_types` (`idtiptexttypes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `tips_cat` -- Ok
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tips_cat` (
  `idtips` INT NOT NULL,
  `tips_fk` INT NOT NULL,
  `text_types_fk` INT NOT NULL,
  `order` INT NOT NULL DEFAULT 0,
  `text` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`idtips`, `tips_fk`, `text_types_fk`),
  CONSTRAINT `fk_tips_cat_tips1`
    FOREIGN KEY (`tips_fk`)
    REFERENCES `tips` (`idTips`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tips_cat_tip_text_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `tip_text_types` (`idtiptexttypes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `tips_eng`  -- Ok
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tips_eng` (
  `idtips` INT NOT NULL,
  `tips_fk` INT NOT NULL,
  `text_types_fk` INT NOT NULL,
  `order` INT NOT NULL DEFAULT 0,
  `text` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`idtips`, `tips_fk`, `text_types_fk`),
  CONSTRAINT `fk_tips_eng_tips1`
    FOREIGN KEY (`tips_fk`)
    REFERENCES `tips` (`idTips`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tips_eng_tip_text_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `tip_text_types` (`idtiptexttypes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`tips_eus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tips_eus` (
  `idtips` INT NOT NULL COMMENT 'Primary key',
  `tips_fk` INT NOT NULL,
  `text_types_fk` INT NOT NULL,
  `order` INT NOT NULL DEFAULT 0,
  `text` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`idtips`, `tips_fk`, `text_types_fk`),
  INDEX `fk_tips_eus_tips1_idx` (`tips_fk` ASC) VISIBLE,
  INDEX `fk_tips_eus_tip_text_types1_idx` (`text_types_fk` ASC) VISIBLE,
  CONSTRAINT `fk_tips_eus_tips1`
    FOREIGN KEY (`tips_fk`)
    REFERENCES `mydb`.`tips` (`idTips`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tips_eus_tip_text_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `mydb`.`tip_text_types` (`idtiptexttypes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Security tips';


-- -----------------------------------------------------
-- Table `mydb`.`tips_glg`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tips_glg` (
  `idtips` INT NOT NULL COMMENT 'Primary key',
  `tips_fk` INT NOT NULL,
  `tip_text_fk` INT NOT NULL,
  `order` INT NOT NULL DEFAULT 0,
  `text` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`idtips`, `tips_fk`, `tip_text_fk`),
  INDEX `fk_tips_glg_tips1_idx` (`tips_fk` ASC) VISIBLE,
  INDEX `fk_tips_glg_tip_text_types1_idx` (`tip_text_fk` ASC) VISIBLE,
  CONSTRAINT `fk_tips_glg_tips1`
    FOREIGN KEY (`tips_fk`)
    REFERENCES `mydb`.`tips` (`idTips`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tips_glg_tip_text_types1`
    FOREIGN KEY (`tip_text_fk`)
    REFERENCES `mydb`.`tip_text_types` (`idtiptexttypes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Texts in Gallego';


-- -----------------------------------------------------
-- Table `mydb`.`glossary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`glossary` (
  `idglossary` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `location1` INT NULL,
  `location2` INT NULL,
  PRIMARY KEY (`idglossary`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`synonyms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`synonyms` (
  `idsynonym` INT NOT NULL,
  `order` INT NOT NULL,
  `text_cat` VARCHAR(45) NULL COMMENT 'Tags related with the new.',
  `text_eng` VARCHAR(45) NULL,
  `text_eus` VARCHAR(45) NULL,
  `text_glg` VARCHAR(45) NULL,
  `text_spa` VARCHAR(45) NULL,
  `glossary_fk` INT NOT NULL,
  PRIMARY KEY (`idsynonym`),
  INDEX `fk_tags_news0_idx` (`glossary_fk` ASC) VISIBLE,
  CONSTRAINT `glossary_synonym_fk`
    FOREIGN KEY (`glossary_fk`)
    REFERENCES `mydb`.`glossary` (`idglossary`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Tags to relationships';


-- -----------------------------------------------------
-- Table `mydb`.`glossary_text_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`glossary_text_types` (
  `idglossary_text_types` INT NOT NULL,
  `type_name` VARCHAR(200) NULL,
  `type_code` VARCHAR(45) NULL,
  PRIMARY KEY (`idglossary_text_types`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`glossary_cat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`glossary_cat` (
  `idglossary_cat` INT NOT NULL,
  `glossary_fk` INT NOT NULL,
  `text_types_fk` INT NOT NULL,
  `order` INT NOT NULL,
  `text` VARCHAR(800) NOT NULL,
  PRIMARY KEY (`idglossary_cat`, `glossary_fk`, `text_types_fk`),
  INDEX `fk_glossary_cat_glossary1_idx` (`glossary_fk` ASC) VISIBLE,
  INDEX `fk_glossary_cat_glossary_text_types1_idx` (`text_types_fk` ASC) VISIBLE,
  CONSTRAINT `fk_glossary_cat_glossary1`
    FOREIGN KEY (`glossary_fk`)
    REFERENCES `mydb`.`glossary` (`idglossary`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glossary_cat_glossary_text_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `mydb`.`glossary_text_types` (`idglossary_text_types`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`glossary_eng`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`glossary_eng` (
  `idglossary_eng` INT NOT NULL,
  `glossary_fk` INT NOT NULL,
  `order` INT NOT NULL,
  `text` VARCHAR(800) NOT NULL,
  `text_type_fk` INT NOT NULL,
  PRIMARY KEY (`idglossary_eng`, `glossary_fk`, `text_type_fk`),
  INDEX `fk_glossary_cat_glossary1_idx` (`glossary_fk` ASC) VISIBLE,
  INDEX `fk_glossary_eng_glossary_text_types1_idx` (`text_type_fk` ASC) VISIBLE,
  CONSTRAINT `fk_glossary_cat_glossary10`
    FOREIGN KEY (`glossary_fk`)
    REFERENCES `mydb`.`glossary` (`idglossary`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glossary_eng_glossary_text_types1`
    FOREIGN KEY (`text_type_fk`)
    REFERENCES `mydb`.`glossary_text_types` (`idglossary_text_types`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`glossary_eus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`glossary_eus` (
  `idglossary_eus` INT NOT NULL,
  `glossary_fk` INT NOT NULL,
  `text_type_fk` INT NOT NULL,
  `order` INT NOT NULL,
  `text` VARCHAR(800) NOT NULL,
  PRIMARY KEY (`idglossary_eus`, `glossary_fk`, `text_type_fk`),
  INDEX `fk_glossary_cat_glossary1_idx` (`glossary_fk` ASC) VISIBLE,
  INDEX `fk_glossary_eus_glossary_text_types1_idx` (`text_type_fk` ASC) VISIBLE,
  CONSTRAINT `fk_glossary_cat_glossary100`
    FOREIGN KEY (`glossary_fk`)
    REFERENCES `mydb`.`glossary` (`idglossary`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glossary_eus_glossary_text_types1`
    FOREIGN KEY (`text_type_fk`)
    REFERENCES `mydb`.`glossary_text_types` (`idglossary_text_types`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`glossary_glg`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`glossary_glg` (
  `idglossary_glg` INT NOT NULL,
  `glossary_fk` INT NOT NULL,
  `text_type_fk` INT NOT NULL,
  `order` INT NOT NULL,
  `text` VARCHAR(800) NOT NULL,
  PRIMARY KEY (`idglossary_glg`, `glossary_fk`, `text_type_fk`),
  INDEX `fk_glossary_cat_glossary1_idx` (`glossary_fk` ASC) VISIBLE,
  INDEX `fk_glossary_glg_glossary_text_types1_idx` (`text_type_fk` ASC) VISIBLE,
  CONSTRAINT `fk_glossary_cat_glossary1000`
    FOREIGN KEY (`glossary_fk`)
    REFERENCES `mydb`.`glossary` (`idglossary`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glossary_glg_glossary_text_types1`
    FOREIGN KEY (`text_type_fk`)
    REFERENCES `mydb`.`glossary_text_types` (`idglossary_text_types`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`glossary_spa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`glossary_spa` (
  `idglossary_spa` INT NOT NULL,
  `glossary_fk` INT NOT NULL,
  `text_type_fk` INT NOT NULL,
  `order` INT NOT NULL,
  `text` VARCHAR(800) NOT NULL,
  PRIMARY KEY (`idglossary_spa`, `glossary_fk`, `text_type_fk`),
  INDEX `fk_glossary_cat_glossary1_idx` (`glossary_fk` ASC) VISIBLE,
  INDEX `fk_glossary_spa_glossary_text_types1_idx` (`text_type_fk` ASC) VISIBLE,
  CONSTRAINT `fk_glossary_cat_glossary10000`
    FOREIGN KEY (`glossary_fk`)
    REFERENCES `mydb`.`glossary` (`idglossary`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glossary_spa_glossary_text_types1`
    FOREIGN KEY (`text_type_fk`)
    REFERENCES `mydb`.`glossary_text_types` (`idglossary_text_types`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
