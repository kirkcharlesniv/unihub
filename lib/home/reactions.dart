import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

final defaultInitialReaction = Reaction(
  previewIcon: _buildPreviewIconFacebook('assets/images/like.png'),
  icon: _buildIconFacebook('images/like.png',
      Text('Like', style: TextStyle(color: Colors.grey[600]))),
);

final facebookReactions = [
  Reaction(
    previewIcon: _buildPreviewIconFacebook('images/like.gif'),
    icon: _buildIconFacebook('images/like.png',
        Text('Like', style: TextStyle(color: Color(0XFF3b5998)))),
  ),
  Reaction(
    previewIcon: _buildPreviewIconFacebook('images/love.gif'),
    icon: _buildIconFacebook('images/love.png',
        Text('Love', style: TextStyle(color: Color(0XFFed5168)))),
  ),
  Reaction(
    previewIcon: _buildPreviewIconFacebook('images/wow.gif'),
    icon: _buildIconFacebook('images/wow.png',
        Text('Wow', style: TextStyle(color: Color(0XFFffda6b)))),
  ),
  Reaction(
    previewIcon: _buildPreviewIconFacebook('images/haha.gif'),
    icon: _buildIconFacebook('images/haha.png',
        Text('Haha', style: TextStyle(color: Color(0XFFffda6b)))),
  ),
  Reaction(
    previewIcon: _buildPreviewIconFacebook('images/sad.gif'),
    icon: _buildIconFacebook('images/sad.png',
        Text('Sad', style: TextStyle(color: Color(0XFFffda6b)))),
  ),
  Reaction(
      previewIcon: _buildPreviewIconFacebook('images/angry.gif'),
      icon: _buildIconFacebook('images/angry.png',
          Text('Angry', style: TextStyle(color: Color(0XFFf05766))))),
];

Widget _buildPreviewIcon(String path, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Column(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w300, color: Colors.white),
        ),
        SizedBox(
          height: 7.5,
        ),
        Image.asset(path, height: 30),
      ],
    ),
  );
}

Widget _buildPreviewIconFacebook(String path) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
    child: Image.asset(path, height: 40),
  );
}

Widget _buildIcon(String path) {
  return Image.asset(
    path,
    height: 30,
    width: 30,
  );
}

Widget _buildIconFacebook(String path, Text text) {
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
