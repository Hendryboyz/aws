import boto3
import json

dynamodb = boto3.client('dynamodb')

def upload():
  with open('songs.json', 'r') as sonfile:
    songs = json.load(songfile)
  for song in songs:
    response = dynamodb.put_item(
      TableName='MusicAlley',
      Item={
        'Artist':{'S': song['Artist']},
        'SongTitle':{'S': song['SongTitle']},
        'price':{'N': song['price']},
        'studio':{'S': song['studio']},
        'address':{'S': song['address']}
      }
    )
    print(response)

upload()
