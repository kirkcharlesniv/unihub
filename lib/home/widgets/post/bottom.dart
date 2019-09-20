import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:unihub/models/comments.dart';
import 'package:unihub/models/post_model.dart';
import 'package:unihub/models/reaction_classes.dart';
import 'package:unihub/models/user.dart';
import 'package:unihub/reusables/avatar_widget.dart';

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

  void _showAddCommentModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddCommentModal(
            user: currentUser,
            onPost: (String text) {
              setState(() {
                widget.post.comments.add(Comment(
                  text: text,
                  user: currentUser,
                  commentedAt: DateTime.now(),
                  reactions: [[], [], [], [], [], []],
                ));
              });
              Navigator.pop(context);
            },
          ),
        );
      },
    );
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
                    Text('You and ${widget.post.fetchRandomName(currentUser)}')
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
          ),
        ),
        Container(
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

                      print(widget.post.isReactionsNotEmpty());
                      print('List length: ${widget.post.getListLength()}');
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
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(FeatherIcons.messageSquare),
                    onPressed: () {},
                    color: Theme.of(context).accentColor,
                  ),
                  Text(
                    'Comment',
                    style: TextStyle(fontSize: 12),
                  )
                ],
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

class AddCommentModal extends StatefulWidget {
  final User user;
  final ValueChanged<String> onPost;

  AddCommentModal({@required this.user, @required this.onPost});

  @override
  _AddCommentModalState createState() => _AddCommentModalState();
}

class _AddCommentModalState extends State<AddCommentModal> {
  final _textController = TextEditingController();
  bool _canPost = false;

  @override
  void initState() {
    _textController.addListener(() {
      setState(() => _canPost = _textController.text.isNotEmpty);
    });
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AvatarWidget(user: widget.user),
        Expanded(
          child: TextField(
            controller: _textController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Add a comment...',
              border: InputBorder.none,
            ),
          ),
        ),
        FlatButton(
          child: Opacity(
            opacity: _canPost ? 1.0 : 0.4,
            child: Text('Post', style: TextStyle(color: Colors.blue)),
          ),
          onPressed:
              _canPost ? () => widget.onPost(_textController.text) : null,
        )
      ],
    );
  }
}
