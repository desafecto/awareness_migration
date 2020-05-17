import json
import constants as con
import sqlite3
import load_querys as q
import logging
import logging.config

logging.config.fileConfig('conf/log.conf')

# create logger using the module name
logger = logging.getLogger(__file__)

def checking_input_data(inputData, itemData):
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


def save_serialized_json(lang):
    'Lee de un fichero .json y luego vuelca (dump) en un fichero .json el contenido del objeto Python'

    with open ("files/" + con.input_file[lang], "r", encoding="utf-8") as r_file:
        json.load(r_file)

        # with open ("files/output_data.json", "w", encoding="utf-8") as w_file:
        #     json.dump(data, w_file, indent=2, ensure_ascii=False, separators=(',', ': '))


def load_json_file(lang):
    '''
    Parsea el .json de entrada sacando todos sus datos e insertándolos en una
    base de datos SQLite.
    '''

    logger.info('Start file parsing ...')

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

        # Populate NEWS #########################################################
        for item in data['news'] :
            order = 0
            # id
            logger.info(f"\n\n\n (id)  ===> {item['id']}")
            # img
            img = item['img']
            logger.info(f" (img) ===> {item['img']}")
            # date
            date = item['date']
            logger.info(f" (date) ==> {item['date']}")
            # title
            title = item['title']
            logger.info(f" (title) => {item['title']}")
            # desc
            desc = item['desc']
            logger.info(f" (desc) ==> {item['desc'][:60]}")
            # related (*)
            if 'related' in item:
                for item7 in item['related'].keys() :
                    for listElement in item['related'][item7]:
                        logger.info(f" (related.{item7}): {listElement}")
            # location
            for item6 in item['location'].keys() :
                logger.info(f" (location.{item6}): {item['location'][item6]['isActive']}")
            # tags (*)
            if 'tags' in item:
                tagOrder = 0
                for item8 in item['tags']:
                    tagOrder = tagOrder + 1
                    logger.info(f" (tags [{tagOrder}] --> {item8}")
            # video (*)
            if 'video' in item:
                video = item['video']
                logger.info(f" (video)  ==>  {item['video']}")
            # content
            logger.info("\n    [content] (lang=%s):" %(lang))
            for item2 in item['content'] :
                for item3 in item2['content'] :
                    order = order + 1
                    logger.info(f"    (content) --> ({item2['type']}) (order: {order}) --> {item3[:60]}...")
            

        # Populate GLOSSARY #################################################
        logger.info(' #        GLOSSARY                       #')
        for item in data['glossary']:
            order = 0
            # id
            logger.info(f"\n\n\n (id)  ===> {item['id']}")
            # title
            logger.info(f" (title) => {item['title']}")
            # synonyms
            if 'synonyms' in item:
                tagOrder = 0
                for item8 in item['synonyms'] :
                    tagOrder = tagOrder + 1
                    logger.info(f" (synonyms [{tagOrder}] --> {item8}")
            # location
            for item6 in item['location'].keys() :
                logger.info(f" (location.{item6}): {item['location'][item6]['isActive']}")
            # content
            logger.info("\n    [content] (lang=%s):" %(lang))
            for item2 in item['content'] :
                for item3 in item2['content'] :
                    order = order + 1
                    logger.info(f"    (content) --> ({item2['type']}) (order: {order}) --> {item3[:60]}...")


        # Populate TIPS ####################################################
        logger.info(' #        TIPS                           #')
        for item in data['tips'] :
            order = 0
            # id
            logger.info(f"\n\n\n (id)  ===> {item['id']}")
            # img
            logger.info(f" (img) ===> {item['img']}")
            # title
            logger.info(f" (title) => {item['title']}")
            # linkText
            logger.info(f" (linkText) => {item['linkText']}")
            # desc
            logger.info(f" (desc) ==> {item['desc'][:60]}")
            # location
            for item6 in item['location'].keys() :
                logger.info(f" (location.{item6}): {item['location'][item6]['isActive']}")
            # content
            logger.info("\n    [content] (lang=%s):" %(lang))
            for item2 in item['content'] :
                for item3 in item2['content'] :
                    order = order + 1
                    logger.info(f"    (content) --> ({item2['type']}) (order: {order}) --> {item3[:60]}...")
    
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
