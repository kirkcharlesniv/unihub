import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:unihub/home/widgets/post/bottom.dart';
import 'package:unihub/home/widgets/post/top.dart';
import 'package:unihub/models/post_model.dart';

class Post extends StatelessWidget {
  final PostModel post;

  Post(this.post);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          height: MediaQuery.of(context).size.height * 0.69,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: PostTopWidget(
                  post: post,
                ),
              ),
              Flexible(
                flex: 5,
                child: Image.network(
                  post.imageUrls[0],
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              Flexible(
                flex: 2,
                child: PostBottomWidget(
                  post: post,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(32)),
                child: GestureDetector(
                  onTap: () {
                    // TODO: Expand comments section
                  },
                  // TODO: Map comments to comments_widget
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
                                post.user.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                timeago.format(post.postedAt),
                                style: TextStyle(
                                    fontWeight: FontWeight.w200, fontSize: 11),
                              ),
                            ],
                          ),
                          Text(
                            post.description,
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
          ))
    ]);
  }
}
