import xmltodict
import jwt

config = {
    CASValidateURL: 'https://idp.rice.edu/idp/profile/cas/serviceValidate'
}


def createToken(user):
    token = jwt.encode({"id": user._id, "netid": user.netid},
                       "secret", algorithm="HS256")
    return token


def verifyToken(token):
    try:
        payload = jwt.decode(token, "secret", algorithms=["HS256"])
        id = payload.get('id')
        return {"success": True, "id": id}
    except:
        print("Error decoding jwt token")
        return {"success": False}
