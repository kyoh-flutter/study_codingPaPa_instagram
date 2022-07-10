import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:temp/widgets/comment.dart';
import 'package:temp/widgets/my_progress_indicator.dart';
import 'package:temp/widgets/rounded_avatar.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postHeader(),
        _postImage(),
        _postActions(),
        _postLikes(),
        _postCaption()
      ],
    );
  }

  Padding _postCaption() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Comment(
        userName: 'kyoh',
        text: 'i love you',
        dateTime: '2w',
      ),
    );
  }

  Padding _postLikes() {
    return const Padding(
      padding: EdgeInsets.only(left: 14.0),
      child: Text(
        '12000 likes',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _postActions() {
    return Row(
      children: [
        IconButton(
          icon: const ImageIcon(AssetImage('assets/images/bookmark.png')),
          color: Colors.black87,
          onPressed: () {},
        ),
        IconButton(
          icon: const ImageIcon(AssetImage('assets/images/comment.png')),
          color: Colors.black87,
          onPressed: () {},
        ),
        IconButton(
          icon: const ImageIcon(AssetImage('assets/images/direct_message.png')),
          color: Colors.black87,
          onPressed: () {},
        ),
        const Spacer(),
        IconButton(
          icon: const ImageIcon(AssetImage('assets/images/heart_selected.png')),
          color: Colors.black87,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _postHeader() {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: RoundedAvatar(),
        ),
        const Expanded(child: Text('userName')),
        IconButton(
            onPressed: () {},
            icon: const Icon(
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
