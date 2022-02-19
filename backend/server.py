from flask import Flask, jsonify
from peewee import *
import psycopg2

app = Flask(__name__)

t_host = "localhost"
t_port = "5432"
t_dbname = "postgres"
t_user = "postgres"
t_pw = "JustinPfister2"

@app.route("/", methods=['GET'])
def retrieve_users():
    conn = psycopg2.connect(host=t_host, port=t_port, dbname=t_dbname, user=t_user, pw=t_pw)
    db_cursor = conn.cursor()
    command = "SELECT name FROM users"
    db_cursor.execute(command)
    list_of_users = db_cursor.fetchall()
    print(list_of_users)
    return str(list_of_users)

if __name__ == '__main__':
    app.run()

