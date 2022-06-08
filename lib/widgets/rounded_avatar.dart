import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RoundedAvatar extends StatelessWidget {
  final double size;
  RoundedAvatar({
    Key? key,
    this.size = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: 'https://picsum.photos/100',
        width: size,
        height: size,
      ),
    );
  }
}
