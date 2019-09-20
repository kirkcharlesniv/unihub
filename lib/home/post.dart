import 'dart:async';

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:unihub/models/post_model.dart';
import 'package:unihub/models/reaction_classes.dart';
import 'package:unihub/models/user.dart';

import '../reusables/avatar_widget.dart';

class Post extends StatefulWidget {
  final PostModel post;

  Post(this.post);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  int reactionIndexToggled;
  final StreamController<void> _doubleTapImageEvents =
      StreamController.broadcast();

  @override
  void dispose() {
    _doubleTapImageEvents.close();
    super.dispose();
  }

  void _onDoubleTapLikePhoto() {
    setState(() => widget.post.addLikeIfUnlikedFor(currentUser));
    _doubleTapImageEvents.sink.add(null);
  }

  void _toggleIsLiked() {
    setState(() => widget.post.toggleLikeFor(currentUser));
  }

  void _toggleIsNotLiked() {
    setState(() => widget.post.removeReaction(currentUser));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          AvatarWidget(
                            user: currentUser,
                          ),
                          Text(
                            widget.post.user.name,
                            style: TextStyle(fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: Text(
                          'Follow',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Image.network(
                          widget.post.imageUrls[0],
                          fit: BoxFit.cover,
                          height: double.infinity,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: FlutterReactionButtonCheck(
                              onReactionChanged:
                                  (reaction, selectedIndex, isChecked) {
                                (isChecked)
                                    ? _toggleIsLiked()
                                    : _toggleIsNotLiked();
                              },
                              reactions: facebookReactions,
                              initialReaction: defaultInitialReaction,
                              selectedReaction: facebookReactions[0],
                            ),
                          ),
                          if (widget.post.likes.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Row(
                                children: <Widget>[
                                  Text(widget.post.likes[0].user.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  if (widget.post.likes.length > 1) ...[
                                    Text(' and'),
                                    Text(
                                        ' ${widget.post.likes.length - 1} others',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ]
                                ],
                              ),
                            ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(EvaIcons.moreVertical),
                            onPressed: () {},
                            color: Theme.of(context).accentColor,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(32)),
          child: GestureDetector(
            onTap: () {
              // TODO: Expand comments section
            },
            child: Container(
              width: double.infinity,
              color: Theme.of(context).primaryColorDark,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 32, bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          widget.post.user.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          timeago.format(widget.post.postedAt),
                          style: TextStyle(fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                    Text(
                      widget.post.description,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
