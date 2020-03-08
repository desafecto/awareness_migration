import apsw  # no hay manera de instalarlo

print("Archivo del modulo APSW..:",apsw.__file__)
print("Version APSW.............:",apsw.apswversion())
print("Version biblioteca SQLite:",apsw.sqlitelibversion())
print("Version cabecera SQLite..:",apsw.SQLITE_VERSION_NUMBER)


conexion=apsw.Connection("../../sqlite/primerone.db")
cursor=conexion.cursor()

# Para habilitar las restricciones de integridad
# referencial de la base de datos:
cursor.execute("PRAGMA foreign_keys=ON;")
