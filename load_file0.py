import json
import constants as con
import sqlite3
import load_querys as q
import logging
import logging.config

logging.config.fileConfig('conf/log.conf')

# create logger using the module name
logger = logging.getLogger('load_file0.py')

def checking_input_data(inputData, itemData,lang):
    ''' Audita la presencia de atributos en News, Tips, y Glossary.
        En versiones posteriores hará una validación de la estructura
        del fichero .json de entrada.
    '''

    print(f"\n Checking input data list to %s ..." %(itemData))
    logging.debug(f"  previous checking input data list to %s ..." %(itemData))

    itemsCounter = 0
    for item in inputData[itemData]:
        itemsCounter = itemsCounter + 1
        print(f"\n ------ Elemento {itemsCounter}: {item['id']}")
        if itemData == 'news':
            for item2 in con.new_atributes:
               print(f" exists 'new' atribute --> {item2}: {item2 in con.new_atributes}")
        else:
            if itemData == 'glossary':
                 for item2 in con.glossary_atributes:
                      print(f" exists 'glossary' atribute --> {item2}: {item2 in con.glossary_atributes}")
            else:
                 for item2 in con.tip_atributes:
                      print(f" exists 'tip' atribute --> {item2}: {item2 in con.tip_atributes}")


    'Lee de un fichero .json y luego vuelca (dump) en un fichero .json el contenido del objeto Python'

    with open ("files/" + con.input_file[lang], "r", encoding="utf-8") as r_file:
        json.load(r_file)

        # with open ("files/output_data.json", "w", encoding="utf-8") as w_file:
        #     json.dump(data, w_file, indent=2, ensure_ascii=False, separators=(',', ': '))

# Python code to check for empty list 
# IMPLICIT way or Pythonic way 
def isEmptyList(lis1): 
    if not lis1: 
        return 1
    else: 
        return 0

def is_news(dataset, item):
    return item not in dataset

def load_json_file(lang):
    '''
    Parsea el .json de entrada sacando todos sus datos e insertándolos en una
    base de datos SQLite.
    '''

    logger.info('Started file process ...')

    # Open DB connection
    try:
        sqliteConnection = sqlite3.connect(q.DB)
        cursor = sqliteConnection.cursor()
        logger.info("successfully connected to SQLite DB: %s" %(q.DB))

		# Disable foreing-keys
        cursor.execute("PRAGMA foreign_keys=OFF;")
        logger.info("foreing keys disabled: PRAGMA foreign_keys=OFF")

    except sqlite3.Error as error:
        logger.error(" ** ERROR connecting to sqlite DB: ; %s" %error)
        raise

    try:
        with open ("files/" + con.input_file[lang], "r", encoding="utf-8") as r_file:
            data=json.load(r_file)
            logger.info('input file read successfully')

        #########################################################
        #        Populate NEWS                                  #
        #########################################################

        # Stage #1: insert languaje agnostic items #################################
        idnews,news_topic_key, date, location1, location2, image, video_img, video_url = 1,"","","","","","",""
        news_agnostic_items = []
        related_news_items = []
        related_tip_items = []

        logger.debug('start insert languaje agnostic items')
        for item in data['news'] :
            logger.debug(f"\n              News (id)  ===> {item['id']}")
            #id
            news_topic_key = item['id']
            # date
            date = item['date']
            logger.debug(f" (date) ==> {item['date']}")
            # location1 (dashboard)
            location1 = 0
            if (item['location']['dashboard']['isActive'] == True):
                location1 = 1
            logger.debug(f" (location1) ===> {location1}")
            # location2 (list)
            location2 = 0
            if (item['location']['list']['isActive'] == True):
                location2 = 1            
            logger.debug(f" (location2) ===> {location2}")
            # image
            image = item['img']
            logger.debug(f" (image) ===> {item['img']}")
            # video_img 
            if 'video_img' in item:
                video_img = item['video']
                logger.info(f" (video_img)  ==>  {item['video_img']}")
                video_url = item['video_url']
                logger.info(f" (video_url)  ==>  {item['video_url']}")
            # related items from news and tips
            if 'related' in item:
                for related_item in item['related'].keys() :
                    for listElement in item['related'][related_item]:
                        if is_news(data['news'], listElement):
                            related_news_items.append((idnews, item['id'], listElement,""))
                            logger.info(f"Related News (related.{related_item}): {listElement}")
                        else:
                            related_tip_items.append((idnews, item['id'],"",listElement))
                            logger.info(f"Related Tip (related.{related_item}): {listElement}")

            news_agnostic_items.append((idnews,item['id'], date, location1, location2, image, video_img, video_url))
            idnews = idnews + 1
            # Content (languaje asociated)
            


        # Inserts all News records at a time
        cursor.executemany(q.insert_news_agnostic_items(), news_agnostic_items)
        if not isEmptyList(related_news_items):
            cursor.executemany( q.insert_news_related_items(),related_news_items)
        if not isEmptyList(related_tip_items):
            cursor.executemany(q.insert_news_related_items(),related_tip_items)
        

        # Save (commit) the changes
        sqliteConnection.commit()
        logger.debug(' commit sucessfull')

    except sqlite3.Error as error:
        logger.error(" ** Error while working on sqlite; %s" %error)
        raise

    except OSError as error:
        logger.error("Error OS: {0}".format(error))
        raise

    except EOFError as error:
        logger.error("Error EOF: {0}".format(error))
        raise    

    except KeyError as error:
        logger.error("Error KeyError: {0}".format(error))
        raise

    else: 
        logger.info("Process finished without errors  :)")

    finally:
        if (sqliteConnection):
            # close the db connection
            sqliteConnection.close()
            logger.info("the SQLite connection is closed now")
        logger.info("Script process finished.")
        print("Script process finished.")

if __name__ == '__main__':
    load_json_file('spa')
