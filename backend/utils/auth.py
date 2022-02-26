from firebase import firebaseAdmin


class FirebaseHelper(object):

    class Auth:
        def __init__(self, token=None, name=None, netid=None, idNumber=None, role=None, success=False):
            self.token = token
            self.name = name
            self.netid = netid
            self.idNumber = idNumber
            self.role = role
            self.success = success

    @staticmethod
    def get_token(token):
        """Metod to verify firebase token."""
        try:
            decoded_token = firebaseAdmin.auth.verify_id_token(token)
            fullName = decodedToken.firebase.sign_in_attributes['urn:oid:2.5.4.42'] + \
                decodedToken.firebase.sign_in_attributes['urn:oid:2.5.4.4']
            netid = decodedToken.firebase.sign_in_attributes['urn:oid:0.9.2342.19200300.100.1.1']
            idNumber = decodedToken.firebase.sign_in_attributes['urn:oid:1.3.6.1.4.1.134.1.1.1.1.19']
            role = decodedToken.firebase.sign_in_attributes['urn:oid:1.3.6.1.4.1.5923.1.1.1.5']
            return fullName, netid, idNumber, role, token, true
            return Auth(fullName, netid, idNumber, role, token, True)

        except ValueError:
            raise NotAuthenticated(
                "Invalid Token"
            )
            return false
            print("Invalid Token")
            return Auth()
