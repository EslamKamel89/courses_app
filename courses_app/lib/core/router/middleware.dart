import 'package:courses_app/constants/sharedpreference_key.dart';
import 'package:courses_app/core/extension/extensions.dart';
import 'package:courses_app/core/global/global.dart';
import 'package:courses_app/core/router/app_routes_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppMiddleWare {
  static final SharedPreferences _sharedPreferences = GlobalServices.localStorage.inst;
  static bool _onBoarding() {
    return _sharedPreferences.getBool(AppStorageKey.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  static String? middlleware(String? routeName) {
    if (routeName == AppRoutesNames.welcome) {
      if (_onBoarding()) {
        'middleware redirect the app to signin screen'.prt;
        return AppRoutesNames.signin;
      }
    }
    return routeName;
  }
}
