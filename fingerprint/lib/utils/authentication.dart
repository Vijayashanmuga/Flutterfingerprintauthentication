import 'package:local_auth/local_auth.dart';
// import 'package:fingerprint/pagetwo.dart';

class Authentication {
  static final _auth = LocalAuthentication();
  // final LocalAuthentication auth = LocalAuthentication();

  static Future<bool> canAuthenticate() async {
    return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
  }

  static Future<bool> authentication() async {
    try {
      if (!await canAuthenticate()) return false;
      return await _auth.authenticate(localizedReason: "get into the app");
    } catch (e) {
      print('error $e');
      return false;
    }
    // return true;
  }
}
