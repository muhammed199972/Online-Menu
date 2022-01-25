import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../helper/app_exceptions.dart';

class DioClient {
  static const int TIME_OUT_DURATION = 20;
  //GET
  Future<dynamic> get(String baseUrl, String api, String token) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var response;
      token == ''
          ? response = await Dio()
              .get(baseUrl + api)
              .timeout(Duration(seconds: TIME_OUT_DURATION))
          : response = await Dio()
              .get(baseUrl + api,
                  options: Options(
                    headers: {'Authorization': 'Bearer $token'},
                  ))
              .timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> post(
      String baseUrl, String api, dynamic payloadObj, String token) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response;
      token == ''
          ? response = await Dio()
              .post(baseUrl + api, data: payload)
              .timeout(Duration(seconds: TIME_OUT_DURATION))
          : response = await Dio()
              .post(baseUrl + api,
                  data: payload,
                  options: Options(
                    headers: {'Authorization': 'Bearer $token'},
                  ))
              .timeout(Duration(seconds: TIME_OUT_DURATION));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //DELETE
  Future<dynamic> delete(String baseUrl, String api, String token) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var response;
      token == ''
          ? response = await Dio()
              .delete(baseUrl + api)
              .timeout(Duration(seconds: TIME_OUT_DURATION))
          : response = await Dio()
              .delete(baseUrl + api,
                  options: Options(
                    headers: {'Authorization': 'Bearer $token'},
                  ))
              .timeout(Duration(seconds: TIME_OUT_DURATION));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //put
  Future<dynamic> put(
      String baseUrl, String api, dynamic payloadObj, String token) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response;
      token == ''
          ? response = await Dio()
              .put(baseUrl + api, data: payload)
              .timeout(Duration(seconds: TIME_OUT_DURATION))
          : response = await Dio()
              .put(baseUrl + api,
                  data: payload,
                  options: Options(
                    headers: {'Authorization': 'Bearer $token'},
                  ))
              .timeout(Duration(seconds: TIME_OUT_DURATION));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  dynamic _processResponse(response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
