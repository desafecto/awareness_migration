


# Truncate table news_text_types
#
DELETE_NEWS_TEXT_TYPES = "DELETE FROM table news_text_types;"

# Truncate table tips_text_types
#
DELETE_TIPS_TEXT_TYPES = "DELETE FROM table tips_text_types;"

# Truncate table glossary_text_types
#
DELETE_GLOSSARY_TEXT_TYPES = "DELETE FROM table glossary_text_types;"


# Iserts News text types into table news_text_types
NEWS_TEXT_TYPES_DATA = '''
    INSERT INTO new_text_types(id,cod,name) VALUES 
    (1, 'p', 'paragraph'),
    (2, 'b', 'list-bullet'),
    (3, 't', 'tag');
   '''

# Iserts Tips text types into table tips_text_types
TIPS_TEXT_TYPES_DATA = '''
    INSERT INTO tip_text_types(id,cod,name) VALUES 
    (1, 'p', 'paragraph'),
    (2, 'b', 'list-bullet'),
    (3, 'l', 'linkText');
   '''

# Iserts Glossary text types into table glossary_text_types
GLOSSARY_TEXT_TYPES_DATA = '''
    INSERT INTO glossary_text_types(id,cod,name) VALUES 
    (1, 'p', 'paragraph'),
    (2, 'b', 'list-bullet'),
    (3, 'l', 'synonym');
   '''

# Select from tables
S_TEXT_TYPES = "SELECT * FROM text_types;"

# Inserts into table NEWS
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

