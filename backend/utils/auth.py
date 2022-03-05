import xmltodict
import jwt
import urllib


def createToken(user):
    token = jwt.encode({"netid": user[netid]},
                       "secret", algorithm="HS256")
    return token


def verifyToken(token):
    try:
        payload = jwt.decode(token, "secret", algorithms=["HS256"])
        netid = payload['netid']
        return {"success": True, "netid": netid}
    except:
        print("Error decoding jwt token")
        return {"success": False}


def authenticateTicket(idToken):
    try:
        decoded_token = verifyToken(idToken)
        netid = decoded_token['netid']
        return {"success": True, "netid": netid}
    except:
        print("Error authenticating jwt token")
        return {"success": False}


def login_auth(ticket):
    file = urllib.request.urlopen(
        'https://idp.rice.edu/idp/profile/cas/serviceValidate?ticket={ticket}&service=http://localhost:3000')
    data = file.read()
    file.close()

    data = xmltodict.parse(data)
    netid = data['cas:serviceResponse']['cas:authenticationSuccess']['cas:user']
    return netid
