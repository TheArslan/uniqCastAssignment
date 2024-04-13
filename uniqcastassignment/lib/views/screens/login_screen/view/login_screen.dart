import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uniqcastassignment/utils/constants/app_constants.dart';
import 'package:uniqcastassignment/utils/app_form_fields_validator.dart';
import 'package:uniqcastassignment/utils/app_messages.dart';
import 'package:uniqcastassignment/utils/extension.dart';
import 'package:uniqcastassignment/utils/globals.dart';
import 'package:uniqcastassignment/views/screens/channels_screen/view/channels_screen.dart';
import 'package:uniqcastassignment/views/screens/login_screen/cubit/login_cubit.dart';
import 'package:uniqcastassignment/views/widgets/app_button.dart';
import 'package:uniqcastassignment/views/widgets/app_text_field.dart';
import 'package:uniqcastassignment/views/widgets/loading_screen_view.dart';

// Login Screen to authenticate user
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
// If Authenicate successfully will move to channels screen
  void _openChanelScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ChannelsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: hideKeyBoard,
        child: BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginFailed) {
                AppMessages.showErrorSnackBar(state.message);
              } else if (state is LoginSuccess) {
                _openChanelScreen(context);
              }
            },
            builder: (context, state) {
              final LoginCubit loginCubit =
                  BlocProvider.of<LoginCubit>(context);
              return LoadingScreenView(
                isLoading: state is LoadingState,
                child: Center(
                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Form(
                          key: loginCubit.formKey,
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  AppConstants.welcome,
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                (screenSize.height / 60).height,
                                Text(
                                  AppConstants.enterYourCredentialsToLogin,
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                (screenSize.height / 60).height,
                                AppTextField(
                                  key: const ValueKey('emailTextField'),
                                  controller:
                                      loginCubit.emailTextFieldController,
                                  hint: AppConstants.username,
                                  keyboardType: TextInputType.text,
                                  validator: (value) =>
                                      AppFormFieldValidator.emptyFieldValidator(
                                    value,
                                    AppConstants.pleaseEnterUsername,
                                  ),
                                ),
                                (screenSize.height / 45).height,
                                AppTextField(
                                  key: const ValueKey('passwordTextField'),
                                  controller:
                                      loginCubit.passwordTextFieldController,
                                  hint: AppConstants.password,
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value) =>
                                      AppFormFieldValidator.emptyFieldValidator(
                                    value,
                                    AppConstants.pleaseEnterPassword,
                                  ),
                                  isPassword: true,
                                ),
                                (screenSize.height / 45).height,
                                AppButton(
                                  text: AppConstants.logIn,
                                  onPressed: loginCubit.onLoginButtonPressed,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
