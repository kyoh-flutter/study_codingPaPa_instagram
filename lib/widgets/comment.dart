import 'package:flutter/material.dart';
import 'package:temp/widgets/rounded_avatar.dart';

class Comment extends StatelessWidget {
  final bool showImage;
  Comment({
    Key? key,
    this.showImage = true,
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
                  text: 'userABC',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
              TextSpan(text: '  '),
              TextSpan(
                  text: 'i like this picture!!',
                  style: TextStyle(color: Colors.black87))
            ])),
            Text(
              '2w',
              style: TextStyle(color: Colors.grey[400], fontSize: 10),
            )
          ],
        ),
      ],
    );
  }
}
