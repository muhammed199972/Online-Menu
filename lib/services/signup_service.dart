import 'dart:convert';

import 'package:onlinemenu/utils/Error/base_controller.dart';
import 'package:onlinemenu/helper/dialog_helper.dart';
import 'package:onlinemenu/utils/Error/app_exceptions.dart';
import 'package:onlinemenu/utils/Apis/base-http.dart';

class HomeService extends BaseController {
  final baseurl = 'https://jsonplaceholder.typicode.com';
  final categoryurl = '/todos/1';
  getData() async {
    var response = await BaseClient()
        .get(baseurl, categoryurl, '')
        .catchError(handleError);
    if (response == null) return;
  }

  postData() async {
    var request = {'message': 'CodeX sucks!!!'};
    var response = await BaseClient()
        .post(baseurl, categoryurl, request, '')
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        DialogHelper.showErroDialog(description: apiError["reason"]);
      } else {
        handleError(error);
      }
    });
    if (response == null) return;
  }
}
