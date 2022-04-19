import 'package:flutter_retrofit_network/data/post_model.dart';
import 'package:get/get.dart';

import '../../data/network/api_response_model.dart';
import '../../network/api_service.dart';

class PostController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxList<PostModel> postList = <PostModel>[].obs;

  Future<void> retry() async {
    _getPostList();
    isLoading(true);
    isError(false);
    errorMessage("");
  }

  @override
  void onInit() {
    _getPostList();
    super.onInit();
  }

  Future<void> _getPostList() async {
    ApiResponseModel result = await ApiService.instance.getPostList();
    if (result.error) {
      errorMessage(result.message!);
      isError(result.error);
      isLoading(false);
    } else {
      postList.addAll(result.data);
      isLoading(false);
    }
  }
}
