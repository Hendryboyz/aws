import requests
import json

def handler(event, context):
  r = requests.get('https://www.fernandomc.com')
  print(r.text[0:500])
  if r.status_code == 200:
     return {
      'StatusCode': 200,
      'Message': 'Success'
    }
  else:
    return {
      'StatusCode': r.status_code,
      'Message': 'Failure'
    }