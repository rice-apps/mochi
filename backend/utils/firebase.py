from firebase_admin import admin

firebaseAdmin = admin.initializeApp({
    credential: admin.credential.applicationDefault(),
    databaseURL: 'https://hedwig-279117.firebaseio.com'
})
