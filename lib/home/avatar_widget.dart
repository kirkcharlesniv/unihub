import 'package:flutter/material.dart';
import 'package:unihub/models/user.dart';

class AvatarWidget extends StatelessWidget {
  final User user;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;
  final bool isLarge;
  final bool isShowingUsernameLabel;
  final bool isCurrentUserStory;

  const AvatarWidget({
    @required this.user,
    this.onTap,
    this.padding = const EdgeInsets.all(8.0),
    this.isLarge = false,
    this.isShowingUsernameLabel = false,
    this.isCurrentUserStory = false,
  });

  static const _gradientBorderDecoration = BoxDecoration(
    shape: BoxShape.circle,
    gradient: SweepGradient(
      colors: [
        Color(0xFF833AB4), // Purple
        Color(0xFFF77737), // Orange
        Color(0xFFE1306C), // Red-pink
        Color(0xFFC13584), // Red-purple
      ],
    ),
  );
  static const _greyBoxShadowDecoration = BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(color: Colors.grey, blurRadius: 1.0, spreadRadius: 1.0)
    ],
  );

  @override
  Widget build(BuildContext context) {
    final radius = isLarge ? 22.0 : 14.0;
    final avatar = Column(
      mainAxisSize: MainAxisSize.min,
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
                      color: Theme.of(context).primaryColor, width: 3.0)),
//    border:
//        Border.fromBorderSide(BorderSide(color: Color(0xff303439), width: 3.0)),
                ),
                child: Container(
                  decoration: _greyBoxShadowDecoration,
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
                        width: 18.0,
                        height: 18.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Icon(Icons.add, size: 16.0, color: Colors.white),
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

    return Padding(
      padding: this.padding,
      child: GestureDetector(child: avatar, onTap: onTap),
    );
  }
}
