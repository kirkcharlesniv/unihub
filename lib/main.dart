import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:unihub/favorites/favorite_screen.dart';
import 'package:unihub/home/home_screen.dart';
import 'package:unihub/profile/profile_screen.dart';
import 'package:unihub/search/search_screen.dart';
import 'package:unihub/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _page = 0;

  static final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unihub',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: Scaffold(
          bottomNavigationBar: bottomNavigationBar(),
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _page = index;
              });
            },
            children: <Widget>[
              SearchScreen(),
              HomeScreen(),
              ProfileScreen(),
              FavoritesScreen()
            ],
          )),
    );
  }

  Widget bottomNavigationBar() {
    return CurvedNavigationBar(
      index: _page,
      height: 50,
      items: <Widget>[
        (_page == 0)
            ? Icon(EvaIcons.searchOutline, color: Color(0xffF1A26A))
            : Icon(EvaIcons.searchOutline),
        (_page == 1)
            ? Icon(EvaIcons.homeOutline, color: Color(0xffF1A26A))
            : Icon(EvaIcons.homeOutline),
        (_page == 2)
            ? Icon(EvaIcons.personOutline, color: Color(0xffF1A26A))
            : Icon(EvaIcons.personOutline),
        (_page == 3)
            ? Icon(EvaIcons.heartOutline, color: Color(0xffF1A26A))
            : Icon(EvaIcons.heartOutline),
      ],
      backgroundColor: Color(0xff303439),
      animationCurve: Curves.easeOut,
      animationDuration: Duration(milliseconds: 500),
      onTap: (index) {
        setState(() {
          _pageController.animateToPage(index,
              curve: Curves.easeOut, duration: Duration(milliseconds: 350));
          _page = index;
        });
      },
    );
  }
}
