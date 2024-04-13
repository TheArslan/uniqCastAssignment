import 'package:flutter/material.dart';

import 'package:uniqcastassignment/utils/constants/app_constants.dart';
import 'package:uniqcastassignment/utils/globals.dart';

class AppMessages {
  AppMessages._();

  static void showErrorSnackBar([String? message]) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      snackbarKey.currentState?.hideCurrentSnackBar();
      snackbarKey.currentState?.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 800),
          padding: const EdgeInsets.symmetric(vertical: 20),
          content: Center(
            heightFactor: 0,
            child: Text(
              message ?? AppConstants.somethingIsWrong,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.grey.shade900,
        ),
      );
    });
  }
}
