import sqlite3
import logging
import querys as q

logging.basicConfig(
    filename='logs/create_populate_db.log',
    filemode='w',
    format='   %(levelname)s:%(asctime)s: %(message)s',
    datefmt='%d/%m/%Y %I:%M:%S%p',
    level=logging.DEBUG
    )

try:
		# Connect to data base
		sqliteConnection = sqlite3.connect('../../sqlite/sample_db/firstone.db')
		cursor = sqliteConnection.cursor()
		logging.info("Database connection created and successfully connected to SQLite")

		# Enable foreing-keys
		cursor.execute("PRAGMA foreign_keys=ON;")
		logging.info("foreing keys enabled: PRAGMA foreign_keys=ON")

		sqlite_select_Query = "select sqlite_version();"
		cursor.execute(sqlite_select_Query)
		record = cursor.fetchall()
		logging.info("SQLite Database Version is: %s" %(record))

		# Populate glossary text types
		cursor.execute(q.TRUNCATE_GLOSSARY_TEXT_TYPES)
		logging.debug("executed TRUNCATE_GLOSSARY_TEXT_TYPES")
		cursor.execute(q.GLOSSARY_TEXT_TYPES_DATA)
		logging.debug("executed GLOSSARY_TEXT_TYPES_DATA")

		# Populate news text types
		cursor.execute(q.TRUNCATE_NEWS_TEXT_TYPES)
		logging.debug("executed TRUNCATE_NEWS_TEXT_TYPES")
		cursor.execute(q.NEWS_TEXT_TYPES_DATA)
		logging.debug("executed NEWS_TEXT_TYPES_DATA")

		# Populate tips text types
		cursor.execute(q.TRUNCATE_TIPS_TEXT_TYPES)
		logging.debug("executed TRUNCATE_TIPS_TEXT_TYPES")
		cursor.execute(q.TIPS_TEXT_TYPES_DATA)
		logging.debug("executed TIPS_TEXT_TYPES_DATA")

		# close the cursor
		cursor.close()
		logging.debug("The cursor is closed yet")

		# Perform connection commit
		sqliteConnection.commit()
		logging.debug("Connection commit done")

except sqlite3.Error as error:
		print("Error while connecting to sqlite", error)
		logging.error("Error while connecting to sqlite; %s" %error)
finally:
		if (sqliteConnection):
				# close the connection
				sqliteConnection.close()
				logging.info("Script process finished. The SQLite connection is closed now")


# if __name__ == '__main__':
# 		populate_text_types()