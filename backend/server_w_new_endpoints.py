import json

from flask import Flask

app = Flask(__name__)

import datetime

from peewee import *
from playhouse.postgres_ext import *

pg_db = PostgresqlExtDatabase("postgres", user="postgres", password="", host = "localhost", port=3142)

class BaseModel(Model):
    class Meta:
        database = pg_db


class User(BaseModel):
    name = CharField()
    college = CharField()
    year = CharField()
    major = CharField()
    interests = ArrayField(CharField)
    netid = CharField()

class Event(BaseModel):
    id = CharField()
    location = CharField()
    description = TextField()
    timestamp = DateTimeField(default=datetime.datetime.now)

    def get_events(user_id):
        events = (
            Event.select()
            .where(Event.timestamp > datetime.datetime.now())
            .join(UserEvent)
            .join(User)
            .where(User.id == user_id)
            .order_by(Event.timestamp)
        )

        for event in events:
            print(event.description)

class UserEvent(BaseModel):
    user = ForeignKeyField(User, backref="user_events")
    event = ForeignKeyField(Event, backref="event_users")

@app.route("/create_tables/")
def create_tables():
    pg_db.create_tables([User, Event, UserEvent], safe=True)

    user1 = User.create(
        name="Rajesh",
        college="brown",
        year="2023",
        major="Computer Science",
        interests=["Coding", "Rock Climbing"],
    )
    event1 = Event.create(
        id = "001",
        location="Fondy",
        description="Our first event",
        timestamp=datetime.date.today() + datetime.timedelta(days=1),
        users=[user1],
    )

    UserEvent.create(user=user1, event=event1)

    print("done\n")
    return user1.id

"""
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/                                                                                                                        /
/                                                   NEW ENDPOINTS                                                        /
/                                                                                                                        /
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
"""


@app.route("/join_event/<netid>/<eventid>/", methods=['POST'])
def join_events(netid, eventid):
    event = Event.select().where(id=eventid).join(UserEvent).update()

@app.route("add_interests/<netid>/", methods=['POST', 'GET'])
def add_interests(netid):
    if request
    list_of_interests = []
    word = ""
    for char in interests:
        if char != ",":
            word = word + char
        else:
            list_of_interests.append(word)
            word = ""
    list_of_interests.append(word)
    old_interests = [user.username for user in User.select().where(User.id == netid).]
    user = User.select().where(User.id == netid).update()

if __name__ == "__main__":
    user_id = create_tables()