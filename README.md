# Migración a servidor de contenidos con BD relacional
## POC para servir contenidos que originalemte vienen en ficheros .json 
POC cuya finalidad es ver la posibilidad de gestionar y servir los contenidos que actualmente residen en ficheros _.json_ usando formularios y una BD embebida _SQLite_.
Está abierta la implementación del GUI de los formularios. Inicialmente hará de forma directa con un GUI en  _Tkinter_. 
En versiones posteriores se servirían con un API REST usando _Flask_, siendo el cliente un GUI web con componentes.