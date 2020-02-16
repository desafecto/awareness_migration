class New:

    new = {
            "id": "default id",
            "img": "default url",
            "date": "dd-mm-yyyy",
            "title": "default title",
            "desc": "default description",
            "content": [
                {
                    "type": "p",
                    "content": [
                        "sic transit gloria mundi",
                        "el Robocop"
                    ]
                },
                {
                    "type": "list-bullet",
                    "content": [
                        "El crusaíto",
                        "El maikel Yacson"                    ]
                }
            ],
            "related": {
                "tips": [
                    "learn_protecting_from_pishing"
                ]
            },
            "location": {
                "dashboard": {
                    "isActive": True
                },
                "list": {
                    "isActive": True
                }
            }
        }

    def __init__(self, id, date, title, desc):
        self.id = id
        self.date = date
        self.title = title
        self.desc = desc

