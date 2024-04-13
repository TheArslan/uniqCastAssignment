import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniqcastassignment/models/api_request_models/login_request_model.dart';

import 'package:uniqcastassignment/resources/repository.dart';
import 'package:uniqcastassignment/utils/globals.dart';
import 'package:uniqcastassignment/utils/my_pref.dart';

part 'login_state.dart';

// cubit class for login
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final Repository _repository = Repository();
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailTextFieldController =
      TextEditingController(text: kDebugMode ? "flutter_test" : null);
  final TextEditingController passwordTextFieldController =
      TextEditingController(text: kDebugMode ? "1111" : null);

  Future<void> onLoginButtonPressed() async {
    if (formKey.currentState?.validate() ?? false) {
      hideKeyBoard();
      _performLogin();
    }
  }

// Function to authenticate user
  Future<void> _performLogin() async {
    try {
      emit(LoadingState());

      final apiResponse = await _repository.loginUser(
        LoginRequestModel(
          emailTextFieldController.text,
          passwordTextFieldController.text,
        ),
      );
      if (isApiSuccess(apiResponse)) {
        MyPref.updateUserInfo(
          user: apiResponse.data,
        );

        emit(LoginSuccess());
      } else {
        emit(LoginFailed(apiResponse.message));
      }
    } catch (e) {
      emit(LoginFailed(e.toString()));
    }
  }
}
