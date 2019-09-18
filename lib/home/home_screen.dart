import 'package:badges/badges.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unihub/custom_theme.dart';
import 'package:unihub/home/post.dart';
import 'package:unihub/home/stories.dart';
import 'package:unihub/models/post_model.dart';
import 'package:unihub/models/user.dart';
import 'package:unihub/themes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDark = true;
  @override
  Widget build(BuildContext context) {
    void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
      CustomTheme.instanceOf(buildContext).changeTheme(key);
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logo.png',
          height: MediaQuery.of(context).size.height * 0.045,
        ),
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            setState(() {
              isDark = !isDark;
            });

            (isDark)
                ? _changeTheme(context, MyThemeKeys.LIGHT)
                : _changeTheme(context, MyThemeKeys.DARK);
          },
          icon: Icon(
            EvaIcons.cameraOutline,
          ),
        ),
        actions: <Widget>[
          Badge(
            position: BadgePosition.topRight(top: 5, right: 3),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeColor: Color(0xff22a7f0),
            badgeContent: Text(
              '1'.toString(),
              style: TextStyle(color: Colors.white),
            ),
            child: Center(
              child: IconButton(
                  icon: Icon(
                    EvaIcons.messageSquareOutline,
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
              Post(
                PostModel(
                    user: currentUser,
                    imageUrls: [
                      'https://github.githubassets.com/images/modules/open_graph/github-octocat.png'
                    ],
                    likes: [],
                    comments: [],
                    postedAt: DateTime(2019, 5, 21, 6, 0, 0),
                    description: 'Testing...'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
