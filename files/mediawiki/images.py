import json
import requests

data = 'consumables'

response = requests.get('https://dofapi2.herokuapp.com/%s' % data)
items = json.loads(response.text)

for i in range(0, len(items)):
  url = items[i]['imgUrl']
  r = requests.get(url)
  image = 'img/Consommables-%s.png' % items[i]['_id']
  with open(image, 'wb') as outfile:
    outfile.write(r.content)
  print(i)

data = 'equipments'

response = requests.get('https://dofapi2.herokuapp.com/%s' % data)
items = json.loads(response.text)

for i in range(0, len(items)):
  url = items[i]['imgUrl']
  r = requests.get(url)
  image = 'img/Equipements-%s.png' % items[i]['_id']
  with open(image, 'wb') as outfile:
    outfile.write(r.content)
  print(i)

data = 'resources'

response = requests.get('https://dofapi2.herokuapp.com/%s' % data)
items = json.loads(response.text)

for i in range(0, len(items)):
  url = items[i]['imgUrl']
  r = requests.get(url)
  image = 'img/Ressources-%s.png' % items[i]['_id']
  with open(image, 'wb') as outfile:
    outfile.write(r.content)
  print(i)

data = 'weapons'

response = requests.get('https://dofapi2.herokuapp.com/%s' % data)
items = json.loads(response.text)

for i in range(0, len(items)):
  url = items[i]['imgUrl']
  r = requests.get(url)
  image = 'img/Armes-%s.png' % items[i]['_id']
  with open(image, 'wb') as outfile:
    outfile.write(r.content)
  print(i)


