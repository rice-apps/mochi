from playhouse.postgres_ext import *
from peewee import *
import datetime
import json

from flask import Flask
from flask import request
app = Flask(__name__)

from utils import auth
from matching import matching

pg_db = PostgresqlExtDatabase("postgres", user="postgres",
                              password="edmondkirsch3142", host="localhost", port=3142)

# TODO: create_size, assigning demand and sorting by demand, how far away two users are

def get_JSON_from_events(events):
    event_list = []

    # Add each event as a JSON to the output list
    for event in events:
        event_list.append(json.dumps(
            {"location": event.location,
            "sublocations": event.sublocations,
            "description": event.description,
            "timestamp": str(event.timestamp),
            "users": event.users,
            "groupsize": event.groupsize,
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
    netid = CharField(primary_key = True)

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
            return "Error: User not found"

class Event(BaseModel):
    location = CharField()
    sublocations = ArrayField(CharField)
    description = TextField()
    timestamp = DateTimeField(default=datetime.datetime.now)
    users = ArrayField(CharField)
    groupsize = CharField()

    def get_all_events():
        events = Event.select()
        return get_JSON_from_events(events)

    def get_all_upcoming_events():
        events = (
            Event.select()
            .where(Event.timestamp > datetime.datetime.now() + datetime.timedelta(days=1))
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
            return "Error: Event not found"
    
    def get_event_groupsize(id):
        try:
            groupsize_str = json.loads(json.loads(Event.get_event_from_id(id))[0])["groupsize"]
            groupsizes = groupsize_str.split("-")
            assert len(groupsizes) <= 2

            groupsizes[0] = int(groupsizes[0])

            # If only one size given, assume it is lower bound
            if len(groupsizes) == 1:
                return (groupsizes[0], float('inf'))

            if groupsizes[1] == 'inf':
                groupsizes[1] = float('inf')
            else:
                groupsizes[1] = int(groupsizes[1])
            
            return tuple(groupsizes)
        except:
            return "Error: Event not found or groupsize formatted incorrectly"

class UserEvent(BaseModel):
    user = ForeignKeyField(User, backref="user_events")
    event = ForeignKeyField(Event, backref="event_users")
    location = CharField()
    group = IntegerField()

    def get_users_from_user_event(event):
        '''
        Return a JSON array of attendees mapped to their interests
        '''
        try:
            attendees = dict()
            user_events = (UserEvent.select().where(UserEvent.event == event))
            for user_event in user_events:
                attendees[user_event.user.netid] = user_event.user.interests
            return json.dumps(attendees)
        except:
            return "Error: Event not found"
    
    def get_user_events():
        res = []
        user_events = (UserEvent.select())
        for user_event in user_events:
            res.append({
            'netid': user_event.user.netid,
            'eventid': user_event.event.id,
            'location': user_event.event.location,
            'sublocation': user_event.location,
            'group': user_event.group
            })
        return str(json.dumps(res))

@app.route("/hello/")
def hello_world():
    return "Hello, world!\n"

@app.route("/create_tables/")
def create_tables():
    pg_db.drop_tables([User, Event, UserEvent], safe=True)
    pg_db.create_tables([User, Event, UserEvent], safe=True)

    user1 = User.create(
        name="Rajesh",
        college="Wiess",
        year="2023",
        major="Computer Science",
        netid="rj",
        interests=["Coding", "Rock Climbing"],
    )

    user2 = User.create(
        name="Taha Hasan",
        college="Brown",
        year="2024",
        major="Computer Science",
        netid="th43",
        interests=["Chess", "Poker", "Music"],
    )

    event1 = Event.create(
        location="Fondy",
        sublocations = [],
        description="Our first event",
        timestamp=datetime.datetime.now() + datetime.timedelta(days=1),
        users=[user1.netid],
        groupsize = "3-5"
    )

    event2 = Event.create(
        location="Brochstein",
        sublocations = [],
        description="Our second event",
        timestamp=datetime.datetime.now() + datetime.timedelta(days=2),
        users=[],
        groupsize = "2-6"
    )

    print("Added users and events")

    UserEvent.create(user=user1, event=event1, location = "Room 100", group = 0)

    print("Added userEvent row\n")
    return "Done"

@app.route("/<netid>/events/")
def upcoming_events(netid):
    events = Event.get_events(netid)
    return events

@app.route("/events/")
def all_upcoming_events():
    events = Event.get_all_upcoming_events()
    return events

@app.route("/all_events/")
def all_events():
    return Event.get_all_events()

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

@app.route("/user_events")
def get_user_events():
    user_events = UserEvent.get_user_events()
    return user_events

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
        event = request.json

        if "sublocations" not in event:
            event["sublocations"] = [event["location"]]
        if "users" not in event:
            event["users"] = []
        Event.create(
            location = event["location"],
            description = event["description"],
            timestamp = event["timestamp"],
            users = event["users"],
            sublocations = event["sublocations"],
            groupsize = event["groupsize"]
        )
        return str(True)
    except Exception as e:
        print(e)
        return str(False)

@app.route("/signup/")
def signup_for_event():
    '''
    Signs a user up for an event
    Inputs:
        userID: netid of the user
        eventID: event ID of the event the user is signing up for
    Outputs:
        "Done" if signup successful, an error message if unsuccessful
    '''
    userID = request.args.get('netid')
    eventID = request.args.get('eventid')
    if not userID:
        return "Error: No user ID provided"
    if not eventID:
        return "Error: No event ID provided"
    
    if Event.get(Event.id == eventID).timestamp < datetime.datetime.now() + datetime.timedelta(days=1):
        return "Error: Cannot sign up for events within one day"
    try:
        user = json.loads(json.loads(User.get_user_from_netid(userID))[0])
    except:
        return "Error: User not found"

    try:
        event = json.loads(json.loads(Event.get_event_from_id(eventID))[0])
    except:
        return "Error: Event not found"
    
    print("User:", user)
    print("Event:", event)
    print("Event users:", event["users"], type(event["users"]))
    attending = event["users"]
    if (userID in attending):
        return "Error: User already signed up for event"
    attending.append(userID)
    Event.update({
        Event.users:attending})\
        .where(Event.id == eventID)\
        .execute()

    UserEvent.create(
            user = User.get_user_from_netid(userID, False),
            event = Event.get_event_from_id(eventID, False),
            location = "",
            group = -1
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

def get_attendees(eventid):
    '''
    Takes an eventid and returns an JSON array of users attending
    '''
    if eventid:
        try:
            attendees = []
            event = Event.get_event_from_id(eventid, False)[0]
            return UserEvent.get_users_from_user_event(event)
        except:
            return "Error: Event not found"
    else:
        return "Error: No event ID provided"

@app.route("/get_attendance/", methods=['GET'])
def get_attendance():
    eventid = request.args.get('eventid')
    return get_attendees(eventid)

@app.route("/run_matching/", methods = ['POST', 'GET'])
def run_matching():
    eventid = request.args.get('eventid')
    if not eventid:
        return "Error: no eventid provided"
    try:
        attendees = json.loads(get_attendees(eventid))
    except:
        return "Error: event not found"
    print(attendees)

    try:
        lower, upper = Event.get_event_groupsize(eventid)
        matchings = matching(lower, upper, attendees)
        print(matchings)
        
        event_data = json.loads(json.loads(Event.get_event_from_id(eventid))[0])
        print(event_data)
        location = event_data["location"]
        sublocations = event_data["sublocations"]

        for i in range(len(matchings)):
            if i >= len(sublocations):
                sublocation = location
            else:
                sublocation = sublocations[i]
            for userID in matchings[i]:
                UserEvent.update({"location":sublocation, "group":i})\
                    .where(UserEvent.user == User.get_user_from_netid(userID, False)\
                    and UserEvent.event == Event.get_event_from_id(eventid, False)).execute()
        
        return json.dumps(matchings)
    except:
        return "Eror: could not run matching algorithm"

@app.route("/login_profile/<netid>/", methods=['GET'])
def login_profile(netid):
    user = User.get_user_from_netid(netid)
    return user[0]

if __name__ == "__main__":
    user_id = create_tables()
    print(user_id)
    
@app.route("/login/<ticket>")
def login(ticket):
    netid = auth.login_auth(ticket)
    return auth.createToken({"netid": netid})
