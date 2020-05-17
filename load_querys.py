# SQLite data base used
#
DB = 'db/prueba.db'
#DB = 'db/bbva_awareness.db'
#DB2 = '../../sqlite/sample_db/firstone.db'

CREATION_SCRIPT = "db/scripts/db_creation.sql"

CREATE_DB = "sqlite3 %s .read %s " %(DB, CREATION_SCRIPT)

# Select from tables
#
S_TEXT_TYPES = "SELECT * FROM text_types;"

# Inserts into table NEWS
#

def insert_news_agnostic_items():
    return 'INSERT INTO news VALUES (?,?,?,?,?,?,?,?)'

def insert_news_related_items():
    return 'INSERT INTO related_new_items VALUES (?,?,?,?)'

def news_insert_row(id, topic_key, date, image, location1, location2, video_img, video_url):
    return '''
            INSERT INTO news (idnew,topic_key, date, image, location1, location2, video_img, video_url)
            VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}, {7}');
           '''.format(id,topic_key, date, image, location1, location2, video_img, video_url)
            

def news_insert_img(img_url):
    return "INSERT INTO news VALUES ('img', '{0}');".format(img_url)

def news_insert_title(idValue):
    return "INSERT INTO news VALUES ('title', '{0}');".format(idValue)

def news_insert_desc(idValue):
    return "INSERT INTO news VALUES ('desc', '{0}');".format(idValue)

