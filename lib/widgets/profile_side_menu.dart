import 'package:flutter/material.dart';
import 'package:temp/screens/auth_screen.dart';

class ProfileSideMenu extends StatelessWidget {
  const ProfileSideMenu(this.menuWidth, {Key? key}) : super(key: key);

  final double menuWidth;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
          width: menuWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                title: Text(
                  'Setting',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Colors.black87,
                ),
                title: const Text('Sign out'),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const AuthScreen()));
                },
              ),
            ],
          )),
    );
  }
}
