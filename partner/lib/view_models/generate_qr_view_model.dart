import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:skip/core/user_shared_preferences.dart';
import 'package:skip/core/utils/url_contsants.dart';
import 'package:skip/repos/contacts_service.dart';

import '../core/utils/exception_constants.dart';
import '../repos/api_status.dart';
import '../repos/pay_service.dart';

class GenerateQrViewModel with ChangeNotifier {

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


  
}
