import json
import constants as con



def validate_input_data(inputData):
    print("\n Validating input data list...")

    for diccionario in inputData:
        print(f"\n Elemento {diccionario[con.atributes_input['id']]} ------")
        for item in con.atributes_input:
            print(f" check atribute --> {item}: {item in diccionario}")

def save_serialized_json(lang):

    with open ("files/" + con.input_file[lang], "r", encoding="utf-8") as r_file:
        data=json.load(r_file)
        
        with open ("files/output_data.json", "w", encoding="utf-8") as w_file:
            json.dump(data, w_file, indent=2, ensure_ascii=False, separators=(',', ': '))

def parse_input_json_file(lang):

    with open ("files/" + con.input_file[lang], "r", encoding="utf-8") as r_file:
        data=json.load(r_file)

        validate_input_data(data['news'])       

        for item in data['news'] :
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
                for item8 in item['tags'] :
                    print(f" (tags.{item8}) --> {item8}")
            # video (*)
            if 'video' in item :
                print(" (video)  ==>  Exist!")
            # content
            print("\n    [content] (lang=%s):" %(lang))
            for item2 in item['content'] :
                for item3 in item2['content'] :
                    print(f"*(content) --> ({item2['type']}) --> {item3[:60]}...")


if __name__ == '__main__':
    parse_input_json_file('spa')
