import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/app_contact.dart';

class UserSharedPreferences {
  static late SharedPreferences _preferences;

  static const String _keyMobile = "mobile";
  static const String _keyName = "name";
  static const String _keyBalance = "balance";
  static const String _keyPassword = "password";
  static const String _keyEmail = "email";
  static const String _keyToken = "token";
  static const String _keyImageUrl = "imageUrl";
  static const String _keySign = "sign";
  static const String _keyContacts = "contacts";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future clearAllData() async =>
      await _preferences.clear();

  // gets
  static String? getMobile() =>
      _preferences.getString(_keyMobile);

  static String? getName()  =>
      _preferences.getString(_keyName);

  static double? getBalance()  =>
      _preferences.getDouble(_keyBalance);

  static String? getPassword()  =>
      _preferences.getString(_keyPassword);

  static String? getEmail() =>
      _preferences.getString(_keyEmail);

  static String? getToken() =>
      _preferences.getString(_keyToken);

  static String? getImageUrl() =>
      _preferences.getString(_keyImageUrl);

  static bool? getSign() =>
      _preferences.getBool(_keySign);

  static List<AppContact> getContacts() {
    String? contactsString = _preferences.getString(_keyContacts);
    if(contactsString != null && contactsString.isNotEmpty){
      try {
        final List<AppContact> contacts = json.decode(contactsString);
        if(contacts.isNotEmpty){
          return contacts;
      }
      } catch (e) {
        return [];
      }
    }
    return [];
  }

  // sets
  static Future setMobile(String mobile) async =>
      await _preferences.setString(_keyMobile, mobile);

  static Future setName(String name) async =>
      await _preferences.setString(_keyName, name);

  static Future setBalance(double balance) async =>
      await _preferences.setDouble(_keyBalance, balance);

  static Future setPassword(String password) async =>
      await _preferences.setString(_keyPassword, password);

  static Future setEmail(String email) async =>
      await _preferences.setString(_keyEmail, email);

  static Future setToken(String token) async =>
      await _preferences.setString(_keyToken, token);

  static Future setImageUrl(String imageUrl) async =>
      await _preferences.setString(_keyImageUrl, imageUrl);

  static Future setSign(bool sign) async =>
      await _preferences.setBool(_keySign, sign);

  static Future setContacts(List<AppContact> contacts) async{
    String contactsString = json.encode(contacts);
    await _preferences.setString(_keyContacts, contactsString);
  }

}
