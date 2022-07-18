// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:temp/home_page.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _cpwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 16,
            ),
            Image.asset('assets/images/insta_text_logo.png'),
            TextFormField(
              cursorColor: Colors.black,
              decoration: _textInputDecoration(hintText: 'Email'),
              controller: _emailController,
              validator: (text) {
                if (text == null) {
                  return '타입을 확인해주세요~';
                }
                if (text.isNotEmpty && text.contains("@")) {
                  return null;
                } else {
                  return '정확한 이메일 주소를 입력해주세요~';
                }
              },
            ),
            const SizedBox(
              height: 10.9,
            ),
            TextFormField(
              decoration: _textInputDecoration(hintText: 'Password'),
              cursorColor: Colors.black,
              controller: _pwController,
              obscureText: true,
              validator: (text) {
                if (text == null) {
                  return '타입을 확인해주세요~';
                }
                if (text.isNotEmpty && text.length > 5) {
                  return null;
                } else {
                  return '제대로 된 비밀번호를 입력해주세요~';
                }
              },
            ),
            const SizedBox(
              height: 10.9,
            ),
            TextFormField(
              decoration: _textInputDecoration(hintText: 'Conform Password'),
              controller: _cpwController,
              cursorColor: Colors.black,
              obscureText: true,
              validator: (text) {
                if (text == null) {
                  return '타입을 확인해주세요~';
                }
                if (text.isNotEmpty && text == _pwController.text) {
                  return null;
                } else {
                  return '입력한 비밀번호와 일치하지 않습니다.';
                }
              },
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                if (_formKey.currentState == null) {
                  return;
                }
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                }
              },
              child: const Text(
                'Join',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            const SizedBox(
              height: 10.8,
            ),
            _onDivider(),
            FlatButton.icon(
              onPressed: () {},
              textColor: Colors.blue,
              icon: const ImageIcon(
                AssetImage('assets/images/facebook.png'),
              ),
              label: const Text('Login with facebook'),
            )
          ],
        ),
      ),
    );
  }

  Stack _onDivider() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,
          right: 0,
          height: 1,
          child: Container(
            color: Colors.grey.shade300,
            height: 1,
          ),
        ),
        Container(
          color: Colors.grey.shade50,
          height: 3,
          width: 60,
        ),
        Text(
          'OR',
          style: TextStyle(
            color: Colors.grey.shade500,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  InputDecoration _textInputDecoration({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      border: _textInputBorder(Colors.grey.shade300),
      enabledBorder: _textInputBorder(Colors.grey.shade300),
      focusedBorder: _textInputBorder(Colors.grey.shade300),
      filled: true,
      fillColor: Colors.grey.shade100,
    );
  }

  OutlineInputBorder _textInputBorder(color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
