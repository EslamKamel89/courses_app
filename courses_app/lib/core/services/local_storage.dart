import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences inst;
  Future<LocalStorage> init() async {
    inst = await SharedPreferences.getInstance();
    return this;
  }
}
