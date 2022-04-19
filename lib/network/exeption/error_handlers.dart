import 'dart:io';

import 'package:dio/dio.dart';

class ErrorHandlers {
  static String getException(error) {
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.connectTimeout:
              return "Connection Timeout";
            case DioErrorType.sendTimeout:
              return "Sending Timeout";
            case DioErrorType.receiveTimeout:
              return "Receiving Timeout";
            case DioErrorType.response:
              String message;
              switch (error.response!.statusCode) {
                case 400:
                  message = "Unauthorised Request";
                  break;
                case 401:
                  message = "Unauthorised Request";
                  break;
                case 403:
                  message = "Unauthorised Request";
                  break;
                case 404:
                  message = "Not found";
                  break;
                case 409:
                  message = "Conflict";
                  break;
                case 408:
                  message = "Request Timeout";
                  break;
                case 500:
                  message = "Internal Server Error";
                  break;
                case 503:
                  message = "Service Unavailable";
                  break;
                default:
                  message =
                      "Received invalid status code: ${error.response!.statusCode}";
              }
              return message;
            case DioErrorType.cancel:
              return "Request Cancelled";
            case DioErrorType.other:
              return "Unexpected error occurred";
          }
        } else if (error is SocketException) {
          return "No Internet Connection";
        } else {
          return "Unexpected Error";
        }
      } on FormatException catch (_) {
        return "Format Exception";
      } catch (_) {
        return "Unexpected Error";
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return "Unable To Process";
      } else {
        return "Unexpected Error";
      }
    }
  }
}
