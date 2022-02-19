from flask import Flask, jsonify
from peewee import *
from playhouse.postgres_ext import *
import psycopg2
import uuid
import datetime

t_dbname = ''
t_user = ''
t_pw = ''
t_host = ''
t_port = ''


pg_db = PostgresqlDatabase(t_dbname, user= t_user, password= t_pw,
                           host= t_host, port= t_port)

class BaseModel(Model):
    class meta:
        database = pg_db

class User(BaseModel):
    """
    Represents user
    """
    netid = CharField(unique=True)
    name = CharField()
    college = CharField()
    year = CharField()
    major = CharField()
    interests = ArrayField(CharField)
    want_to_see_again = ArrayField(ForeignKeyField(User, backref='likes'))
    
    def get_profile(self):
        """
        Gets all public fields
        """
        return (User.select().where(User.netid == self))
     
    def get_interests(self):
        """
        Returns a mapping of interests to other people with interests
        """
        return (Interest.select().join(User).where(User.netid == netid))
    
    def get_liked_people(self):
        """
        Returns an array of people they want to see again
        """
        return (User.select().where(User.netid == self).get(User.want_to_see_again))


class Event(BaseModel):
    """
    Represents event
    """
    id = CharField(unique=True)
    location = CharField()
    description = CharField()
    time = DateTimeField()
    attendees = ArrayField(ForeignKeyField(User, backref='attending'))
    confirmed_users = ArrayField(ForeignKeyField(User, backref='attending'))

    def attendance_percentage(id):
        """
        confirmed_users / attendees
        """
        return (Event.select().where(Event.id == id).get(Event.attendees).count() / 5)


class Interest(BaseModel):
    """
    Represents an interest
    """
    title = CharField(unique=True)
    description = CharField()
    participants = ArrayField(ForeignKeyField(User, backref='interested_in'))


app = Flask(__name__)


def create_tables():
    with pg_db:
        pg_db.create_tables([User, Event, Interest])


@app.route('/{netid}', methods=['GET'])
def get_public_info(netid):
    user = User.get(User.netid == netid)
    return {'netid': user.netid,
    'name': user.name,
    'college': user.college,
    'year': user.year,
    'interests': user.intersts
    }

@app.route('/register', methods=['GET', 'POST'])
def new_user():
    if request.method == 'POST' and request.form['username']:
        try:
            with pg_db.atomic():
                user = User.create(
                    username=request.form['username'],
                    password=md5((request.form['password']).encode('utf-8')).hexdigest(),
                    email=request.form['email'],
                    join_date=datetime.datetime.now())

            # mark the user as being 'authenticated' by setting the session vars
            auth_user(user)
            return redirect(url_for('homepage'))

        except IntegrityError:
            flash('That username is already taken')

    return render_template('join.html')
 
@app.route('/events', methods=['GET'])
def get_upcoming_events():
    output = []
    event = Event.get(Event.time > dateime.now())
    for e in event:
        output.append({
            'location': event.location,
            'description': event.description,
            'time': event.time,
        })
    return output

@app.route('/{netid}/{event_id}', methods=['POST', 'GET'])
def create_new_event(netid, event_id):
