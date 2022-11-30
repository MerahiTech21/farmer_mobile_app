import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'api_exception.dart';

class ApiBaseHelper {
  final String _baseUrl = "http://197.156.77.208:3000";
  Future<dynamic> get({required String url, token}) async {
    final responseJson;
    try {
      final http.Response response =
          await http.get(Uri.parse(_baseUrl + url), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Retry-After': '3600'
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: 'No Internet connection');
    }
    // print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post({required String url, required payload, token}) async {
    final responseJson;
    try {
      final http.Response response = await http.post(Uri.parse(_baseUrl + url),
          body: json.encode(payload),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: 'No Internet connection');
    }

    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
      case 404:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          message:
              'Error occured while communication with server with statusCode : ${response.statusCode}',
        );
    }
  }
}
