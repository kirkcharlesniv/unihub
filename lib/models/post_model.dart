import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:unihub/models/post_details.dart';
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

  void addLikeIfUnlikedFor(User user) {
    if (!isLikedBy(user)) {
      likes.add(Like(user: user));
    }
  }

  void toggleLikeFor(User user) {
    addLikeIfUnlikedFor(user);
  }

  void removeReaction(User user) {
    likes.removeWhere((like) => like.user.name == user.name);
  }

  PostModel({
    @required this.imageUrls,
    @required this.user,
    @required this.postedAt,
    @required this.likes,
    @required this.comments,
    @required this.description,
    this.location,
  });
}
