import 'package:flutter/material.dart';
import 'package:flutter_retrofit_network/data/user_model.dart';
import 'package:flutter_retrofit_network/home/controller/home_controller.dart';
import 'package:flutter_retrofit_network/routes/app_pages.dart';
import 'package:flutter_retrofit_network/widgets/error_view.dart';
import 'package:flutter_retrofit_network/widgets/loading.dart';
import 'package:get/get.dart';

import '../../widgets/item_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text('Retrofit Network')),
        body: controller.isLoading.value
            ? const Loading()
            : controller.isError.value
                ? ErrorView(text: controller.errorMessage.value.toString())
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.userList.length,
                    itemBuilder: (BuildContext context, int index) {
                      UserModel model = controller.userList[index];
                      return ItemView(
                        index: index,
                        title: model.name.toString(),
                        subTitle: model.email.toString(),
                      );
                    },
                  ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.post_add_rounded),
          onPressed: () => Get.toNamed(Routes.post),
        ),
      ),
    );
  }
}
