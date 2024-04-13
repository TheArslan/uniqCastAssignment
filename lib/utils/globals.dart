import 'package:flutter/material.dart';
import 'package:uniqcastassignment/models/api_response_models/api_base_response.dart';
import 'package:uniqcastassignment/utils/my_pref.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();
// Global function to hide keyboard
void hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

// Global function to check api success Status
bool isApiSuccess(ApiBaseResponse apiResponse) =>
    (apiResponse.status?.toLowerCase() == "ok");

// Global function to move login Screen if unauthenticated
Future<void> logOutUser() async {
  try {
    MyPref.logOutUser();

    Navigator.of(navigatorKey.currentContext!).popUntil(
      (route) => route.isFirst,
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}
