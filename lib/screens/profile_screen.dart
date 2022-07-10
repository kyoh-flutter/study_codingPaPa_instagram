import 'package:flutter/material.dart';
import 'package:temp/constans/screen_size.dart';
import 'package:temp/widgets/profile_body.dart';

enum MenuStatus { opened, closed }

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final duration = const Duration(milliseconds: 300);
  final menuWidth = size!.width / 2;

  MenuStatus _menuStatus = MenuStatus.closed;
  double bodyXpos = 0;
  double menuXpos = size!.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          AnimatedContainer(
            curve: Curves.easeInOut,
            duration: duration,
            child: ProfileBody(onMenuChanged: () {
              setState(() {
                _menuStatus = (_menuStatus == MenuStatus.closed)
                    ? MenuStatus.opened
                    : MenuStatus.closed;
                switch (_menuStatus) {
                  case MenuStatus.opened:
                    bodyXpos = -menuWidth;
                    menuXpos = size!.width - menuWidth;
                    break;
                  case MenuStatus.closed:
                    bodyXpos = 0;
                    menuXpos = size!.width;
                    break;
                }
              });
            }),
            transform: Matrix4.translationValues(bodyXpos, 0, 0),
          ),
          AnimatedContainer(
            curve: Curves.easeInOut,
            transform: Matrix4.translationValues(menuXpos, 0, 0),
            duration: duration,
            child: Container(
              width: menuWidth,
              color: Colors.deepPurpleAccent,
            ),
          ),
        ],
      ),
    );
  }
}
