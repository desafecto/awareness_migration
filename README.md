# Gestión de contenidos con BD relacional
## POC para servir contenidos que originalemte vienen en ficheros .json 
POC cuya finalidad es ver la posibilidad de gestionar y servir los contenidos que actualmente residen en ficheros _.json_ usando formularios y una BD embebida _SQLite_.

Está abierta la implementación del GUI de los formularios. Inicialmente hará de forma directa con un GUI en  _Tkinter_. 
En versiones posteriores se servirían con un API REST usando _Flask_, siendo el cliente un GUI web con componentes.

STAGE #1: Diseño y creación de la BD SQLite y scripts asociados.
STAGE #2: Carga de la BD a partir de los datos contenidos en los actuales ._json_.
STAGE #3: Volcado de datos de la BD en los ficheros ._json_.
STAGE #4: Introducción de datos en la BD a partir de formularios en un GUI hecho en _TKinter_.
STAGE #5: Montar un API REST con _Flask_ para interaccionar con la BD por HTTP.
STAGE #6: Migrar el GUI en TKinter a web con componentes _Lit-element_.

Tareas adicionales relacionadas con el Stage #1: gestion de la BD (VACUM, backup,...); refactor de scripts como programas; incluir el mantenimiento en un módulo dentro del GUI.