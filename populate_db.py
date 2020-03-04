import pymysql
import querys as q

# Conectar con base de datos
connection = pymysql.connect(host="localhost", 
                           user="antonio", 
                           passwd="", 
                           database="mydb")
cursor = connection.cursor()

# Mostrar registros

query = q.news_insert_row('topic_key', '23-02-1966', 'image url', 1, 1, 'video_img', 'video_url')
print(query)
cursor.execute(query)

#filas = cursor.fetchall()
#print(f"\n El cursor.fetchall() devuelve un tipo iterativo que es mismamente: {type(filas)}\n")
#for fila in filas:
#   print(f" y el tipo de dato devuelto sobre el que itera el cursor es: {type(fila)}")
#print(fila)

# Finalizar 
connection.commit()
connection.close()

def populate_text_types():
	' Populates the diferent text types used in news, tips, and glossary items.'

	# Inserta los datos de la tabla de tipos de textos de una noticia
	#
	cursor = connection.cursor()
	query = q.NEWS_TEXT_TYPES_DATA
	cursor.execute(query)
	connection.commit()
	connection.close()

	# Inserta los datos de la tabla de tipos de textos de un consejo
	#
	cursor = connection.cursor()
	query = q.TIPS_TEXT_TYPES_DATA
	cursor.execute(query)
	connection.commit()
	connection.close()

	# Inserta los datos de la tabla de tipos de textos del glosario
	#
	cursor = connection.cursor()
	query = q.GLOSSARY_TEXT_TYPES_DATA
	cursor.execute(query)
	connection.commit()
	connection.close()

if __name__ == '__main__':
		populate_text_types()