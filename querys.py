
# Select from tables
S_TEXT_TYPES = "SELECT * FROM text_types;"

# Inserts into table NEWS
def news_insert_row(topic_key, date, image, location1, location2, video_img, video_url):
    return """
            INSERT INTO news (topic_key, date, image, location1, location2, video_img, video_url)
            VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}');
           """.format(topic_key, date, image, location1, location2, video_img, video_url)
            

def news_insert_img(idValue):
    return "INSERT INTO news VALUES ('img', '{0}');".format(idValue)

def news_insert_title(idValue):
    return "INSERT INTO news VALUES ('title', '{0}');".format(idValue)

def news_insert_desc(idValue):
    return "INSERT INTO news VALUES ('desc', '{0}');".format(idValue)
