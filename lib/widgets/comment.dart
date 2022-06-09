import 'package:flutter/material.dart';
import 'package:temp/widgets/rounded_avatar.dart';

class Comment extends StatelessWidget {
  final bool showImage;
  final String userName;
  final String text;
  final String dateTime;
  Comment({
    Key? key,
    this.showImage = true,
    required this.userName,
    required this.text,
    this.dateTime = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showImage) RoundedAvatar(size: 24),
        if (showImage)
          SizedBox(
            width: 9,
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: userName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
              TextSpan(text: '  '),
              TextSpan(text: text, style: TextStyle(color: Colors.black87))
            ])),
            if (dateTime != '')
              Text(
                dateTime,
                style: TextStyle(color: Colors.grey[400], fontSize: 10),
              )
          ],
        ),
      ],
    );
  }
}
