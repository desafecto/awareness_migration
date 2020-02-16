import pymysql
import querys as q
import classes

# Conectar con base de datos
connection = pymysql.connect(host="localhost", 
                           user="antonio", 
                           passwd="", 
                           database="mydb")
cursor = connection.cursor()

# Mostrar registros

query = q.news_insert_id("idedeprueba")
print(query)
cursor.execute(query)
#cursor.execute(q.S_TEXT_TYPES)

#filas = cursor.fetchall()
#print(f"\n El cursor.fetchall() devuelve un tipo iterativo que es mismamente: {type(filas)}\n")
#for fila in filas:
#   print(f" y el tipo de dato devuelto sobre el que itera el cursor es: {type(fila)}")
#print(fila)




# Finalizar 
connection.commit()
connection.close()