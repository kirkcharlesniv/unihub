import 'package:flutter/material.dart';
import 'package:unihub/models/reaction_classes.dart';
import 'package:unihub/models/user.dart';

class Comment {
  String text;
  final User user;
  final DateTime commentedAt;
  List<List> reactions;

  bool isReactionsNotEmpty() {
    return reactions.any((react) => react.isNotEmpty);
  }

  bool isReactedBy(User user) {
    return reactions.any(
        (react) => react.any((instance) => instance.user.name == user.name));
  }

  int getListLength() {
    int len = 0;
    reactions.forEach((element) => len += element.length);
    return len;
  }

  void toggleReactedFor(User user, int i) {
    switch (i) {
      case 0:
        print('${user.name} reacted like');
        reactions[i].add(Like(user: user));
        break;
      case 1:
        print('${user.name} reacted heart');
        reactions[i].add(Heart(user: user));
        break;
      case 2:
        print('${user.name} reacted wow');
        reactions[i].add(Wow(user: user));
        break;
      case 3:
        print('${user.name} reacted haha');
        reactions[i].add(Haha(user: user));
        break;
      case 4:
        print('${user.name} reacted sad');
        reactions[i].add(Sad(user: user));
        break;
      case 5:
        print('${user.name} reacted angry');
        reactions[i].add(Angry(user: user));
        break;
    }
  }

  void removeReaction(User user, int i) {
    switch (i) {
      case 0:
        print('${user.name} removed like');
        reactions[i].removeWhere((like) => like.user.name == user.name);
        break;
      case 1:
        print('${user.name} removed heart');
        reactions[i].removeWhere((heart) => heart.user.name == user.name);
        break;
      case 2:
        print('${user.name} removed wow');
        reactions[i].removeWhere((wow) => wow.user.name == user.name);
        break;
      case 3:
        print('${user.name} removed haha');
        reactions[i].removeWhere((haha) => haha.user.name == user.name);
        break;
      case 4:
        print('${user.name} removed sad');
        reactions[i].removeWhere((sad) => sad.user.name == user.name);
        break;
      case 5:
        print('${user.name} removed angry');
        reactions[i].removeWhere((angry) => angry.user.name == user.name);
        break;
    }
  }

  Comment({
    @required this.text,
    @required this.user,
    @required this.commentedAt,
    @required this.reactions,
  });
}
