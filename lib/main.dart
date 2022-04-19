import 'package:flutter/material.dart';
import 'package:flutter_retrofit_network/controller/connection_status_controller.dart';
import 'package:flutter_retrofit_network/routes/app_pages.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<ConnectionStatusController>(
    ConnectionStatusController(),
    permanent: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Retrofit Network',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.zoom,
    );
  }
}
