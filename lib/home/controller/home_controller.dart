import 'package:flutter_retrofit_network/data/network/api_response_model.dart';
import 'package:flutter_retrofit_network/data/user_model.dart';
import 'package:flutter_retrofit_network/network/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxList<UserModel> userList = <UserModel>[].obs;

  Future<void> retry() => _getUserList();

  @override
  void onInit() {
    _getUserList();
    super.onInit();
  }

  Future<void> _getUserList() async {
    ApiResponseModel result = await ApiService.instance.getUserList();
    if (result.error) {
      errorMessage(result.message!);
      isError(result.error);
      isLoading(false);
    } else {
      userList.addAll(result.data);
      isLoading(false);
    }
  }
}
