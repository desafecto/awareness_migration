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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`news`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`news` (
  `idnew` INT NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `topic_key` VARCHAR(80) NOT NULL,
  `date` VARCHAR(10) NOT NULL DEFAULT '24-12-2023' COMMENT 'News date as string \"DD-MM-YYYY\" format',
  `location1` TINYINT NOT NULL DEFAULT '1' COMMENT 'Dashboard location',
  `location2` TINYINT NOT NULL DEFAULT '1' COMMENT 'List location',
  `video_img` VARCHAR(200) NULL DEFAULT NULL COMMENT 'URL of the static video miage.',
  `video_url` VARCHAR(200) NULL DEFAULT NULL COMMENT 'Youtube link',
  PRIMARY KEY (`idnew`),
  UNIQUE INDEX `topic_key_UNIQUE` (`topic_key` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8
COMMENT = 'News';


-- -----------------------------------------------------
-- Table `mydb`.`news_text_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`news_text_types` (
  `text_type_id` INT NOT NULL COMMENT 'Primary key',
  `type_name` VARCHAR(255) NOT NULL COMMENT 'Text type name',
  `type_code` VARCHAR(50) NOT NULL DEFAULT 'p' COMMENT 'Text type code',
  PRIMARY KEY (`text_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'The set of diferent types of txt:\\n- paragraph\\n- bullet\\n- title\\n- description';


-- -----------------------------------------------------
-- Table `mydb`.`news_cat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`news_cat` (
  `id_text_cat` INT NOT NULL COMMENT 'Primary key',
  `order` INT NOT NULL DEFAULT '0' COMMENT 'text order',
  `text` VARCHAR(1000) NOT NULL COMMENT 'paragrph or bullet text',
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
  CONSTRAINT `fk_news_text_cat_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `mydb`.`news_text_types` (`text_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Content texts in catalan languaje';


-- -----------------------------------------------------
-- Table `mydb`.`news_eng`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`news_eng` (
  `id_text_eng` INT NOT NULL COMMENT 'Primary key',
  `order` INT NOT NULL DEFAULT '0' COMMENT 'text order',
  `text` VARCHAR(1000) NOT NULL COMMENT 'paragraph, bullet.. and so one type of text',
  `news_fk` INT NOT NULL,
  `text_types_fk` INT NOT NULL,
  PRIMARY KEY (`id_text_eng`, `news_fk`, `text_types_fk`),
  UNIQUE INDEX `order_UNIQUE` (`order` ASC) VISIBLE,
  INDEX `fk_news_text_eng_text_types1_idx` (`text_types_fk` ASC) VISIBLE,
  INDEX `fk_news_text_eng_news1_idx` (`news_fk` ASC) VISIBLE,
  CONSTRAINT `fk_news_text_eng_news1`
    FOREIGN KEY (`news_fk`)
    REFERENCES `mydb`.`news` (`idnew`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_news_text_eng_text_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `mydb`.`news_text_types` (`text_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Content texts in English languaje';


-- -----------------------------------------------------
-- Table `mydb`.`news_eus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`news_eus` (
  `id_text_eus` INT NOT NULL COMMENT 'Primary key',
  `order` INT NOT NULL DEFAULT '0' COMMENT 'text order',
  `text` VARCHAR(1000) NOT NULL COMMENT 'paragraph, bullet.. and so one type of text',
  `news_fk` INT NOT NULL,
  `text_types_fk` INT NOT NULL,
  PRIMARY KEY (`id_text_eus`, `news_fk`, `text_types_fk`),
  UNIQUE INDEX `order_UNIQUE` (`order` ASC) VISIBLE,
  INDEX `fk_news_text_eus_text_types1_idx` (`text_types_fk` ASC) VISIBLE,
  INDEX `fk_news_text_eus_news1_idx` (`news_fk` ASC) VISIBLE,
  CONSTRAINT `fk_news_text_eus_news1`
    FOREIGN KEY (`news_fk`)
    REFERENCES `mydb`.`news` (`idnew`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_news_text_eus_text_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `mydb`.`news_text_types` (`text_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Content texts in Euskera languaje';


-- -----------------------------------------------------
-- Table `mydb`.`news_glg`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`news_glg` (
  `id_text_glg` INT NOT NULL COMMENT 'Primary key',
  `order` INT NOT NULL DEFAULT '0' COMMENT 'text order',
  `text` VARCHAR(1000) NOT NULL COMMENT 'paragraph, bullet.. and so one type of text',
  `news_fk` INT NOT NULL,
  `text_types_fk` INT NOT NULL,
  PRIMARY KEY (`id_text_glg`, `news_fk`, `text_types_fk`),
  UNIQUE INDEX `order_UNIQUE` (`order` ASC) VISIBLE,
  INDEX `fk_news_text_glg_text_types1_idx` (`text_types_fk` ASC) VISIBLE,
  INDEX `fk_news_text_glg_news1_idx` (`news_fk` ASC) VISIBLE,
  CONSTRAINT `fk_news_text_glg_news1`
    FOREIGN KEY (`news_fk`)
    REFERENCES `mydb`.`news` (`idnew`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_news_text_glg_text_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `mydb`.`news_text_types` (`text_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Content texts in Galego languaje';


-- -----------------------------------------------------
-- Table `mydb`.`news_spa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`news_spa` (
  `id_text_spa` INT NOT NULL COMMENT 'Primary key',
  `order` INT NOT NULL DEFAULT '0' COMMENT 'text order',
  `text` VARCHAR(1000) NOT NULL COMMENT 'paragraph, bullet.. and so one type of text',
  `news_fk` INT NOT NULL,
  `text_types_fk` INT NOT NULL,
  PRIMARY KEY (`id_text_spa`, `news_fk`, `text_types_fk`),
  UNIQUE INDEX `order_UNIQUE` (`order` ASC) VISIBLE,
  INDEX `fk_news_text_spa_text_types1_idx` (`text_types_fk` ASC) VISIBLE,
  INDEX `fk_news_text_spa_news1_idx` (`news_fk` ASC) VISIBLE,
  CONSTRAINT `fk_news_text_spa_news1`
    FOREIGN KEY (`news_fk`)
    REFERENCES `mydb`.`news` (`idnew`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_news_text_spa_text_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `mydb`.`news_text_types` (`text_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Content texts in Galego languaje';


-- -----------------------------------------------------
-- Table `mydb`.`tips`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tips` (
  `idTips` INT NOT NULL,
  `id` VARCHAR(50) NOT NULL COMMENT 'Tip key word reference',
  `location1` INT(1) NOT NULL COMMENT 'Location #1',
  `location2` INT(1) NOT NULL COMMENT 'Location #2',
  PRIMARY KEY (`idTips`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
COMMENT = 'Security tips';


-- -----------------------------------------------------
-- Table `mydb`.`related_new_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`related_new_items` (
  `idrelated_new_items` INT NOT NULL COMMENT 'New related items. Can be tips or news.',
  `source_new_fk` INT NOT NULL,
  `target_new_fk` INT NULL DEFAULT NULL,
  `target_tip_fk` INT NULL COMMENT 'Related tip reference',
  PRIMARY KEY (`idrelated_new_items`),
  INDEX `new_source_fk_idx` (`source_new_fk` ASC) VISIBLE,
  INDEX `new_target_fk_idx` (`target_new_fk` ASC) VISIBLE,
  INDEX `fk_related_new_items_Tips1_idx` (`target_tip_fk` ASC) VISIBLE,
  CONSTRAINT `new_source_fk`
    FOREIGN KEY (`source_new_fk`)
    REFERENCES `mydb`.`news` (`idnew`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `new_target_fk`
    FOREIGN KEY (`target_new_fk`)
    REFERENCES `mydb`.`news` (`idnew`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `tips_target_fk`
    FOREIGN KEY (`target_tip_fk`)
    REFERENCES `mydb`.`tips` (`idTips`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Related items. Can be Tips or News.';


-- -----------------------------------------------------
-- Table `mydb`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tags` (
  `idtags` INT NOT NULL,
  `order` INT NOT NULL,
  `text_cat` VARCHAR(45) NULL COMMENT 'Tags related with the new.',
  `text_eng` VARCHAR(45) NULL,
  `text_eus` VARCHAR(45) NULL,
  `text_glg` VARCHAR(45) NULL,
  `text_spa` VARCHAR(45) NULL,
  `news_fk` INT NOT NULL,
  PRIMARY KEY (`idtags`),
  INDEX `fk_tags_news1_idx` (`news_fk` ASC) VISIBLE,
  CONSTRAINT `fk_tags_news`
    FOREIGN KEY (`news_fk`)
    REFERENCES `mydb`.`news` (`idnew`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Tags to relationships';


-- -----------------------------------------------------
-- Table `mydb`.`tip_text_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tip_text_types` (
  `idtiptexttypes` INT NOT NULL COMMENT 'Primary key',
  `type_name` VARCHAR(100) NULL COMMENT 'Text type name',
  `type_code` VARCHAR(50) NULL COMMENT 'Text type code',
  PRIMARY KEY (`idtiptexttypes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tips_spa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tips_spa` (
  `idtips` INT NOT NULL COMMENT 'Primary key',
  `tips_idTips` INT NOT NULL,
  `tip_text_fk` INT NOT NULL,
  `order` INT NOT NULL DEFAULT 0,
  `text` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`idtips`, `tips_idTips`, `tip_text_fk`),
  INDEX `fk_tips_spa_tips1_idx` (`tips_idTips` ASC) VISIBLE,
  INDEX `fk_tips_spa_tip_text_types1_idx` (`tip_text_fk` ASC) VISIBLE,
  CONSTRAINT `fk_tips_spa_tips1`
    FOREIGN KEY (`tips_idTips`)
    REFERENCES `mydb`.`tips` (`idTips`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tips_spa_tip_text_types1`
    FOREIGN KEY (`tip_text_fk`)
    REFERENCES `mydb`.`tip_text_types` (`idtiptexttypes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Texts in Spanish';


-- -----------------------------------------------------
-- Table `mydb`.`tips_cat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tips_cat` (
  `idtips` INT NOT NULL COMMENT 'Primary key',
  `tips_fk` INT NOT NULL,
  `text_types_fk` INT NOT NULL,
  `order` INT NOT NULL DEFAULT 0,
  `text` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`idtips`, `tips_fk`, `text_types_fk`),
  INDEX `fk_tips_cat_tips1_idx` (`tips_fk` ASC) VISIBLE,
  INDEX `fk_tips_cat_tip_text_types1_idx` (`text_types_fk` ASC) VISIBLE,
  CONSTRAINT `fk_tips_cat_tips1`
    FOREIGN KEY (`tips_fk`)
    REFERENCES `mydb`.`tips` (`idTips`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tips_cat_tip_text_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `mydb`.`tip_text_types` (`idtiptexttypes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Text in Catala';


-- -----------------------------------------------------
-- Table `mydb`.`tips_eng`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tips_eng` (
  `idtips` INT NOT NULL COMMENT 'Primary key',
  `tips_fk` INT NOT NULL,
  `text_types_fk` INT NOT NULL,
  `order` INT NOT NULL DEFAULT 0,
  `text` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`idtips`, `tips_fk`, `text_types_fk`),
  INDEX `fk_tips_eng_tips1_idx` (`tips_fk` ASC) VISIBLE,
  INDEX `fk_tips_eng_tip_text_types1_idx` (`text_types_fk` ASC) VISIBLE,
  CONSTRAINT `fk_tips_eng_tips1`
    FOREIGN KEY (`tips_fk`)
    REFERENCES `mydb`.`tips` (`idTips`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tips_eng_tip_text_types1`
    FOREIGN KEY (`text_types_fk`)
    REFERENCES `mydb`.`tip_text_types` (`idtiptexttypes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Security tips';


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
