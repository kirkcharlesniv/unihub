import 'package:flutter/material.dart';
import 'package:unihub/models/user.dart';
import 'package:unihub/reusables/avatar_widget.dart';

class Stories extends StatelessWidget {
  // TODO: Replace this list of users with a global one, or move it to a global state in the app.
  final _users = <User>[currentUser, christianLee, aefaith, matthew];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Theme.of(context).primaryColorDark))),
        height: MediaQuery.of(context).size.height * 0.125,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _users.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AvatarWidget(
                user: _users[index],
                isLarge: true,
                isShowingUsernameLabel: true,
                isCurrentUserStory: index == 0,
              ),
            );
          },
        ));
  }
}
