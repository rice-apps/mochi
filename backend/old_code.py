# @app.route("/add_interests/<netid>/", methods=['POST', 'GET'])
# def add_interests(netid):
#     try:
#         interest_json = request.json
#         interest_data = json.loads(interest_json)
#         interests = User.get().where(User.netid == netid).interests
#         for interest in interest_data:
#             interests.append(interest)
#         qry = User.update({User.interests:interests}).where(User.netid == netid)
#         qry.execute()
#         return True
#     except:
#         return False

# @app.route("/confirm_attendance/<netid>/<eventid>/", methods=['POST'])
# def confirm_attendancce(netid, eventid):
#     try:
#         attendance_json = request.json
#         attendance_data = json.loads(attendance_json)
#         if attendance_data == False:
#             User = User.get().where(User.netid == netid)
#             Event = Event.get().where(Event.id == eventid)
#             deletedEvent = UserEvent.get().where(UserEvent.user == User, UserEvent.event == Event)
#             qry = UserEvent.delete().where(UserEvent == deletedEvent)
#             qry.execute()
#         return True
#     except:
#         return False

# @app.route("/join_event/", methods=['POST'])
# def join_events(netid, eventid):
#     '''
#     Takes a URL with param "netid" and "eventid".
#     '''
#     netid = request.args.get('netid')
#     eventid = request.args.get('eventid')
#     try:
#         UserEvent.create(
#         user = User.get_user_from_netid(netid, False),
#         event = Event.get_event_from_id(eventid, False),
#         location = "",
#         group = -1
#         )
#     except:
#         return False