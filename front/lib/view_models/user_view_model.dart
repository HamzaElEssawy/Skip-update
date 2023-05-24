import 'dart:convert';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/foundation.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:skip/core/utils/url_contsants.dart';
import 'package:skip/repos/api_status.dart';
import 'package:skip/repos/code_service.dart';
import 'package:skip/repos/sign_service.dart';

import '../core/user_shared_preferences.dart';
import '../core/utils/exception_constants.dart';
import '../models/app_contact.dart';
import '../repos/contacts_service.dart';


class UserViewModel with ChangeNotifier {
  bool _loading = false;
  String _mobile = "";
  Country _country = const Country(
    name: "Egypt",
    flag: "🇪🇬",
    code: "EG",
    dialCode: "20",
    minLength: 10,
    maxLength: 10,
  );
  String _name = "";
  String _email = "";
  String _password = "";
  String _token = "";
  String _imageUrl = "";
  bool _imageUrlExists = false;
  double _balance = 0.0;
  List<AppContact> contacts = <AppContact>[];

  // TODO biometric authentication feature
  // String finger_print = "";

  bool isSuccessfulCheckPhone = false;
  bool isSuccessfulCodeResponse = false;
  bool isSuccessfulSignUpResponse = false;
  bool isSuccessfulSignInResponse = false;
  late ApiResponse apiResponse;

  bool get loading => _loading;
  String get mobile => _mobile;
  Country get country => _country;
  String get password => _password;
  String get name => _name;
  String get email => _email;
  String get token => _token;
  String get imageUrl => _imageUrl;
  bool get imageUrlExists => _imageUrlExists;
  double get balance => _balance;

  setLoading(bool loading) {
    _loading = loading;
    // notifyListeners();
  }

  set mobile(String mobile) {
    _mobile = mobile;
    // notifyListeners();
  }

  set country(Country country) {
    _country = country;
    // notifyListeners();
  }

  set password(String password) {
    _password = password;
    // notifyListeners();
  }

  set name(String name) {
    _name = name;
    // notifyListeners();
  }

  set email(String email) {
    _email = email;
    // notifyListeners();
  }

  set balance(double balance) {
    _balance = balance;
    // notifyListeners();
  }

  set token(String token) {
    _token = token;
    // notifyListeners();
  }

  set imageUrl(String imageUrl) {
    _imageUrl = imageUrl;
    // notifyListeners();
  }

  set imageUrlExists(bool imageUrlExists) {
    _imageUrlExists = imageUrlExists;
    // notifyListeners();
  }

  checkPhone() async {
    setLoading(true);
    var response = await CodeService.checkPhone(mobile);
    if (response is Success) {
      isSuccessfulCheckPhone = true;
    }
    if (response is Failure) {
      isSuccessfulCheckPhone = false;
      apiResponse = response;
    }
    setLoading(false);
  }

  codeResponse(String code) async {
    setLoading(true);
    var response = await CodeService.codeResponse(mobile, code);
    if (response is Success) {
      isSuccessfulCodeResponse = true;
    }
    if (response is Failure) {
      isSuccessfulCodeResponse = false;
      apiResponse = response;
    }
    setLoading(false);
  }

  signUp() async {
    setLoading(true);
    var response = await SignService.signUp(name, email, mobile, password);
    if (response is Success) {
      isSuccessfulSignUpResponse = true;
      token = json.decode(response.body)['access'];
      await persistUserData();
    }
    if (response is Failure) {
      isSuccessfulSignUpResponse = false;
      apiResponse = response;
    }
    setLoading(false);
  }

  signIn() async {
    setLoading(true);
    var response = await SignService.signIn(mobile, password);
    if (response is Success) {
      isSuccessfulSignInResponse = true;
      token = json.decode(response.body)['access'];
      name = json.decode(response.body)['full_name'] ?? "";
      balance = json.decode(response.body)['balance'] ?? "";
      email = json.decode(response.body)['email'] ?? "";
      var imageReceived = json.decode(response.body)['image'];
      if (imageReceived == null ||
          (imageReceived != null && imageReceived.isEmpty)) {
        imageUrl = "";
        imageUrlExists = false;
      } else {
        imageUrl = UrlConstants.SERVER_ROOT_URL + imageReceived;
        imageUrlExists = true;
      }
      await persistUserData();
    }
    if (response is Failure) {
      isSuccessfulSignInResponse = false;
      apiResponse = response;
    }
    setLoading(false);
  }

  persistUserData() async {
    await UserSharedPreferences.clearAllData();
    await UserSharedPreferences.setName(name);
    await UserSharedPreferences.setBalance(balance);
    await UserSharedPreferences.setPassword(password);
    await UserSharedPreferences.setEmail(email);
    await UserSharedPreferences.setMobile(mobile);
    await UserSharedPreferences.setToken(token);
    await UserSharedPreferences.setImageUrl(imageUrl);
    await UserSharedPreferences.setSign(true);
  }

  reloadUserData() async {
    setLoading(true);
    name = UserSharedPreferences.getName() ?? "";
    password = UserSharedPreferences.getPassword() ?? "";
    email = UserSharedPreferences.getEmail() ?? "";
    mobile = UserSharedPreferences.getMobile() ?? "";
    balance = UserSharedPreferences.getBalance() ?? 0.0;
    token = UserSharedPreferences.getToken() ?? "";
    imageUrl = UserSharedPreferences.getImageUrl() ?? "";
    imageUrlExists = imageUrl.isNotEmpty;
    setLoading(false);
    // notifyListeners();
  }

  isValidPassword(String pass) {
    if (password.isEmpty) {
      password = UserSharedPreferences.getPassword() ?? "";
    }
    if (password.isEmpty) {
      return false;
    }
    return password == pass;
  }

  getAndLoadContacts() async{
    setLoading(true);
    var response = await ContactsApiService.getContacts(token);
    try{
      var responseContacts = json.decode(response.body)['data'];
      contacts.clear();
      for (var item in responseContacts) {
        contacts.add(AppContact(item['full_name'], item['phone'], UrlConstants.SERVER_ROOT_URL + item['image']));
      }
      UserSharedPreferences.setContacts(contacts);
    }catch(e){
      setLoading(false);
      return Failure(code: ExceptionConstants.UNKOWN_ERROR, errorResponse: 'Unknown error');
    }
    setLoading(false);
    return response;
  }

  Future<ApiResponse> sendAndLoadContacts(List<Contact> phoneContacts) async{
    setLoading(true);
    List<String> contactsPhones = [];
    for (var c in phoneContacts) {
      var phones = c.phones;
      if(phones != null && phones.isNotEmpty && phones.elementAt(0).value != null){
        contactsPhones.add(phones.elementAt(0).value!.trim().replaceAll(' ', ""));
      }
    }
    //post contacts
    var response = await ContactsApiService.postContacts(contactsPhones, token);
    if(response is Success){
      var response = await ContactsApiService.getContacts(token);
      if(response is Success){
        try{
          var responseContacts = json.decode(response.body)['data'];
          contacts.clear();
          for (var item in responseContacts) {
            contacts.add(AppContact(item['full_name'], item['phone'], UrlConstants.SERVER_ROOT_URL + item['image']));
          }
          UserSharedPreferences.setContacts(contacts);
        }catch(e){
          return Failure(code: ExceptionConstants.UNKOWN_ERROR, errorResponse: 'Unknown error');
        }
        setLoading(false);
        return response;
      }else{
        setLoading(false);
        return response;
      }
    }else{
      setLoading(false);
      return response;
    }
  }
}
