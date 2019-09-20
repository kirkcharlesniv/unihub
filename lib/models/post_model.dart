import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:unihub/models/comments.dart';
import 'package:unihub/models/reaction_classes.dart';
import 'package:unihub/models/user.dart';

class PostModel {
  List<String> imageUrls;
  final User user;
  final DateTime postedAt;
  final String description;

  List<Like> likes;
  List<Comment> comments;
  String location;

  String timeAgo() {
    final now = DateTime.now();
    return timeago.format(now.subtract(now.difference(postedAt)));
  }

  bool isLikedBy(User user) {
    return likes.any((like) => like.user.name == user.name);
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

  String fetchRandomName(User currentUser) {
    return reactions
        .firstWhere((reaction) => reaction.isNotEmpty, orElse: () => [])
        .firstWhere((instance) => instance.user.name != currentUser.name,
            orElse: () => null)
        .user
        .name;
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

  PostModel({
    @required this.imageUrls,
    @required this.user,
    @required this.postedAt,
    @required this.reactions,
    @required this.comments,
    @required this.description,
    this.location,
  });
}
