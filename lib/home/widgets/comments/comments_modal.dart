import 'package:flutter/material.dart';
import 'package:unihub/models/post_model.dart';
import 'package:unihub/models/user.dart';
import 'package:unihub/reusables/avatar_widget.dart';

import 'comments_widget.dart';

class CommentsModal extends StatefulWidget {
  final PostModel post;
  final ValueChanged<String> onPost;
  const CommentsModal({Key key, this.post, this.onPost}) : super(key: key);

  @override
  _CommentsModalState createState() => _CommentsModalState();
}

class _CommentsModalState extends State<CommentsModal>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  final _textController = TextEditingController();
  bool _canPost = false;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();

    _textController.addListener(() {
      setState(() => _canPost = _textController.text.isNotEmpty);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.75),
      body: ScaleTransition(
        scale: scaleAnimation,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Container(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: SimpleDialogOption(
                        onPressed: () {
                          controller.reverse();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    )),
                  ),
                  Flexible(
                    flex: 9,
                    child: Container(
                      child: ListView.builder(
                        itemCount: widget.post.comments.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CommentWidget(
                              comment: widget.post.comments[index]);
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          AvatarWidget(
                            user: currentUser,
                            isTransparent: true,
                          ),
                          Flexible(
                            child: TextField(
                              controller: _textController,
                              decoration: InputDecoration(
                                hintText: 'Add a comment...',
                                border: InputBorder.none,
                              ),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          FlatButton(
                              child: Opacity(
                                opacity: _canPost ? 1.0 : 0.4,
                                child: Text('Post',
                                    style: TextStyle(color: Colors.blue)),
                              ),
                              onPressed: () {
                                if (_canPost) {
                                  widget.onPost(_textController.text);
                                  _textController.text = "";
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());

                                  // Refresh the state so that it can register the new comment.
                                  setState(() {});
                                }
                                return null;
                              })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
