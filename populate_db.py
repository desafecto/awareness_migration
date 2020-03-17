import sqlite3

try:
		sqliteConnection = sqlite3.connect('db/security.db')
		cursor = sqliteConnection.cursor()
		print("Database connection created and Successfully Connected to SQLite")

		sqlite_select_Query = "select sqlite_version();"
		cursor.execute(sqlite_select_Query)
		record = cursor.fetchall()
		print("SQLite Database Version is: ", record)
		cursor.close()

except sqlite3.Error as error:
		print("Error while connecting to sqlite", error)
finally:
		if (sqliteConnection):
				sqliteConnection.close()
				print("The SQLite connection is closed")


# if __name__ == '__main__':
# 		populate_text_types()