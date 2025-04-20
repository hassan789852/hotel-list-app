// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';

class ExceptionResponse {
  final int statusCode;
  final List<dynamic> exceptionMessages;

  ExceptionResponse(
      {required this.statusCode, required this.exceptionMessages});
}

class LocalStatusCode {
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
  static const int UNKNOWN = -8;
  static const int BAD_CERTIFICATE = -9;
}

ExceptionResponse getExceptionResponse(DioException dioException) {
  if (dioException.response == null ||
      dioException.response?.statusCode == null) {
    return handleExceptionWithoutStatusCode(dioException);
  } else {
    return ExceptionResponse(
        statusCode: dioException.response!.statusCode ?? -1000,
        exceptionMessages: dioException.message!.isNotEmpty
            ? getErrorMessages(dioException.response!.data,
                dioException.response!.statusCode ?? -1000)
            : []);
  }
}

ExceptionResponse handleExceptionWithoutStatusCode(DioException dioException) {
  ExceptionResponse exceptionResponse = ExceptionResponse(
      statusCode: -1000, exceptionMessages: ["The Error not handled"]);
  switch (dioException.type) {
    case DioExceptionType.cancel:
      exceptionResponse = ExceptionResponse(
          statusCode: LocalStatusCode.CANCEL,
          exceptionMessages: ["Request to API server was cancelled"]);
      break;
    case DioExceptionType.connectionTimeout:
      exceptionResponse = ExceptionResponse(
          statusCode: LocalStatusCode.SEND_TIMEOUT,
          exceptionMessages: ["Connection timeout with API server"]);
      break;
    case DioExceptionType.unknown:
      exceptionResponse = ExceptionResponse(
          statusCode: LocalStatusCode.UNKNOWN,
          exceptionMessages: [
            "Connection to API server failed due to internet connection"
          ]);
      break;
    case DioExceptionType.receiveTimeout:
      exceptionResponse = ExceptionResponse(
          statusCode: LocalStatusCode.RECIEVE_TIMEOUT,
          exceptionMessages: ["Receive timeout in connection with API server"]);

      break;

    case DioExceptionType.sendTimeout:
      exceptionResponse = ExceptionResponse(
          statusCode: LocalStatusCode.SEND_TIMEOUT,
          exceptionMessages: ["Send timeout in connection with API server"]);
      break;
    case DioExceptionType.badCertificate:
      exceptionResponse = ExceptionResponse(
          statusCode: LocalStatusCode.BAD_CERTIFICATE,
          exceptionMessages: ["Bad Certificate"]);
      break;
    default:
      exceptionResponse = ExceptionResponse(
          statusCode: LocalStatusCode.DEFAULT,
          exceptionMessages: ["Something went wrong"]);
      break;
  }

  return exceptionResponse;
}

List<dynamic> getErrorMessages(dynamic responseData, int statusCode) {
  try {
    Map<String, dynamic> exceptionMap = json.decode(responseData);

    return exceptionMap.values.toList();
  } catch (e) {
    final List<dynamic> message;
    switch (statusCode) {
      case 404:
        message = ["Not Found"];
        break;
      case 403:
        message = ["Forbidden"];

        break;
      default:
        message = [statusCode.toString()];
    }
    return message;
  }
}
