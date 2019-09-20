import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

final facebookReactions = [
  Reaction(
    previewIcon: buildPreviewIconFacebook('images/like.gif'),
    icon: buildIconFacebook('images/like.png',
        Text('Like', style: TextStyle(color: Color(0XFF3b5998)))),
  ),
  Reaction(
    previewIcon: buildPreviewIconFacebook('images/love.gif'),
    icon: buildIconFacebook('images/love.png',
        Text('Love', style: TextStyle(color: Color(0XFFed5168)))),
  ),
  Reaction(
    previewIcon: buildPreviewIconFacebook('images/wow.gif'),
    icon: buildIconFacebook('images/wow.png',
        Text('Wow', style: TextStyle(color: Color(0XFFffda6b)))),
  ),
  Reaction(
    previewIcon: buildPreviewIconFacebook('images/haha.gif'),
    icon: buildIconFacebook('images/haha.png',
        Text('Haha', style: TextStyle(color: Color(0XFFffda6b)))),
  ),
  Reaction(
    previewIcon: buildPreviewIconFacebook('images/sad.gif'),
    icon: buildIconFacebook('images/sad.png',
        Text('Sad', style: TextStyle(color: Color(0XFFffda6b)))),
  ),
  Reaction(
      previewIcon: buildPreviewIconFacebook('images/angry.gif'),
      icon: buildIconFacebook('images/angry.png',
          Text('Angry', style: TextStyle(color: Color(0XFFf05766))))),
];

Widget buildPreviewIconFacebook(String path) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
    child: Image.asset(path, height: 40),
  );
}

Widget buildIconFacebook(String path, Text text) {
  return Container(
    color: Colors.transparent,
    child: Row(
      children: <Widget>[
        Image.asset(path, height: 20),
        SizedBox(
          width: 5,
        ),
        text,
      ],
    ),
  );
}
