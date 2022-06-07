import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Center(
        child: SizedBox(
          height: 60,
          width: 60,
          child: Image.asset('assets/images/loading_img.gif'),
        ),
      ),
    );
  }
}
