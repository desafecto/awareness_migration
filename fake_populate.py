import json
import constants as con


def checking_input_data(inputData, itemData):
    'Audita la presencia de atributos en News, Tips, y Glossary.'

    print(f"\n Checking input data list to %s ..." %(itemData))

    itemsCounter = 0
    for item in inputData[itemData]:
        itemsCounter = itemsCounter + 1
        print(f"\n ------ Elemento {itemsCounter}: {item['id']}")
        if itemData == 'news':
            for item2 in con.new_atributes:
               print(f" exists 'new' atribute --> {item2}: {item2 in con.new_atributes}")
        else:
            for item2 in con.tip_atributes:
               print(f" exists 'tip' atribute --> {item2}: {item2 in con.tip_atributes}")


def save_serialized_json(lang):

    with open ("files/" + con.input_file[lang], "r", encoding="utf-8") as r_file:
        data=json.load(r_file)
        
        with open ("files/output_data.json", "w", encoding="utf-8") as w_file:
            json.dump(data, w_file, indent=2, ensure_ascii=False, separators=(',', ': '))


def parse_news_file(lang):

    with open ("files/" + con.input_file[lang], "r", encoding="utf-8") as r_file:
        data=json.load(r_file)


        # Populate NEWS #########################################################
        print(' \n\n #########################################')
        print(' #        NEWS                           #')
        print(' #########################################')
        checking_input_data(data, 'news')
        for item in data['news'] :
            order = 0
            # id
            print(f"\n\n\n (id)  ===> {item['id']}")
            # img
            print(f" (img) ===> {item['img']}")
            # date
            print(f" (date) ==> {item['date']}")
            # title
            print(f" (title) => {item['title']}")
            # desc
            print(f" (desc) ==> {item['desc'][:60]}")
            # related (*)
            if 'related' in item:
                for item7 in item['related'].keys() :
                    for listElement in item['related'][item7]:
                        print(f" (related.{item7}): {listElement}")
            # location
            for item6 in item['location'].keys() :
                print(f" (location.{item6}): {item['location'][item6]['isActive']}")
            # tags (*)
            if 'tags' in item :
                tagOrder = 0
                for item8 in item['tags'] :
                    tagOrder = tagOrder + 1
                    print(f" (tags [{tagOrder}] --> {item8}")
            # video (*)
            if 'video' in item :
                print(" (video)  ==>  Exist!")
            # content
            print("\n    [content] (lang=%s):" %(lang))
            for item2 in item['content'] :
                for item3 in item2['content'] :
                    order = order + 1
                    print(f"    (content) --> ({item2['type']}) (order: {order}) --> {item3[:60]}...")


        # Populate TIPS #########################################################
        print(' \n\n #########################################')
        print(' #        TIPS                           #')
        print(' #########################################')
        checking_input_data(data, 'tips')
        for item in data['tips'] :
            order = 0
            # id
            print(f"\n\n\n (id)  ===> {item['id']}")
            # img
            print(f" (img) ===> {item['img']}")
            # title
            print(f" (title) => {item['title']}")
            # linkText
            print(f" (linkText) => {item['linkText']}")
            # desc
            print(f" (desc) ==> {item['desc'][:60]}")
            # location
            for item6 in item['location'].keys() :
                print(f" (location.{item6}): {item['location'][item6]['isActive']}")
            # content
            print("\n    [content] (lang=%s):" %(lang))
            for item2 in item['content'] :
                for item3 in item2['content'] :
                    order = order + 1
                    print(f"    (content) --> ({item2['type']}) (order: {order}) --> {item3[:60]}...")


if __name__ == '__main__':
    parse_news_file('spa')
