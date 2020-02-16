class New:

    new = {
            "id": "2019_11_15_market_app",
            "img": "https://m.bbva.es/estaticos/mult/new_identificacion_logo_640x230.png",
            "date": "15-11-2019",
            "title": "Cómo identificar la app oficial de BBVA",
            "desc": "Indicadores para reconocerla",
            "content": [
                {
                    "type": "p",
                    "content": [
                        "Si un amigo o familiar se hace cliente de BBVA y necesita descargar la app del banco para poder operar en su cuenta, ¿sabrías indicarle cuál es nuestra aplicación oficial?",
                        "En los últimos meses se han creado diversas aplicaciones fraudulentas que suplantan la identidad de BBVA. Por ello, queremos mostrarte los indicadores clave que se deben observar para diferenciar nuestra app oficial de otras aplicaciones fraudulentas:"
                    ]
                },
                {
                    "type": "list-bullet",
                    "content": [
                        "En primer lugar, la app de BBVA solo está disponible en los mercados oficiales: Google Play Store y App Store. Por lo tanto, no se debe descargar de ningún otro mercado alternativo.",
                        "La app oficial de BBVA tiene más de 5 millones de descargas. Este número elevado de descargas nos sirve como indicador de la autenticidad de la aplicación.",
                        "En ella se puede observar el logo con el nombre completo del banco (en el de las aplicaciones fraudulentas suele aparecer recortado o con algunas letras distintas), y el nombre correcto de BBVA España.",
                        "La app de BBVA tiene una valoración alta y miles de opiniones a día de hoy. Esta es una pista más que nos ayuda a reconocerla. En cambio, las aplicaciones fraudulentas no suelen tener buena puntuación ni un alto número de opiniones.",
                        "La \"Información de contacto del desarrollador\" de la app de BBVA es bbvabancamovil@bbva.com. En caso de que aparezca cualquier otra dirección de correo electrónico, se recomienda no descargar la aplicación."
                    ]
                },
                {
                    "type": "p",
                    "content": [
                        "Observando fácilmente estos indicadores puedes ayudar a alguien a detectar que la App es la oficial de BBVA."
                    ]
                }
            ],
            "related": {
                "tips": [
                    "learn_protecting_from_pishing"
                ]
            },
            "location": {
                "dashboard": {
                    "isActive": true
                },
                "list": {
                    "isActive": true
                }
            }
        }

    def __init__(self, nombre):
        self.nombre = nombre

    def agregar_truco(self, truco):
        self.trucos.append(truco)
