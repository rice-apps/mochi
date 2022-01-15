import json

import psycopg2
from flask import Flask

app = Flask(__name__)


def list_to_json(lst):
    res = {}
    res["users"] = []
    for inner_list in lst:
        res_dict = {}
        res_dict["netid"], res_dict["major"], res_dict["name"] = inner_list
        res["users"].append(res_dict)
    return json.dumps(res)


@app.route("/hello/")
def hello_world():
    return "Hello, world!\n"


@app.route("/users/")
def get_users():
    conn = psycopg2.connect(
        host="localhost",
        database="postgres",
        user="postgres",
        port="3142",
        password="edmondkirsch3142",
    )
    cur = conn.cursor()
    cur.execute("SELECT * FROM users;")
    return list_to_json(cur.fetchall())


@app.route("/users/<netid>/")
def get_user(netid):
    conn = psycopg2.connect(
        host="localhost", database="postgres", user="postgres", port="3142", password=""
    )
    cur = conn.cursor()
    cur.execute("SELECT * FROM users WHERE netid = '" + str(netid) + "';")
    return list_to_json(cur.fetchall())


@app.route("/users/<netid>/")
def get_user(netid):
    conn = psycopg2.connect(
        host="localhost", database="postgres", user="postgres", port="3142", password=""
    )
    cur = conn.cursor()
    cur.execute("SELECT * FROM users WHERE netid = '" + str(netid) + "';")
    return list_to_json(cur.fetchall())


@app.route("/create_user/<netid>/<name>/<major>")
def create_user(netid, name, major):
    conn = psycopg2.connect(
        host="localhost", database="postgres", user="postgres", port="3142", password=""
    )
    cur = conn.cursor()
