import 'package:flutter_retrofit_network/network/core/local_client.dart';

/// For local json file read
abstract class LocalConnect {
  late LocalClient _localClient;

  LocalConnect() {
    _localClient = LocalClient.instance;
  }

  LocalClient get client => _localClient;
}
