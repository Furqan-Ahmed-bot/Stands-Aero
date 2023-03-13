import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  static DataStorage? _dataStorage;
  SharedPreferences? _pref;
  bool isLoggedIn = false;

  static DataStorage get getInstance => _dataStorage ?? DataStorage();

  initPref() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  Future<bool> getSession() async {
    try {
      log('getSession called');
      await initPref();
      isLoggedIn = _pref!.getBool('logged_in') ?? false;
      log('getSession isLoggedIn : $isLoggedIn');
      return isLoggedIn;
    } on Exception catch (e) {
      log('getSession exception : $e');
      return false;
    }
  }

  setSession() async {
    await initPref();
    _pref!.setBool('logged_in', true);
  }

  clearSession() async {
    await initPref();
    _pref!.clear();
  }
}
