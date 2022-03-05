from playhouse.postgres_ext import *
from peewee import *
import datetime
import json

from flask import Flask
from flask import request
app = Flask(__name__)


pg_db = PostgresqlExtDatabase("postgres", user="postgres",
                              password="edmondkirsch3142", host="localhost", port=3142)

def get_JSON_from_events(events):
    event_list = []

    # Add each event as a JSON to the output list
    for event in events:
        event_list.append(json.dumps(
            {"location": event.location,
            "description": event.description,
            "timestamp": str(event.timestamp),
            "users": event.users,
            "id": event.id
            }))

    return json.dumps(event_list)

def get_JSON_from_users(users):
    user_list = []

    # Add each user as a JSON to the output list
    for user in users:
        user_list.append(
            json.dumps(
                {"name": user.name,
                "college": user.college,
                "year": user.year,
                "major": user.major,
                "interests": user.interests,
                "netid": user.netid
                }))
    
    return json.dumps(user_list)

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
        return get_JSON_from_users(users)

    def get_user_from_netid(netid, return_json = True):
        try:
            users = User.select().where(User.netid == netid)
            if return_json:
                return get_JSON_from_users(users)
            else:
                return users
        except Exception as e:
            print(e)
            return str(None)

class Event(BaseModel):
    location = CharField()
    description = TextField()
    timestamp = DateTimeField(default=datetime.datetime.now)
    users = ArrayField(CharField)

    def get_all_upcoming_events():
        events = (
            Event.select()
            .where(Event.timestamp > datetime.datetime.now())
            .order_by(Event.timestamp)
        )
        return get_JSON_from_events(events)

    def get_events(netid):
        '''
        Retrieves a list of upcoming events that a user is registered for.
        '''
        events = (
            Event.select()
            .where(Event.timestamp > datetime.datetime.now())
            .join(UserEvent)
            .join(User)
            .where(User.netid == netid)
            .order_by(Event.timestamp)
        )

        return get_JSON_from_events(events)
    
    def get_event_from_id(ID, return_json = True):
        try:
            event = (
            Event.select()
            .where(Event.id == ID)
        )
            if return_json:
                return get_JSON_from_events(event)
            else:
                return event
        except Exception as e:
            print(e)
            return str(None)

class UserEvent(BaseModel):
    user = ForeignKeyField(User, backref="user_events")
    event = ForeignKeyField(Event, backref="event_users")
    location = CharField()
    group = IntegerField()

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
        users=[user1.netid],
    )

    event2 = Event.create(
        location="Brochstein",
        description="Our second event",
        timestamp=datetime.date.today() + datetime.timedelta(days=2),
        users=[],
    )

    print("Added users and events")

    UserEvent.create(user=user1, event=event1)

    print("Added userEvent row\n")
    return str(user1.id)

@app.route("/<netid>/events/")
def upcoming_events(netid):
    events = Event.get_events(netid)
    return events

@app.route("/events/")
def all_upcoming_events():
    events = Event.get_all_upcoming_events()
    return events

@app.route("/event/<uniqueID>")
def get_event_from_id(uniqueID):
    event = Event.get_event_from_id(uniqueID)
    return event

@app.route("/users/")
def get_users():
    users = User.get_users()
    return users

@app.route("/user/<netid>")
def get_user_from_netid(netid):
    user = User.get_user_from_netid(netid)
    return user

@app.route("/create_user/", methods = ["POST"])
def create_user():
    '''
    Creates a user and returns a boolean confirmation (as a string)
    '''
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

@app.route("/create_event/", methods = ["POST"])
def create_event():
    '''
    Creates an event and returns a boolean confirmation (as a string)
    '''
    try:
        event_data = request.json
        Event.create(
            location = event["location"],
            description = event["description"],
            timestamp = event["timestamp"],
            users = event["users"]
        )
        return str(True)
    except Exception as e:
        print(e)
        return str(False)

@app.route("/signup/<userID>/<eventID>")
def signup_for_event(userID, eventID):
    '''
    Signs a user up for an event
    Inputs:
        userID: netid of the user
        eventID: event ID of the event the user is signing up for
    Outputs:
        "Done" if signup successful, an error message if unsuccessful
    '''

    try:
        user = json.loads(json.loads(User.get_user_from_netid(userID))[0])
    except:
        return "User not found"

    try:
        event = json.loads(json.loads(Event.get_event_from_id(eventID))[0])
    except:
        return "Event not found"
    
    print("User:", user)
    print("Event:", event)
    print("Event users:", event["users"], type(event["users"]))
    attending = event["users"]
    if (userID in attending):
        return "Error: User already signed up for event"
    attending.append(userID)
    Event.update({
        Event.users:attending})\
        .where(Event.uniqueID == eventID)\
        .execute()

    UserEvent.create(
            user = User.get_user_from_netid(userID, False),
            event = Event.get_event_from_id(eventID, False)
        )
    
    return "Done"

@app.route("/update_interests/", methods = ["POST"])
def update_interests():
    """
    Updates the interests of a given user.
        Inputs: JSON with a "userID" field (string) and an "interests" field (list of strings)
        Outputs: Boolean confirmation(as a string)
    """
    try:
        interest_data = request.json
        User.update({
        User.interests:interest_data["interests"]})\
        .where(User.netid == interest_data["userID"])\
        .execute()
        return str(True)

    except Exception as e:
        return str(False)

@app.route("/hello/")
def hello_world():
    return "Hello, world!\n"

if __name__ == "__main__":
    user_id = create_tables()
