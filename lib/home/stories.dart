import 'package:flutter/material.dart';
import 'package:unihub/home/avatar_widget.dart';
import 'package:unihub/models/user.dart';

class Stories extends StatelessWidget {
  // TODO: Replace this list of users with a global one, or move it to a global state in the app.
  final _users = <User>[currentUser, christianLee, aefaith, matthew];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      color: Theme.of(context).primaryColorDark,
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Center(
              child: AvatarWidget(
                user: currentUser,
                isLarge: true,
                isShowingUsernameLabel: true,
                isCurrentUserStory: true,
              ),
            ),
          ),
          VerticalDivider(),
          Flexible(
            flex: 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _users.length,
              itemBuilder: (context, index) {
                return Center(
                  child: AvatarWidget(
                    user: _users[index],
                    isLarge: true,
                    isShowingUsernameLabel: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
