import datetime
from server import User, UserEvent, Event;
import json

f = open('testData.json')

# Cleans up previous data.
UserEvent.delete().execute()
User.delete().execute()
Event.delete().execute()

 
# returns JSON object as
# a dictionary
data = json.load(f)

# Populates testUser
users = data["users"]
for user in users:
    User.create(**user)

# populates testEvents
events = data["events"]
for event in events:
    event["timestamp"] = datetime.datetime.now() + datetime.timedelta(days = 10)
    event["users"] = []
    Event.create(**event)