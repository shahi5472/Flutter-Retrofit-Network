import 'package:flutter/material.dart';
import 'package:flutter_retrofit_network/data/post_model.dart';
import 'package:flutter_retrofit_network/post/controller/post_controller.dart';
import 'package:get/get.dart';

import '../../widgets/error_view.dart';
import '../../widgets/item_view.dart';
import '../../widgets/loading.dart';

class PostView extends GetView<PostController> {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text('Retrofit Network')),
        body: controller.isLoading.value
            ? const Loading()
            : controller.isError.value
                ? ErrorView(
                    text: controller.errorMessage.value.toString(),
                    onPressed: () => controller.retry(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.postList.length,
                    itemBuilder: (BuildContext context, int index) {
                      PostModel model = controller.postList[index];
                      return ItemView(
                        index: index,
                        title: model.title.toString(),
                        subTitle: model.body.toString(),
                      );
                    },
                  ),
      ),
    );
  }
}
