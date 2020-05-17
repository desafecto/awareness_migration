--
-- File generated with SQLiteStudio v3.2.1 on do. abr. 19 22:33:32 2020
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: glossary
DROP TABLE IF EXISTS glossary;

CREATE TABLE glossary (
    idglossary INT          NOT NULL,
    name       VARCHAR (45) NOT NULL,
    location1  INT,
    location2  INT,
    PRIMARY KEY (
        idglossary
    )
);


-- Table: glossary_cat
DROP TABLE IF EXISTS glossary_cat;

CREATE TABLE glossary_cat (
    idglossary_cat INT           NOT NULL,
    glossary_fk    INT           NOT NULL,
    text_types_fk  INT           NOT NULL,
    [order]        INT           NOT NULL,
    text           VARCHAR (800) NOT NULL,
    PRIMARY KEY (
        idglossary_cat,
        glossary_fk,
        text_types_fk
    ),
    CONSTRAINT fk_glossary_cat_glossary1 FOREIGN KEY (
        glossary_fk
    )
    REFERENCES glossary (idglossary) ON DELETE CASCADE
                                     ON UPDATE CASCADE,
    CONSTRAINT fk_glossary_cat_glossary_text_types1 FOREIGN KEY (
        text_types_fk
    )
    REFERENCES glossary_text_types (idglossary_text_types) ON DELETE NO ACTION
                                                           ON UPDATE NO ACTION
);


-- Table: glossary_eng
DROP TABLE IF EXISTS glossary_eng;

CREATE TABLE glossary_eng (
    idglossary_eng INT           NOT NULL,
    glossary_fk    INT           NOT NULL,
    [order]        INT           NOT NULL,
    text           VARCHAR (800) NOT NULL,
    text_type_fk   INT           NOT NULL,
    PRIMARY KEY (
        idglossary_eng,
        glossary_fk,
        text_type_fk
    ),
    CONSTRAINT fk_glossary_cat_glossary10 FOREIGN KEY (
        glossary_fk
    )
    REFERENCES glossary (idglossary) ON DELETE CASCADE
                                     ON UPDATE CASCADE,
    CONSTRAINT fk_glossary_eng_glossary_text_types1 FOREIGN KEY (
        text_type_fk
    )
    REFERENCES glossary_text_types (idglossary_text_types) ON DELETE NO ACTION
                                                           ON UPDATE NO ACTION
);


-- Table: glossary_eus
DROP TABLE IF EXISTS glossary_eus;

CREATE TABLE glossary_eus (
    idglossary_eus INT           NOT NULL,
    glossary_fk    INT           NOT NULL,
    text_type_fk   INT           NOT NULL,
    [order]        INT           NOT NULL,
    text           VARCHAR (800) NOT NULL,
    PRIMARY KEY (
        idglossary_eus,
        glossary_fk,
        text_type_fk
    ),
    CONSTRAINT fk_glossary_cat_glossary100 FOREIGN KEY (
        glossary_fk
    )
    REFERENCES glossary (idglossary) ON DELETE CASCADE
                                     ON UPDATE CASCADE,
    CONSTRAINT fk_glossary_eus_glossary_text_types1 FOREIGN KEY (
        text_type_fk
    )
    REFERENCES glossary_text_types (idglossary_text_types) ON DELETE NO ACTION
                                                           ON UPDATE NO ACTION
);


-- Table: glossary_glg
DROP TABLE IF EXISTS glossary_glg;

CREATE TABLE glossary_glg (
    idglossary_glg INT           NOT NULL,
    glossary_fk    INT           NOT NULL,
    text_type_fk   INT           NOT NULL,
    [order]        INT           NOT NULL,
    text           VARCHAR (800) NOT NULL,
    PRIMARY KEY (
        idglossary_glg,
        glossary_fk,
        text_type_fk
    ),
    CONSTRAINT fk_glossary_cat_glossary1000 FOREIGN KEY (
        glossary_fk
    )
    REFERENCES glossary (idglossary) ON DELETE CASCADE
                                     ON UPDATE CASCADE,
    CONSTRAINT fk_glossary_glg_glossary_text_types1 FOREIGN KEY (
        text_type_fk
    )
    REFERENCES glossary_text_types (idglossary_text_types) ON DELETE NO ACTION
                                                           ON UPDATE NO ACTION
);


-- Table: glossary_spa
DROP TABLE IF EXISTS glossary_spa;

CREATE TABLE glossary_spa (
    idglossary_spa INT           NOT NULL,
    glossary_fk    INT           NOT NULL,
    text_type_fk   INT           NOT NULL,
    [order]        INT           NOT NULL,
    text           VARCHAR (800) NOT NULL,
    PRIMARY KEY (
        idglossary_spa,
        glossary_fk,
        text_type_fk
    ),
    CONSTRAINT fk_glossary_cat_glossary10000 FOREIGN KEY (
        glossary_fk
    )
    REFERENCES glossary (idglossary) ON DELETE CASCADE
                                     ON UPDATE CASCADE,
    CONSTRAINT fk_glossary_spa_glossary_text_types1 FOREIGN KEY (
        text_type_fk
    )
    REFERENCES glossary_text_types (idglossary_text_types) ON DELETE NO ACTION
                                                           ON UPDATE NO ACTION
);


-- Table: glossary_text_types
DROP TABLE IF EXISTS glossary_text_types;

CREATE TABLE glossary_text_types (
    idglossary_text_types INT           NOT NULL,
    type_name             VARCHAR (200),
    type_code             VARCHAR (45),
    type_desc             CHAR (200),
    PRIMARY KEY (
        idglossary_text_types
    )
);

INSERT INTO glossary_text_types (
                                    idglossary_text_types,
                                    type_name,
                                    type_code,
                                    type_desc
                                )
                                VALUES (
                                    1,
                                    'p',
                                    'p',
                                    'paragraph'
                                );

INSERT INTO glossary_text_types (
                                    idglossary_text_types,
                                    type_name,
                                    type_code,
                                    type_desc
                                )
                                VALUES (
                                    2,
                                    'list-bullet',
                                    'b',
                                    'list item'
                                );

INSERT INTO glossary_text_types (
                                    idglossary_text_types,
                                    type_name,
                                    type_code,
                                    type_desc
                                )
                                VALUES (
                                    3,
                                    'img',
                                    'i',
                                    'image'
                                );

INSERT INTO glossary_text_types (
                                    idglossary_text_types,
                                    type_name,
                                    type_code,
                                    type_desc
                                )
                                VALUES (
                                    4,
                                    'title',
                                    't',
                                    'title'
                                );

INSERT INTO glossary_text_types (
                                    idglossary_text_types,
                                    type_name,
                                    type_code,
                                    type_desc
                                )
                                VALUES (
                                    5,
                                    'description',
                                    'd',
                                    'description'
                                );


-- Table: news
DROP TABLE IF EXISTS news;

CREATE TABLE news (
    idnews    INT           NOT NULL,
    topic_key VARCHAR (80)  NOT NULL,
    date      VARCHAR (10)  NOT NULL
                            DEFAULT '24-12-2023',
    location1 TINYINT       NOT NULL
                            DEFAULT '1',
    location2 TINYINT       NOT NULL
                            DEFAULT '1',
    image     TEXT (200),
    video_img VARCHAR (200) DEFAULT NULL,
    video_url VARCHAR (200) DEFAULT NULL,
    PRIMARY KEY (
        idnews
    )
);


-- Table: news_cat
DROP TABLE IF EXISTS news_cat;

CREATE TABLE news_cat (
    id_text_cat   INT            NOT NULL,
    [order]       INT            NOT NULL
                                 DEFAULT '0',
    text          VARCHAR (1000) NOT NULL,
    news_fk       INT            NOT NULL,
    text_types_fk INT            NOT NULL,
    PRIMARY KEY (
        id_text_cat,
        news_fk,
        text_types_fk
    ),
    CONSTRAINT fk_news_text_cat_news1 FOREIGN KEY (
        news_fk
    )
    REFERENCES news (idnews) ON DELETE CASCADE
                             ON UPDATE CASCADE,
    CONSTRAINT fk_news_cat_types1 FOREIGN KEY (
        text_types_fk
    )
    REFERENCES news_text_types (text_type_id) 
);


-- Table: news_eng
DROP TABLE IF EXISTS news_eng;

CREATE TABLE news_eng (
    id_text_eng   INT            NOT NULL,
    [order]       INT            NOT NULL
                                 DEFAULT '0',
    text          VARCHAR (1000) NOT NULL,
    news_fk       INT            NOT NULL,
    text_types_fk INT            NOT NULL,
    PRIMARY KEY (
        id_text_eng,
        news_fk,
        text_types_fk
    ),
    CONSTRAINT fk_news_text_eng_news1 FOREIGN KEY (
        news_fk
    )
    REFERENCES news (idnews) ON DELETE CASCADE
                             ON UPDATE CASCADE,
    CONSTRAINT fk_news_text_eng_text_types1 FOREIGN KEY (
        text_types_fk
    )
    REFERENCES news_text_types (text_type_id) 
);


-- Table: news_eus
DROP TABLE IF EXISTS news_eus;

CREATE TABLE news_eus (
    id_text_eus   INT            NOT NULL,
    [order]       INT            NOT NULL
                                 DEFAULT '0',
    text          VARCHAR (1000) NOT NULL,
    news_fk       INT            NOT NULL,
    text_types_fk INT            NOT NULL,
    PRIMARY KEY (
        id_text_eus,
        news_fk,
        text_types_fk
    ),
    CONSTRAINT fk_news_text_eus_news1 FOREIGN KEY (
        news_fk
    )
    REFERENCES news (idnews) ON DELETE CASCADE
                             ON UPDATE CASCADE,
    CONSTRAINT fk_news_text_eus_text_types1 FOREIGN KEY (
        text_types_fk
    )
    REFERENCES news_text_types (text_type_id) 
);


-- Table: news_glg
DROP TABLE IF EXISTS news_glg;

CREATE TABLE news_glg (
    id_text_glg   INT            NOT NULL,
    [order]       INT            NOT NULL
                                 DEFAULT '0',
    text          VARCHAR (1000) NOT NULL,
    news_fk       INT            NOT NULL,
    text_types_fk INT            NOT NULL,
    PRIMARY KEY (
        id_text_glg,
        news_fk,
        text_types_fk
    ),
    CONSTRAINT fk_news_text_glg_news1 FOREIGN KEY (
        news_fk
    )
    REFERENCES news (idnews) ON DELETE CASCADE
                             ON UPDATE CASCADE,
    CONSTRAINT fk_news_text_glg_text_types1 FOREIGN KEY (
        text_types_fk
    )
    REFERENCES news_text_types (text_type_id) 
);


-- Table: news_spa
DROP TABLE IF EXISTS news_spa;

CREATE TABLE news_spa (
    id_text_spa   INT            NOT NULL,
    [order]       INT            NOT NULL
                                 DEFAULT '0',
    text          VARCHAR (1000) NOT NULL,
    news_fk       INT            NOT NULL,
    text_types_fk INT            NOT NULL,
    PRIMARY KEY (
        id_text_spa,
        news_fk,
        text_types_fk
    ),
    CONSTRAINT fk_news_text_spa_news1 FOREIGN KEY (
        news_fk
    )
    REFERENCES news (idnews) ON DELETE CASCADE
                             ON UPDATE CASCADE,
    CONSTRAINT fk_news_text_spa_text_types1 FOREIGN KEY (
        text_types_fk
    )
    REFERENCES news_text_types (text_type_id) 
);


-- Table: news_text_types
DROP TABLE IF EXISTS news_text_types;

CREATE TABLE news_text_types (
    text_type_id INT           NOT NULL,
    type_name    VARCHAR (255) NOT NULL,
    type_code    VARCHAR (50)  NOT NULL
                               DEFAULT 'p',
    PRIMARY KEY (
        text_type_id
    )
);

INSERT INTO news_text_types (
                                text_type_id,
                                type_name,
                                type_code
                            )
                            VALUES (
                                1,
                                'p',
                                'p'
                            );

INSERT INTO news_text_types (
                                text_type_id,
                                type_name,
                                type_code
                            )
                            VALUES (
                                2,
                                'list-bullet',
                                'b'
                            );

INSERT INTO news_text_types (
                                text_type_id,
                                type_name,
                                type_code
                            )
                            VALUES (
                                3,
                                'img',
                                'i'
                            );

INSERT INTO news_text_types (
                                text_type_id,
                                type_name,
                                type_code
                            )
                            VALUES (
                                4,
                                'title',
                                't'
                            );

INSERT INTO news_text_types (
                                text_type_id,
                                type_name,
                                type_code
                            )
                            VALUES (
                                5,
                                'description',
                                'd'
                            );


-- Table: related_new_items
DROP TABLE IF EXISTS related_new_items;

CREATE TABLE related_new_items (
    idrelated_new_items INT NOT NULL,
    source_new_fk       INT NOT NULL,
    target_new_fk       INT DEFAULT NULL,
    target_tip_fk       INT,
    PRIMARY KEY (
        idrelated_new_items
    ),
    CONSTRAINT new_source_fk FOREIGN KEY (
        source_new_fk
    )
    REFERENCES news (idnews) ON DELETE CASCADE
                             ON UPDATE CASCADE,
    CONSTRAINT new_target_fk FOREIGN KEY (
        target_new_fk
    )
    REFERENCES news (idnews) ON DELETE CASCADE
                             ON UPDATE CASCADE,
    CONSTRAINT tips_target_fk FOREIGN KEY (
        target_tip_fk
    )
    REFERENCES tips (idTips) ON DELETE CASCADE
                             ON UPDATE CASCADE
);


-- Table: synonyms
DROP TABLE IF EXISTS synonyms;

CREATE TABLE synonyms (
    idsynonym   INT          NOT NULL,
    [order]     INT          NOT NULL,
    text_cat    VARCHAR (45),
    text_eng    VARCHAR (45),
    text_eus    VARCHAR (45),
    text_glg    VARCHAR (45),
    text_spa    VARCHAR (45),
    glossary_fk INT          NOT NULL,
    PRIMARY KEY (
        idsynonym
    ),
    CONSTRAINT glossary_synonym_fk FOREIGN KEY (
        glossary_fk
    )
    REFERENCES glossary (idglossary) ON DELETE NO ACTION
                                     ON UPDATE NO ACTION
);


-- Table: tags
DROP TABLE IF EXISTS tags;

CREATE TABLE tags (
    idtags   INT          NOT NULL,
    [order]  INT          NOT NULL,
    text_cat VARCHAR (45),
    text_eng VARCHAR (45),
    text_eus VARCHAR (45),
    text_glg VARCHAR (45),
    text_spa VARCHAR (45),
    news_fk  INT          NOT NULL,
    PRIMARY KEY (
        idtags
    ),
    CONSTRAINT fk_tags_news FOREIGN KEY (
        news_fk
    )
    REFERENCES news (idnews) 
);


-- Table: tip_text_types
DROP TABLE IF EXISTS tip_text_types;

CREATE TABLE tip_text_types (
    idtiptexttypes INT           NOT NULL,
    type_name      VARCHAR (100),
    type_code      VARCHAR (50),
    PRIMARY KEY (
        idtiptexttypes
    )
);

INSERT INTO tip_text_types (
                               idtiptexttypes,
                               type_name,
                               type_code
                           )
                           VALUES (
                               1,
                               'p',
                               'p'
                           );

INSERT INTO tip_text_types (
                               idtiptexttypes,
                               type_name,
                               type_code
                           )
                           VALUES (
                               2,
                               'list-bullet',
                               'b'
                           );

INSERT INTO tip_text_types (
                               idtiptexttypes,
                               type_name,
                               type_code
                           )
                           VALUES (
                               3,
                               'linkText',
                               'l'
                           );

INSERT INTO tip_text_types (
                               idtiptexttypes,
                               type_name,
                               type_code
                           )
                           VALUES (
                               4,
                               'img',
                               'i'
                           );

INSERT INTO tip_text_types (
                               idtiptexttypes,
                               type_name,
                               type_code
                           )
                           VALUES (
                               5,
                               'title',
                               't'
                           );

INSERT INTO tip_text_types (
                               idtiptexttypes,
                               type_name,
                               type_code
                           )
                           VALUES (
                               6,
                               'description',
                               'd'
                           );


-- Table: tips
DROP TABLE IF EXISTS tips;

CREATE TABLE tips (
    idTips    INT          NOT NULL,
    id        VARCHAR (50) NOT NULL,
    location1 INT (1)      NOT NULL,
    location2 INT (1)      NOT NULL,
    PRIMARY KEY (
        idTips
    ),
    UNIQUE (
        id ASC
    )
);


-- Table: tips_cat
DROP TABLE IF EXISTS tips_cat;

CREATE TABLE tips_cat (
    idtips        INT            NOT NULL,
    tips_fk       INT            NOT NULL,
    text_types_fk INT            NOT NULL,
    [order]       INT            NOT NULL
                                 DEFAULT 0,
    text          VARCHAR (1000) NOT NULL,
    PRIMARY KEY (
        idtips,
        tips_fk,
        text_types_fk
    ),
    CONSTRAINT fk_tips_cat_tips1 FOREIGN KEY (
        tips_fk
    )
    REFERENCES tips (idTips) ON DELETE NO ACTION
                             ON UPDATE NO ACTION,
    CONSTRAINT fk_tips_cat_tip_text_types1 FOREIGN KEY (
        text_types_fk
    )
    REFERENCES tip_text_types (idtiptexttypes) ON DELETE NO ACTION
                                               ON UPDATE NO ACTION
);


-- Table: tips_eng
DROP TABLE IF EXISTS tips_eng;

CREATE TABLE tips_eng (
    idtips        INT            NOT NULL,
    tips_fk       INT            NOT NULL,
    text_types_fk INT            NOT NULL,
    [order]       INT            NOT NULL
                                 DEFAULT 0,
    text          VARCHAR (1000) NOT NULL,
    PRIMARY KEY (
        idtips,
        tips_fk,
        text_types_fk
    ),
    CONSTRAINT fk_tips_eng_tips1 FOREIGN KEY (
        tips_fk
    )
    REFERENCES tips (idTips) ON DELETE NO ACTION
                             ON UPDATE NO ACTION,
    CONSTRAINT fk_tips_eng_tip_text_types1 FOREIGN KEY (
        text_types_fk
    )
    REFERENCES tip_text_types (idtiptexttypes) ON DELETE NO ACTION
                                               ON UPDATE NO ACTION
);


-- Table: tips_eus
DROP TABLE IF EXISTS tips_eus;

CREATE TABLE tips_eus (
    idtips        INT            NOT NULL,
    tips_fk       INT            NOT NULL,
    text_types_fk INT            NOT NULL,
    [order]       INT            NOT NULL
                                 DEFAULT 0,
    text          VARCHAR (1000) NOT NULL,
    PRIMARY KEY (
        idtips,
        tips_fk,
        text_types_fk
    ),
    CONSTRAINT fk_tips_eus_tips1 FOREIGN KEY (
        tips_fk
    )
    REFERENCES tips (idTips) ON DELETE NO ACTION
                             ON UPDATE NO ACTION,
    CONSTRAINT fk_tips_eus_tip_text_types1 FOREIGN KEY (
        text_types_fk
    )
    REFERENCES tip_text_types (idtiptexttypes) ON DELETE NO ACTION
                                               ON UPDATE NO ACTION
);


-- Table: tips_glg
DROP TABLE IF EXISTS tips_glg;

CREATE TABLE tips_glg (
    idtips      INT            NOT NULL,
    tips_fk     INT            NOT NULL,
    tip_text_fk INT            NOT NULL,
    [order]     INT            NOT NULL
                               DEFAULT 0,
    text        VARCHAR (1000) NOT NULL,
    PRIMARY KEY (
        idtips,
        tips_fk,
        tip_text_fk
    ),
    CONSTRAINT fk_tips_glg_tips1 FOREIGN KEY (
        tips_fk
    )
    REFERENCES tips (idTips) ON DELETE NO ACTION
                             ON UPDATE NO ACTION,
    CONSTRAINT fk_tips_glg_tip_text_types1 FOREIGN KEY (
        tip_text_fk
    )
    REFERENCES tip_text_types (idtiptexttypes) ON DELETE NO ACTION
                                               ON UPDATE NO ACTION
);


-- Table: tips_spa
DROP TABLE IF EXISTS tips_spa;

CREATE TABLE tips_spa (
    idtips      INT            NOT NULL,
    tips_idTips INT            NOT NULL,
    tip_text_fk INT            NOT NULL,
    [order]     INT            NOT NULL
                               DEFAULT 0,
    text        VARCHAR (1000) NOT NULL,
    PRIMARY KEY (
        idtips,
        tips_idTips,
        tip_text_fk
    ),
    CONSTRAINT fk_tips_spa_tips1 FOREIGN KEY (
        tips_idTips
    )
    REFERENCES tips (idTips) ON DELETE NO ACTION
                             ON UPDATE NO ACTION,
    CONSTRAINT fk_tips_spa_tip_text_types1 FOREIGN KEY (
        tip_text_fk
    )
    REFERENCES tip_text_types (idtiptexttypes) ON DELETE NO ACTION
                                               ON UPDATE NO ACTION
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
