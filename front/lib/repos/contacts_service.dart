import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:skip/core/utils/exception_constants.dart';
import 'package:skip/core/utils/url_contsants.dart';
import 'package:skip/repos/api_status.dart';

class ContactsApiService {

  // search for users in my contacts using phone or name in order
  // or search in all skip users using pk (only)
  static Future<ApiResponse> searchContacts(
      String phone, 
      String name,
      String recieverId,
      String token,
  ) async {
    try {
      Map<String, String> headers = {'Authorization' : 'Token $token'};
      final params = '?full_name=$name&phone=$phone&pk=$recieverId';
      var url = Uri.parse(UrlConstants.SEARCH_USER_URL + params);

      var response = await http.get(url, headers: headers);
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

  // post my contacts/friends
  static Future<ApiResponse> postContacts(List<String> phones, String token) async {
    try{
      Map<String, String> headers = {'Authorization': 'Token $token',
        'Content-Type': 'application/json'
      };
      var url =  Uri.parse(UrlConstants.CONTACTS_URL);
      var body = json.encode({'contacts': phones});
      var response = await http.post(url, headers:headers, body: body);
      if(200 == response.statusCode){
        return Success(body: response.body);
      }
      return Failure(
          code: ExceptionConstants.SERVER_INVALID_RESPONSE,
          errorResponse: response.body
          );
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

  // post my contacts/friends
  static Future<ApiResponse> getContacts(String token) async {
    try{
      Map<String, String> headers = {'Authorization': 'Token $token',};
      var url =  Uri.parse(UrlConstants.CONTACTS_URL);
      var response = await http.get(url, headers:headers);
      if(200 == response.statusCode){
        return Success(body: response.body);
      }
      return Failure(
          code: ExceptionConstants.SERVER_INVALID_RESPONSE,
          errorResponse: response.body
          );
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
