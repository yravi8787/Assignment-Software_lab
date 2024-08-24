import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_lab_assignment/provider/user_provider.dart';
import 'package:software_lab_assignment/screens/forgotpassword_screen.dart';
import 'package:software_lab_assignment/screens/login_screen.dart';
import 'package:software_lab_assignment/screens/onboarding_screen.dart';
import 'package:software_lab_assignment/screens/signup/sign_main.dart';
import 'package:software_lab_assignment/screens/signup/signin_confirmation.dart';
import 'package:software_lab_assignment/screens/signup/signup_confirmation.dart';

import 'themes/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Software_Lab App',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => const SignMain(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/signup-confirmation': (context) => const SignupConfirmation(),
        '/signin-confirmation': (context) => const SigninConfirmation(),
      },
    );
  }
}
