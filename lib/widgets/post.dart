import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:temp/widgets/my_progress_indicator.dart';

class Post extends StatefulWidget {
  final int index;

  const Post(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _postHeader(),
        _postImage(),
      ],
    );
  }

  Widget _postHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/100',
              width: 30,
              height: 30,
            ),
          ),
        ),
        Expanded(child: Text('userName')),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black87,
            ))
      ],
    );
  }

  CachedNetworkImage _postImage() {
    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/${widget.index}/200/200',
      placeholder: (BuildContext context, String url) {
        return const MyProgressIndicator();
      },
      imageBuilder: (BuildContext context, ImageProvider imageProvider) {
        return AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ));
      },
    );
  }
}
