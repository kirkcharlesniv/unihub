import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:unihub/home/widgets/comments/comments_modal.dart';
import 'package:unihub/models/comments.dart';
import 'package:unihub/models/post_model.dart';
import 'package:unihub/models/reaction_classes.dart';
import 'package:unihub/models/user.dart';

class PostBottomWidget extends StatefulWidget {
  final PostModel post;

  const PostBottomWidget({Key key, this.post}) : super(key: key);

  @override
  _PostBottomWidgetState createState() => _PostBottomWidgetState();
}

class _PostBottomWidgetState extends State<PostBottomWidget> {
  int reactionIndexToggled;
  void _toggleIsReacted(int i) {
    setState(() => widget.post.toggleReactedFor(currentUser, i));
  }

  void _toggleIsNotReacted(int i) {
    setState(() => widget.post.removeReaction(currentUser, i));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: Theme.of(context).primaryColorDark))),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      height: 18,
                    ),
                    if (widget.post.reactions[0].isNotEmpty)
                      SizedBox(
                        child: Icon(
                          FeatherIcons.thumbsUp,
                          color: Colors.blue,
                          size: 18,
                        ),
                      ),
                    if (widget.post.reactions[1].isNotEmpty)
                      SizedBox(
                        width: 18,
                        child: Image.asset('images/love.png'),
                      ),
                    if (widget.post.reactions[2].isNotEmpty)
                      SizedBox(
                        width: 18,
                        child: Image.asset('images/wow.png'),
                      ),
                    if (widget.post.reactions[3].isNotEmpty)
                      SizedBox(
                        width: 18,
                        child: Image.asset('images/haha.png'),
                      ),
                    if (widget.post.reactions[4].isNotEmpty)
                      SizedBox(
                        width: 18,
                        child: Image.asset('images/sad.png'),
                      ),
                    if (widget.post.reactions[5].isNotEmpty)
                      SizedBox(
                        width: 18,
                        child: Image.asset('images/angry.png'),
                      ),
                    SizedBox(
                      width: 4,
                    ),
                    if (widget.post.isReactionsNotEmpty())
                      if (widget.post.getListLength() == 1)
                        (widget.post.isReactedBy(currentUser))
                            ? Text('You')
                            : Text(widget.post.fetchRandomName(currentUser))
                      else if (widget.post.getListLength() == 2 &&
                          widget.post.isReactedBy(currentUser))
                        Text(
                            'You and ${widget.post.fetchRandomName(currentUser)}')
                      else if (!widget.post.isReactedBy(currentUser) &&
                          widget.post.getListLength() > 1)
                        Text(
                            '${widget.post.fetchRandomName(currentUser)}, and ${(widget.post.getListLength() - 1).toString()} other${(widget.post.getListLength() - 1) == 1 ? '' : 's'}')
                      else if (widget.post.getListLength() > 2 &&
                          widget.post.isReactedBy(currentUser))
                        Text(
                            'You, ${widget.post.fetchRandomName(currentUser)}, ${(widget.post.getListLength() - 1).toString()} others')
                  ],
                ),
                if (widget.post.comments.isNotEmpty)
                  Text('${widget.post.comments.length} Comments')
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlutterReactionButtonCheck(
                    onReactionChanged: (reaction, selectedIndex, isChecked) {
                      if (selectedIndex == -1) {
                        _toggleIsNotReacted(reactionIndexToggled);
                      } else {
                        _toggleIsNotReacted(reactionIndexToggled);
                        setState(() {
                          reactionIndexToggled = selectedIndex;
                        });
                        _toggleIsReacted(reactionIndexToggled);
                      }
                    },
                    reactions: facebookReactions,
                    initialReaction: Reaction(
                      previewIcon:
                          buildPreviewIconFacebook('assets/images/like.png'),
                      icon: buildIconFacebook(
                          'images/like.png',
                          Text(
                            'Like',
                            style: TextStyle(fontSize: 12),
                          )),
                    ),
                    selectedReaction: facebookReactions[0],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) =>
                          CommentsModal(
                            post: widget.post,
                            onPost: (String text) {
                              setState(() {
                                widget.post.comments.add(Comment(
                                  text: text,
                                  user: currentUser,
                                  commentedAt: DateTime.now(),
                                  reactions: [
                                    [],
                                    [],
                                    [],
                                    [],
                                    [],
                                    [],
                                  ],
                                ));
                              });
                            },
                          )));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(FeatherIcons.messageSquare,
                        color: Theme.of(context).accentColor),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Comment',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FeatherIcons.share2,
                      color: Theme.of(context).accentColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Share',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
