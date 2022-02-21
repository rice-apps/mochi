from playhouse.postgres_ext import *
from peewee import *
import datetime
import json

from flask import Flask
from flask import request
app = Flask(__name__)


pg_db = PostgresqlExtDatabase("postgres", user="postgres",
                              password="edmondkirsch3142", host="localhost", port=3142)


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

    def get_users():
        users = User.select()

        user_list = []

        # Add each user as a JSON to the output list
        for user in users:
            print(user.netid)
            user_list.append(
                json.dumps(
                    {"name": user.name,
                    "college": user.college,
                    "year": user.year,
                    "major": user.major,
                    "interests": user.interests,
                    "netid": user.netid
                    }))
        
        return str(user_list)


class Event(BaseModel):
    location = CharField()
    description = TextField()
    timestamp = DateTimeField(default=datetime.datetime.now)

    def get_events(netid):
        events = (
            Event.select()
            .where(Event.timestamp > datetime.datetime.now())
            .join(UserEvent)
            .join(User)
            .where(User.netid == netid)
            .order_by(Event.timestamp)
        )

        event_list = []

        # Add each event as a JSON to the output list
        for event in events:
            print(event.description)
            event_list.append(json.dumps({"location": event.location,
                                          "description": event.description,
                                          "timestamp": str(event.timestamp)
                                          }))

        return str(event_list)


class UserEvent(BaseModel):
    user = ForeignKeyField(User, backref="user_events")
    event = ForeignKeyField(Event, backref="event_users")


@app.route("/create_tables/")
def create_tables():
    pg_db.drop_tables([User, Event, UserEvent], safe=True)
    pg_db.create_tables([User, Event, UserEvent], safe=True)

    user1 = User.create(
        name="Rajesh",
        college="brown",
        year="2023",
        major="Computer Science",
        netid="rj",
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
    return str(user1.id)


@app.route("/<netid>/events/")
def upcoming_events(netid):
    events = Event.get_events(netid)
    return events

@app.route("/users/")
def get_users():
    users = User.get_users()
    return users

@app.route("/create_user/", methods = ["POST"])
def create_user():
    try:
        user_data = request.json
        User.create(
            name=user_data["name"],
            college=user_data["college"],
            year=user_data["year"],
            major=user_data["major"],
            netid=user_data["netid"],
            interests=user_data["interests"]
        )
        return str(True)
    except Exception as e:
        print(e)
        return str(False)
    

@app.route("/hello2/")
def hello_world():
    return "Hello2, world!\n"

if __name__ == "__main__":
    user_id = create_tables()
