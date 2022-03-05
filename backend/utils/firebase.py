import firebase_admin
from firebase_admin import credentials

cred = credentials.ApplicationDefault()

firebaseAdmin = firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://hedwig-279117.firebaseio.com'
})
