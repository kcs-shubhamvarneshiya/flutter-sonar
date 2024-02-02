
/* This is Class define for all Domain Information or Baseurl used in the project or API endpoints */

class Apis {
  ///----------------- Webservice  API URL --------------------------------------
  static const DOMAIN = 'https://api.uat.bapsapps.org/sso/api/';
  static const String validate = '${DOMAIN}user/validate/token';
  static const String logout = '${DOMAIN}user/logout';
  static const ssoURL = "https://sso.uat.na.bapsapps.org/";


  /// ------------| API Constant  |-----------

  static const String token ='keySSOUserTokenPref';
  static const String apptoken ='token';
  static const String authorization ='Authorization';
  static const String contentType ='Content-Type';
  static const String jsonType ='application/json';


  static const clientID = "70F4C896-AF25-46D3-917E-003FD81854CF";
  static const secretKey = "8AFAF17F-9446-424F-A293-16CCFCE7D4E3";
  static const auth = "auth";
  static const refreshToken = "refreshToken";
  static const statusCode = 200;
}

