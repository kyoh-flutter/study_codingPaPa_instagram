// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:temp/widgets/fade_stack.dart';
import 'package:temp/widgets/sign_in_form.dart';
import 'package:temp/widgets/sign_up_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  List<Widget> forms = [const SignUpForm(), const SignInForm()];
  int selectedForm = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            FadeStack(selectedForm: selectedForm),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 40,
              child: FlatButton(
                color: Colors.white,
                shape: const Border(
                    top: BorderSide(
                  color: Colors.grey,
                )),
                onPressed: () {
                  setState(() {
                    if (selectedForm == 0) {
                      selectedForm = 1;
                    } else {
                      selectedForm = 0;
                    }
                  });
                },
                child: RichText(
                  text: TextSpan(
                    text: (selectedForm == 0)
                        ? "Already have an account? "
                        : "Don't have an account? ",
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                          text: (selectedForm == 0) ? "Sign In " : "Sign Up",
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
