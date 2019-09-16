import 'package:badges/badges.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unihub/home/post.dart';
import 'package:unihub/home/stories.dart';
import 'package:unihub/models/post_model.dart';
import 'package:unihub/models/user.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logo.png',
          height: MediaQuery.of(context).size.height * 0.045,
        ),
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            EvaIcons.cameraOutline,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Badge(
            position: BadgePosition.topRight(top: 5, right: 3),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              '1'.toString(),
              style: TextStyle(color: Colors.white),
            ),
            child: Center(
              child: IconButton(
                  icon: Icon(
                    EvaIcons.messageSquareOutline,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            ),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stories(),
              Post(
                PostModel(
                    user: currentUser,
                    imageUrls: ['https://i.imgur.com/5VOiHDo.jpg'],
                    likes: [],
                    comments: [],
                    postedAt: DateTime(2019, 5, 21, 6, 0, 0),
                    description: 'Unihub testing 123'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
