import 'package:flutter/material.dart';
import 'package:shopping_app/pages/login_page.dart';
import 'package:shopping_app/pages/shopping_home_page.dart';
import 'package:shopping_app/pages/sign_up_page.dart';

class AuthFlowController extends StatefulWidget {
  const AuthFlowController({super.key});

  @override
  State<AuthFlowController> createState() => _AuthFlowControllerState();
}

class _AuthFlowControllerState extends State<AuthFlowController> {
  bool isLoggedIn = false;
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      return ShoppingHomePage();
    } else if (isSignUp) {
      return SignUpPage(
        onSignUpSuccess: () {
          setState(() {
            isLoggedIn = true;
          });
        },
        onGoToLogin: () {
          setState(() {
            isSignUp = false;
          });
        },
      );
    } else {
      return LoginPage(
        onLoginSuccess: () {
          setState(() {
            isLoggedIn = true;
          });
        },
        onGoToSignUp: () {
          setState(() {
            isSignUp = true;
          });
        },
      );
    }
  }
}
