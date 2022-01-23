import 'dart:convert';

import 'package:get/get.dart';
import 'package:onlinemenu/helper/base_controller.dart';
import 'package:onlinemenu/helper/dialog_helper.dart';
import 'package:onlinemenu/services/app_exceptions.dart';
import 'package:onlinemenu/services/base_client.dart';
import 'package:onlinemenu/services/dio_client.dart';

class TestController extends GetxController with BaseController {
  void getData() async {
    showLoading('Get data');
    var response = await BaseClient()
        .get('https://jsonplaceholder.typicode.com', '/todos/1', '')
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    print(response);
  }

  void postData() async {
    var request = {'message': 'CodeX sucks!!!'};
    showLoading('Post data...');
    var response = await BaseClient()
        .post('https://jsonplaceholder.typicode.com', '/posts', request, '')
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        DialogHelper.showErroDialog(description: apiError["reason"]);
      } else {
        handleError(error);
      }
    });
    if (response == null) return;
    hideLoading();
    print(response);
  }
}
