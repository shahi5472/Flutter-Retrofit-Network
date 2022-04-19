import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectionStatusController extends GetxController {
  RxBool isConnectedToNetwork = false.obs;
  RxString deviceConnectionStatus = 'checking'.obs;
  Rx<ConnectivityResult> connectionStatus = ConnectivityResult.none.obs;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    connectionStatus.value = result;
    if (result == ConnectivityResult.wifi) {
      isConnectedToNetwork.value = false;
      deviceConnectionStatus.value = 'wifi';
      _showNotificationMessageWhenConnected();
    } else if (result == ConnectivityResult.mobile) {
      isConnectedToNetwork.value = false;
      deviceConnectionStatus.value = 'Mobile';
      _showNotificationMessageWhenConnected();
    } else if (result == ConnectivityResult.ethernet) {
      isConnectedToNetwork.value = false;
      deviceConnectionStatus.value = 'Ethernet';
      _showNotificationMessageWhenConnected();
    } else if (result == ConnectivityResult.none) {
      isConnectedToNetwork.value = true;
      deviceConnectionStatus.value = 'Offline';
      _showNotificationMessageWhenDisconnected();
    } else {
      isConnectedToNetwork.value = true;
      deviceConnectionStatus.value = 'Error';
      _showNotificationMessageWhenDisconnected();
    }
  }

  void _showNotificationMessageWhenConnected() {
    if (Get.isSnackbarOpen) {
      Get.back();
    }

    Get.snackbar(
      deviceConnectionStatus.value + ' Connection established',
      'Your device is connected with ' +
          deviceConnectionStatus.value +
          ' network',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      icon: Icon(
        connectionStatus.value == ConnectivityResult.wifi
            ? Icons.wifi
            : connectionStatus.value == ConnectivityResult.mobile
                ? Icons.network_cell
                : connectionStatus.value == ConnectivityResult.ethernet
                    ? Icons.network_wifi
                    : Icons.ac_unit_sharp,
        color: Colors.white,
      ),
      forwardAnimationCurve: Curves.decelerate,
      shouldIconPulse: false,
    );
  }

  void _showNotificationMessageWhenDisconnected() {
    if (Get.isSnackbarOpen) {
      Get.back();
    }

    Get.snackbar(
      'Device network connection lost',
      'Please check your internet connection',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 10),
      icon: connectionStatus.value == ConnectivityResult.none
          ? const Icon(Icons.network_check_rounded)
          : const SizedBox(),
      isDismissible: true,
      showProgressIndicator: isConnectedToNetwork.value == true ? false : true,
      progressIndicatorBackgroundColor: Colors.black,
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.easeInBack,
    );
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
