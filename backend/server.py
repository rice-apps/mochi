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
        location="Fondy",
        description="Our first event",
        timestamp=datetime.date.today() + datetime.timedelta(days=1),
        users=[user1],
    )

    UserEvent.create(user=user1, event=event1)

    print("done\n")
    return user1.id

@app.route("/<username>/events/")
def upcoming_events(username):
    user = get_object_or_404(User, User.name == username)
    events = Event.get_events(user.id)
    return object_list("upcoming_events.html", events, "upcoming_events", user=user)

@app.route("/hello2/")
def hello_world():
    return "Hello2, world!\n"

if __name__ == "__main__":
    user_id = create_tables()
