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