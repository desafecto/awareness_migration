import sqlite3
import logging

logging.basicConfig(
    filename='logs/create_populate_db.log',
    filemode='w',
    format='   %(levelname)s:%(asctime)s: %(message)s',
    datefmt='%d/%m/%Y %I:%M:%S%p',
    level=logging.DEBUG
    )

try:
		sqliteConnection = sqlite3.connect('db/security.db')
		cursor = sqliteConnection.cursor()
		logging.debug("Database connection created and successfully connected to SQLite")

		sqlite_select_Query = "select sqlite_version();"
		cursor.execute(sqlite_select_Query)
		record = cursor.fetchall()
		logging.debug("SQLite Database Version is: %s" %(record))
		cursor.close()

except sqlite3.Error as error:
		print("Error while connecting to sqlite", error)
		logging.debug("Error while connecting to sqlite; %s" %error)
finally:
		if (sqliteConnection):
				sqliteConnection.close()
				logging.debug("The SQLite connection is closed now")


# if __name__ == '__main__':
# 		populate_text_types()