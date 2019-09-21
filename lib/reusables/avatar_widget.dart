import 'package:flutter/material.dart';
import 'package:unihub/models/user.dart';

class AvatarWidget extends StatelessWidget {
  final User user;
  final VoidCallback onTap;
  final bool isLarge;
  final bool isShowingUsernameLabel;
  final bool isCurrentUserStory;
  final bool isTransparent;

  const AvatarWidget({
    @required this.user,
    this.onTap,
    this.isLarge = false,
    this.isShowingUsernameLabel = false,
    this.isCurrentUserStory = false,
    this.isTransparent = false,
  });

  static const _gradientBorderDecoration = BoxDecoration(
    shape: BoxShape.circle,
    gradient: SweepGradient(
      colors: [
        Color(0xFF00c6ff),
        Color(0xFF22a7f0),
        Color(0xFF0072ff),
        Color(0xFF00c6ff),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final radius = isLarge ? 22.0 : 14.0;
    final avatar = Column(
      mainAxisAlignment: (isLarge)
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          height: radius * 2 + 9.0,
          width: radius * 2 + 9.0,
          decoration: user.stories.isEmpty ? null : _gradientBorderDecoration,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(BorderSide(
                      color: isTransparent
                          ? Colors.transparent
                          : Theme.of(context).primaryColor,
                      width: 2.5)),
                ),
                child: Container(
                  child: CircleAvatar(
                    radius: radius,
                    backgroundImage: NetworkImage(user.imageUrl),
                  ),
                ),
              ),
              (isCurrentUserStory && user.stories.isEmpty)
                  ? Positioned(
                      right: 2.0,
                      bottom: 2.0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Icon(Icons.add, size: 12.5, color: Colors.white),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
        (isShowingUsernameLabel)
            ? Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  isCurrentUserStory
                      ? 'Your Story'
                      : (user.name.length <= 15)
                          ? user.name
                          : '${user.name.substring(0, 15)}...',
                  textScaleFactor: 0.9,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            : Container()
      ],
    );

    return GestureDetector(child: avatar, onTap: onTap);
  }
}
