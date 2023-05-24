import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:skip/core/user_shared_preferences.dart';
import 'package:skip/core/utils/url_contsants.dart';
import 'package:skip/repos/contacts_service.dart';

import '../core/utils/exception_constants.dart';
import '../repos/api_status.dart';
import '../repos/pay_service.dart';

class PayViewModel with ChangeNotifier {
  // AppContact? _chosenContact;
  // AppContact? get chosenContact => _chosenContact;
  // set chosenContact(AppContact? appContact){ 
  //   _chosenContact = appContact;
  //   notifyListeners();
  // }


  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  double _amount = 0.0;
  double get amount => _amount;
  set amount(double amount){
    _amount = amount;
    notifyListeners();
  }

  String _receiverId = "";
  String get receiverId => _receiverId;
  set receiverId(String receiverId){
    _receiverId = receiverId;
    notifyListeners();
  }

  String _receiverImageUrl = "";
  String get receiverImageUrl => _receiverImageUrl;
  set receiverImageUrl(String receiverImageUrl){
    _receiverImageUrl = receiverImageUrl;
    notifyListeners();
  }

  bool _receiverImageUrlExists = false;
  bool get receiverImageUrlExists => _receiverImageUrlExists;
  set receiverImageUrlExists(bool receiverImageUrlExists){
    _receiverImageUrlExists = receiverImageUrlExists;
    notifyListeners();
  }

  String _receiverName = "";
  String get receiverName => _receiverName;
  set receiverName(String receiverName){
    _receiverName = receiverName;
    notifyListeners();
  }

  String _receiverPhone = "";
  String get receiverPhone => _receiverPhone;
  set receiverPhone(String receiverPhone){
    _receiverPhone = receiverPhone;
    notifyListeners();
  }

  Future<ApiResponse> pay(String token) {
    const type = "1"; //for pay
    return PayService.pay(type, amount, receiverId, token);
  }

  Future<ApiResponse> getReceiverData() async{
    setLoading(true);
    var token = UserSharedPreferences.getToken();
    // String receiverPhone = "";
    var response = await ContactsApiService.searchContacts(receiverPhone, receiverName, receiverId, token??"");
    if (response is Success) {
      try{
        var userData = json.decode(response.body)['data'][0];
        receiverName = userData['full_name']??"";
        receiverId = userData['id']??"";
        if(userData['image'] != null){
          receiverImageUrl = UrlConstants.SERVER_ROOT_URL + userData['image'];
          receiverImageUrlExists = true;
        }else{
          receiverImageUrl = 'default-small.jpg';
          receiverImageUrlExists = false;
        }
      }catch (e){
        return Failure(code: ExceptionConstants.SERVER_INVALID_RESPONSE, errorResponse: "User not Found");
      }
    }
    setLoading(false);
    return response;
  }

  clearReceiverData(){
    setLoading(true);
    receiverPhone = "";
    receiverName = "";
    receiverImageUrl = "";
    receiverImageUrlExists = false;
    setLoading(false);
  }
  
}
