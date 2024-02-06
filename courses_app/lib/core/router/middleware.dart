import 'package:courses_app/constants/sharedpreference_key.dart';
import 'package:courses_app/core/extension/extensions.dart';
import 'package:courses_app/core/global/global.dart';
import 'package:courses_app/core/router/app_routes_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppMiddleWare {
  static final SharedPreferences _sharedPreferences = GlobalServices.localStorage.inst;
  static bool _onBoarding() {
    return _sharedPreferences.getBool(AppStorageKey.deviceOpenFirstTime) ?? false;
  }

  static bool _isSignedIn() {
    'isSignedIn - FbAuth'.prt;
    if (FirebaseAuth.instance.currentUser == null) {
      'User is currently signed out!'.pr;
      return false;
    } else {
      'User is signed in!'.pr;
      return true;
    }
  }

  static String? middlleware(String? routeName) {
    if (routeName == AppRoutesNames.welcome) {
      if (_onBoarding()) {
        if (_isSignedIn()) {
          'middleware redirect the app to mainpage screen'.prt;
          return AppRoutesNames.mainPage;
        } else {
          'middleware redirect the app to signin screen'.prt;
          return AppRoutesNames.signin;
        }
      }
    }
    return routeName;
  }
}
