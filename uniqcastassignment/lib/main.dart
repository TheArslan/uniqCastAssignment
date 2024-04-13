import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uniqcastassignment/utils/globals.dart';
import 'package:uniqcastassignment/views/screens/login_screen/view/login_screen.dart';

void main() async {
  // Storage lbrary initialization
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uniqcast Assignment',
      scaffoldMessengerKey: snackbarKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      // here initialize all the app theme
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 32,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w700,
            ),
            displaySmall: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )),
      home: const LoginScreen(),
    );
  }
}
