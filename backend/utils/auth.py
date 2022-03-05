import xmltodict
import jwts
config = {
    CASValidateURL: 'https://idp.rice.edu/idp/profile/cas/serviceValidate'
}


def createToken(user):
    token = jwt.encode({id: user._id, netid: user.netid},
                       "secret", algorithm="HS256")
    return token


def verifyToken(token):
    try:
        decoded = jwt.decode(token, "secret", algorithms=["HS256"])
        return {success: true, id: decoded[id]}
    except:
        print("Error decoding jwt token")
