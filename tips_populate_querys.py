# SQLite data base used
#
DB = '../../sqlite/sample_db/firstone.db'

# Truncate table news_text_types
#
TRUNCATE_NEWS_TEXT_TYPES = "DELETE FROM news_text_types;"

# Truncate table tips_text_types
#
TRUNCATE_TIPS_TEXT_TYPES = "DELETE FROM tip_text_types;"

# Truncate table glossary_text_types
#
TRUNCATE_GLOSSARY_TEXT_TYPES = "DELETE FROM glossary_text_types;"

# Iserts News text types into table news_text_types
#
NEWS_TEXT_TYPES_DATA = '''
    INSERT INTO news_text_types(text_type_id,type_name,type_code) VALUES 
    (1,'p','p'),
    (2,'list-bullet','b'),
    (3,'img','i'),
    (4,'title','t'),
    (5,'description','d');
   '''

# Iserts Tips text types into table tip_text_types
#
TIPS_TEXT_TYPES_DATA = '''
    INSERT INTO tip_text_types(idtiptexttypes,type_name,type_code) VALUES 
    (1,'p','p'),
    (2,'list-bullet','b'),
    (3,'linkText','l'),
    (4,'img','i'),
    (5,'title','t'),
    (6,'description','d');
   '''

# Iserts Glossary text types into table glossary_text_types
#
GLOSSARY_TEXT_TYPES_DATA = '''
    INSERT INTO glossary_text_types(idglossary_text_types,type_name,type_code,type_desc) VALUES 
    (1,'p','p','paragraph'),
    (2,'list-bullet','b','list item'),
    (3,'img','i','image'),
    (4,'title','t','title'),
    (5,'description','d','description');
   '''

# Select from tables
#
S_TEXT_TYPES = "SELECT * FROM text_types;"

# Inserts into table NEWS
#
def news_insert_row(topic_key, date, image, location1, location2, video_img, video_url):
    return '''
            INSERT INTO news (topic_key, date, image, location1, location2, video_img, video_url)
            VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}');
           '''.format(topic_key, date, image, location1, location2, video_img, video_url)
            

def news_insert_img(idValue):
    return "INSERT INTO news VALUES ('img', '{0}');".format(idValue)

def news_insert_title(idValue):
    return "INSERT INTO news VALUES ('title', '{0}');".format(idValue)

def news_insert_desc(idValue):
    return "INSERT INTO news VALUES ('desc', '{0}');".format(idValue)

