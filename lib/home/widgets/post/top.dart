import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:unihub/models/post_model.dart';
import 'package:unihub/models/user.dart';
import 'package:unihub/reusables/avatar_widget.dart';

class PostTopWidget extends StatelessWidget {
  final PostModel post;

  const PostTopWidget({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(horizontal: 6),
                child: Container(
                  child: AvatarWidget(
                    user: currentUser,
                  ),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  post.user.name,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                (post.location != null)
                    ? Text(
                        post.location,
                        style: TextStyle(
                            fontSize: 9, fontWeight: FontWeight.normal),
                      )
                    : Container()
              ],
            )
          ],
        ),
        IconButton(
          icon: Icon(
            FeatherIcons.moreHorizontal,
            color: Theme.of(context).primaryColorLight,
          ),
        )
      ],
    );
  }
}
