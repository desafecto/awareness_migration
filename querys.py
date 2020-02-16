
S_TEXT_TYPES = "SELECT * FROM text_types;"

# Inserts into table NEWS
def news_insert_id(idValue):
    return "INSERT INTO news VALUES ('idnew', '{0}');".format(idValue)

def news_insert_img(idValue):
    return "INSERT INTO news VALUES ('img', '{0}');".format(idValue)    

def news_insert_title(idValue):
    return "INSERT INTO news VALUES ('title', '{0}');".format(idValue)  

def news_insert_desc(idValue):
    return "INSERT INTO news VALUES ('desc', '{0}');".format(idValue)      
