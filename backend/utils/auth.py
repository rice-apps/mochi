from firebase import firebaseAdmin


class FirebaseHelper(object):

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

        except ValueError:
            raise NotAuthenticated(
                "Invalid Token"
            )
            return false
