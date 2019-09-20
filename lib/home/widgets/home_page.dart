import 'package:flutter/material.dart';
import 'package:unihub/home/post.dart';
import 'package:unihub/home/stories.dart';
import 'package:unihub/models/post_model.dart';
import 'package:unihub/models/user.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stories(),
            Post(
              PostModel(
                  user: currentUser,
                  imageUrls: ['https://i.imgur.com/5VOiHDo.jpg'],
                  reactions: [[], [], [], [], [], []],
                  comments: [],
                  postedAt: DateTime(2019, 5, 21, 6, 0, 0),
                  description: 'Unihub testing 123',
                  location: 'Munich Airport'),
            ),
          ],
        ),
      ),
    );
  }
}
