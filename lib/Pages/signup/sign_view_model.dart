import 'dart:convert';

import 'package:get/get.dart';
import 'package:onlinemenu/helper/base_controller.dart';
import 'package:onlinemenu/helper/dialog_helper.dart';
import 'package:onlinemenu/services/home_service.dart';
import 'package:onlinemenu/helper/app_exceptions.dart';
import 'package:onlinemenu/utils/Apis/base-http.dart';

class TestController extends GetxController with BaseController {
  var counter = 0.obs;
  HomeService homeService = HomeService();
  var modelvariable;

  getCategory() async {
    showLoading('Get data');
    modelvariable = await homeService.getData();
    hideLoading();
  }
}
