import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:skip/core/utils/exception_constants.dart';
import 'package:skip/core/utils/url_contsants.dart';
import 'package:skip/repos/api_status.dart';

class PayService {

  static Future<ApiResponse> pay(
      // 1 => pay, 2 => request
      String type, 
      double amount,
      String recieverId,
      String token
      ) async {
    try {
      var url = Uri.parse(UrlConstants.PAY_URL);
      Map<String, String> headers = {'Content-Type': 'application/json',
        'Authorization' : 'Token $token'};
      var body = json.encode({'type': type, 'amount': amount, 
        'receiver': recieverId
      });
      var response = await http.post(url, headers: headers, body: body);
      if (200 == response.statusCode || 201 == response.statusCode ){
        return Success(body: response.body);
      }
      return Failure(
          code: ExceptionConstants.SERVER_INVALID_RESPONSE,
          errorResponse: response.body);
    } on SocketException {
        return Failure(
          code: ExceptionConstants.NO_INTERNET, errorResponse: "No Internet");
    } on FormatException {
      return Failure(
          code: ExceptionConstants.INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(
          code: ExceptionConstants.UNKOWN_ERROR, errorResponse: "Unknown Error");
    }
  }

}
