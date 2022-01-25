import 'package:get/get.dart';
import 'package:onlinemenu/utils/Error/base_controller.dart';
import 'package:onlinemenu/services/home_service.dart';

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
