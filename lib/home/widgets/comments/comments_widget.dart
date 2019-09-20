import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:unihub/models/comments.dart';
import 'package:unihub/models/reaction_classes.dart';
import 'package:unihub/models/user.dart';

class CommentWidget extends StatefulWidget {
  final Comment comment;

  const CommentWidget({Key key, this.comment}) : super(key: key);

  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  int reactionIndexToggled;
  void _toggleIsReacted(int i) {
    setState(() => widget.comment.toggleReactedFor(currentUser, i));
  }

  void _toggleIsNotReacted(int i) {
    setState(() => widget.comment.removeReaction(currentUser, i));
  }

  Text _buildRichText() {
    var currentTextData = StringBuffer();
    var textSpans = <TextSpan>[
      TextSpan(
          text: '${widget.comment.user.name} ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
    ];
    this.widget.comment.text.split(' ').forEach((word) {
      if (word.startsWith('#') && word.length > 1) {
        if (currentTextData.isNotEmpty) {
          textSpans.add(TextSpan(
              text: currentTextData.toString(),
              style: TextStyle(color: Colors.black)));
          currentTextData.clear();
        }
        textSpans.add(TextSpan(
            text: '$word ', style: TextStyle(color: Color(0xFF3F729B))));
      } else {
        currentTextData.write('$word ');
      }
    });
    if (currentTextData.isNotEmpty) {
      textSpans.add(TextSpan(
          text: currentTextData.toString(),
          style: TextStyle(color: Colors.black)));
      currentTextData.clear();
    }
    return Text.rich(TextSpan(children: textSpans));
  }

  @override
  Widget build(BuildContext context) {
    print(widget.comment.reactions);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SingleChildScrollView(
            child: _buildRichText(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: FlutterReactionButtonCheck(
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
                previewIcon: buildPreviewIconFacebook('assets/images/like.png'),
                icon: buildIconFacebook(
                    'images/like.png',
                    Text(
                      'Like',
                      style: TextStyle(fontSize: 12),
                    )),
              ),
              selectedReaction: facebookReactions[0],
            ),
          ),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
