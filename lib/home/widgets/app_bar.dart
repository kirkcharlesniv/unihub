import 'package:badges/badges.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'images/logo.png',
        height: MediaQuery.of(context).size.height * 0.03,
      ),
      centerTitle: true,
      elevation: 2,
      leading: IconButton(
        onPressed: () {
          setState(() {
            isDark = !isDark;
          });

          (isDark)
              ? DynamicTheme.of(context).setBrightness(Brightness.dark)
              : DynamicTheme.of(context).setBrightness(Brightness.light);
        },
        icon: Icon(
          FeatherIcons.camera,
        ),
      ),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 8),
          child: Badge(
            position: BadgePosition.topRight(top: 4, right: 4),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeColor: Color(0xff22a7f0),
            badgeContent: Text(
              '1',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w900),
            ),
            child: Center(
              child: IconButton(
                  icon: Icon(
                    FeatherIcons.messageSquare,
                  ),
                  onPressed: () {}),
            ),
          ),
        )
      ],
    );
  }
}
