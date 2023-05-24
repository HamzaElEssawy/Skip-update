import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:skip/core/utils/exception_constants.dart';
import 'package:skip/core/utils/url_contsants.dart';
import 'package:skip/repos/api_status.dart';

class SignService {
  static Future<Object> signUp(
      String name, String email, String phone, String password) async {
    try {
      var url = Uri.parse(UrlConstants.SIGN_UP_URL);
      Map<String, String> headers = {'Content-Type': 'application/json'};
      var body = json.encode({
        'phone': phone,
        'full_name': name,
        'email': email,
        'password': password
      });
      var response = await http.post(url, headers: headers, body: body);
      if (200 == response.statusCode || 201 == response.statusCode) {
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
          code: ExceptionConstants.INVALID_FORMAT,
          errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(
          code: ExceptionConstants.UNKOWN_ERROR,
          errorResponse: "Unknown Error");
    }
  }

  static Future<Object> signIn(String phone, String password) async {
    try {
      var url = Uri.parse(UrlConstants.SIGN_IN_URL);
      Map<String, String> headers = {'Content-Type': 'application/json'};
      var body = json.encode({'phone': phone, 'password': password});
      var response = await http.post(url, headers: headers, body: body);
      if (200 == response.statusCode || 201 == response.statusCode) {
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
          code: ExceptionConstants.INVALID_FORMAT,
          errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(
          code: ExceptionConstants.UNKOWN_ERROR,
          errorResponse: "Unknown Error");
    }
  }
}
