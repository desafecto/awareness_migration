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

    def __init__(self, id, img, date, title, desc):
        self.new.id = id
        self.new.img = img
        self.new.date = date
        self.new.title = title
        self.new.desc = desc
        self.new.content = []
        self.new.related = {}
        self.new.located = {}
        self.new.tags = []
        self.new.video = {}

