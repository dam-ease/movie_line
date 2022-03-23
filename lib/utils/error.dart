import 'package:dio/dio.dart';
import 'package:movie_line/utils/messages.dart';
import 'package:movie_line/utils/toast.dart';

String? showApiErrorToast({DioError? dioError}) {
  String? errorMessage;
  if (dioError != null) {
    errorMessage = parseApiErrorMessage(dioError);
    Toast.showCustomErrorNotification(errorMessage);
  } else {
    Toast.showCustomErrorNotification(SYSTEM_ERROR_MESSAGE);
  }
}

String? parseApiErrorMessage(DioError dioError) {
  String? errorMessage;

  final data = dioError.response?.data;
  if (data == null) {
    errorMessage = CONNECTIVITY_ISSUE_MESSAGE;
  } else if (data.runtimeType == String) {
    errorMessage = data;
  }
  return errorMessage;
}
