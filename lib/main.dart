import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:unihub/favorites/favorite_screen.dart';
import 'package:unihub/home/home_screen.dart';
import 'package:unihub/profile/profile_screen.dart';
import 'package:unihub/search/search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _buildTheme(Brightness brightness) {
    return brightness == Brightness.dark
        ? ThemeData(
            primarySwatch: MaterialColor(4280361249, {
              50: Color(0xfff2f2f2),
              100: Color(0xffe6e6e6),
              200: Color(0xffcccccc),
              300: Color(0xffb3b3b3),
              400: Color(0xff999999),
              500: Color(0xff808080),
              600: Color(0xff666666),
              700: Color(0xff4d4d4d),
              800: Color(0xff333333),
              900: Color(0xff191919)
            }),
            brightness: Brightness.dark,
            primaryColor: Color(0xff303439),
            primaryColorBrightness: Brightness.dark,
            primaryColorLight: Color(0xffe0e0e0),
            primaryColorDark: Color(0xff282A2E),
            accentColor: Color(0xffd89a6e),
            accentColorBrightness: Brightness.dark,
            canvasColor: Color(0xff303439),
            scaffoldBackgroundColor: Color(0xff303439),
            bottomAppBarColor: Color(0xff424242),
            cardColor: Color(0xff424242),
            dividerColor: Color(0x1fffffff),
            highlightColor: Color(0x40cccccc),
            splashColor: Color(0x40cccccc),
            selectedRowColor: Color(0xfff5f5f5),
            unselectedWidgetColor: Color(0xb3ffffff),
            disabledColor: Color(0x62ffffff),
            buttonColor: Color(0xff5d656f),
            toggleableActiveColor: Color(0xffd89a6e),
            secondaryHeaderColor: Color(0xff616161),
            textSelectionColor: Color(0xffd89a6e),
            cursorColor: Color(0xff4285f4),
            textSelectionHandleColor: Color(0xffd89a6e),
            backgroundColor: Color(0xff616161),
            dialogBackgroundColor: Color(0xff424242),
            indicatorColor: Color(0xffd89a6e),
            hintColor: Color(0x80ffffff),
            errorColor: Color(0xffd32f2f),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.normal,
              minWidth: 88,
              height: 36,
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(0xff000000),
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(Radius.circular(2.0)),
              ),
              alignedDropdown: false,
              buttonColor: Color(0xff5d656f),
              disabledColor: Color(0x61ffffff),
              highlightColor: Color(0x29ffffff),
              splashColor: Color(0x1fffffff),
              focusColor: Color(0x1fffffff),
              hoverColor: Color(0x0affffff),
              colorScheme: ColorScheme(
                primary: Color(0xff303439),
                primaryVariant: Color(0xff000000),
                secondary: Color(0xff64ffda),
                secondaryVariant: Color(0xff00bfa5),
                surface: Color(0xff424242),
                background: Color(0xff616161),
                error: Color(0xffd32f2f),
                onPrimary: Color(0xffffffff),
                onSecondary: Color(0xff000000),
                onSurface: Color(0xffffffff),
                onBackground: Color(0xffffffff),
                onError: Color(0xff000000),
                brightness: Brightness.dark,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                color: Color(0xffffffff),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              helperStyle: TextStyle(
                color: Color(0xffffffff),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              hintStyle: TextStyle(
                color: Color(0xffffffff),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              errorStyle: TextStyle(
                color: Color(0xffffffff),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              errorMaxLines: null,
              hasFloatingPlaceholder: true,
              isDense: false,
              contentPadding:
                  EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
              isCollapsed: false,
              prefixStyle: TextStyle(
                color: Color(0xffffffff),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              suffixStyle: TextStyle(
                color: Color(0xffffffff),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              counterStyle: TextStyle(
                color: Color(0xffffffff),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              filled: false,
              fillColor: Color(0x00000000),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff000000),
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff000000),
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  gapPadding: 4),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff000000),
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff000000),
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff000000),
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff000000),
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
              opacity: 1,
              size: 24,
            ),
            primaryIconTheme: IconThemeData(
              color: Colors.white,
              opacity: 1,
              size: 24,
            ),
            accentIconTheme: IconThemeData(
              color: Color(0xff000000),
              opacity: 1,
              size: 24,
            ),
            sliderTheme: SliderThemeData(
              activeTrackColor: null,
              inactiveTrackColor: null,
              disabledActiveTrackColor: null,
              disabledInactiveTrackColor: null,
              activeTickMarkColor: null,
              inactiveTickMarkColor: null,
              disabledActiveTickMarkColor: null,
              disabledInactiveTickMarkColor: null,
              thumbColor: Color(0xffd89a6e),
              disabledThumbColor: null,
              overlayColor: null,
              valueIndicatorColor: Color(0xffb29a6e),
              showValueIndicator: ShowValueIndicator.always,
              valueIndicatorTextStyle: TextStyle(
                color: Color(0xdd000000),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
            tabBarTheme: TabBarTheme(
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Color(0xffffffff),
              unselectedLabelColor: Color(0xb2ffffff),
            ),
            chipTheme: ChipThemeData(
              backgroundColor: Color(0x1fffffff),
              brightness: Brightness.dark,
              deleteIconColor: Color(0xdeffffff),
              disabledColor: Color(0x0cffffff),
              labelPadding:
                  EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
              labelStyle: TextStyle(
                color: Color(0xdeffffff),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
              secondaryLabelStyle: TextStyle(
                color: Color(0x3dffffff),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              secondarySelectedColor: Color(0x3d212121),
              selectedColor: Color(0x3dffffff),
              shape: StadiumBorder(
                  side: BorderSide(
                color: Color(0xff000000),
                width: 0,
                style: BorderStyle.none,
              )),
            ),
            dialogTheme: DialogTheme(
                shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xff000000),
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
            )),
          )
        : ThemeData(
            primarySwatch: MaterialColor(
              0xFFFFFFFF,
              const <int, Color>{
                50: const Color(0xFFFFFFFF),
                100: const Color(0xFFFFFFFF),
                200: const Color(0xFFFFFFFF),
                300: const Color(0xFFFFFFFF),
                400: const Color(0xFFFFFFFF),
                500: const Color(0xFFFFFFFF),
                600: const Color(0xFFFFFFFF),
                700: const Color(0xFFFFFFFF),
                800: const Color(0xFFFFFFFF),
                900: const Color(0xFFFFFFFF),
              },
            ),
            brightness: Brightness.light,
            primaryColor: Color(0xffffffff),
            primaryColorBrightness: Brightness.light,
            primaryColorLight: Color(0xff757575),
            primaryColorDark: Color(0xffeeeeee),
            accentColor: Color(0xff808080),
            accentColorBrightness: Brightness.dark,
            canvasColor: Color(0xfffafafa),
            scaffoldBackgroundColor: Color(0xfffafafa),
            bottomAppBarColor: Color(0xffffffff),
            cardColor: Color(0xffffffff),
            dividerColor: Color(0x1f000000),
            highlightColor: Color(0x66bcbcbc),
            splashColor: Color(0x66c8c8c8),
            selectedRowColor: Color(0xfff5f5f5),
            unselectedWidgetColor: Color(0x8a000000),
            disabledColor: Color(0x61000000),
            buttonColor: Color(0xffe0e0e0),
            toggleableActiveColor: Color(0xff666666),
            secondaryHeaderColor: Color(0xfff2f2f2),
            textSelectionColor: Color(0xffcccccc),
            cursorColor: Color(0xff4285f4),
            textSelectionHandleColor: Color(0xffb3b3b3),
            backgroundColor: Color(0xffcccccc),
            dialogBackgroundColor: Color(0xffffffff),
            indicatorColor: Color(0xff808080),
            hintColor: Color(0x8a000000),
            errorColor: Color(0xffd32f2f),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.normal,
              minWidth: 88,
              height: 36,
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(0xff000000),
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(Radius.circular(2.0)),
              ),
              alignedDropdown: false,
              buttonColor: Color(0xffe0e0e0),
              disabledColor: Color(0x61000000),
              highlightColor: Color(0x29000000),
              splashColor: Color(0x1f000000),
              focusColor: Color(0x1f000000),
              hoverColor: Color(0x0a000000),
              colorScheme: ColorScheme(
                primary: Color(0xffffffff),
                primaryVariant: Color(0xff4d4d4d),
                secondary: Color(0xff808080),
                secondaryVariant: Color(0xff4d4d4d),
                surface: Color(0xffffffff),
                background: Color(0xffcccccc),
                error: Color(0xffd32f2f),
                onPrimary: Color(0xff000000),
                onSecondary: Color(0xffffffff),
                onSurface: Color(0xff000000),
                onBackground: Color(0xff000000),
                onError: Color(0xffffffff),
                brightness: Brightness.light,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                color: Color(0xdd000000),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              helperStyle: TextStyle(
                color: Color(0xdd000000),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              hintStyle: TextStyle(
                color: Color(0xdd000000),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              errorStyle: TextStyle(
                color: Color(0xdd000000),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              errorMaxLines: null,
              hasFloatingPlaceholder: true,
              isDense: false,
              contentPadding:
                  EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
              isCollapsed: false,
              prefixStyle: TextStyle(
                color: Color(0xdd000000),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              suffixStyle: TextStyle(
                color: Color(0xdd000000),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              counterStyle: TextStyle(
                color: Color(0xdd000000),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              filled: false,
              fillColor: Color(0x00000000),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff000000),
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff000000),
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff000000),
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff000000),
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff000000),
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff000000),
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
            iconTheme: IconThemeData(
              color: Color(0xdd000000),
              opacity: 1,
              size: 24,
            ),
            primaryIconTheme: IconThemeData(
              color: Color(0xff000000),
              opacity: 1,
              size: 24,
            ),
            accentIconTheme: IconThemeData(
              color: Color(0xffffffff),
              opacity: 1,
              size: 24,
            ),
            sliderTheme: SliderThemeData(
              activeTrackColor: null,
              inactiveTrackColor: null,
              disabledActiveTrackColor: null,
              disabledInactiveTrackColor: null,
              activeTickMarkColor: null,
              inactiveTickMarkColor: null,
              disabledActiveTickMarkColor: null,
              disabledInactiveTickMarkColor: null,
              thumbColor: null,
              disabledThumbColor: null,
              overlayColor: null,
              valueIndicatorColor: null,
              showValueIndicator: null,
              valueIndicatorTextStyle: TextStyle(
                color: Color(0xffffffff),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
            tabBarTheme: TabBarTheme(
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Color(0xdd000000),
              unselectedLabelColor: Color(0xb2000000),
            ),
            chipTheme: ChipThemeData(
              backgroundColor: Color(0x1f000000),
              brightness: Brightness.light,
              deleteIconColor: Color(0xde000000),
              disabledColor: Color(0x0c000000),
              labelPadding:
                  EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
              labelStyle: TextStyle(
                color: Color(0xde000000),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
              secondaryLabelStyle: TextStyle(
                color: Color(0x3d000000),
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              secondarySelectedColor: Color(0x3dffffff),
              selectedColor: Color(0x3d000000),
              shape: StadiumBorder(
                  side: BorderSide(
                color: Color(0xff000000),
                width: 0,
                style: BorderStyle.none,
              )),
            ),
            dialogTheme: DialogTheme(
                shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xff000000),
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
            )),
          );
  }

  int _page = 0;

  static final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.dark,
      data: (brightness) => _buildTheme(brightness),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          title: 'Unihub',
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              bottomNavigationBar: CurvedNavigationBar(
                index: _page,
                height: 50,
                items: <Widget>[
                  (_page == 0)
                      ? Icon(EvaIcons.searchOutline, color: Color(0xffF1A26A))
                      : Icon(
                          EvaIcons.searchOutline,
                          color: Colors.black,
                        ),
                  (_page == 1)
                      ? Icon(EvaIcons.homeOutline, color: Color(0xffF1A26A))
                      : Icon(EvaIcons.homeOutline, color: Colors.black),
                  (_page == 2)
                      ? Icon(EvaIcons.personOutline, color: Color(0xffF1A26A))
                      : Icon(EvaIcons.personOutline, color: Colors.black),
                  (_page == 3)
                      ? Icon(EvaIcons.heartOutline, color: Color(0xffF1A26A))
                      : Icon(EvaIcons.heartOutline, color: Colors.black),
                ],
                backgroundColor: theme.primaryColorDark,
                animationCurve: Curves.easeOut,
                animationDuration: Duration(milliseconds: 500),
                onTap: (index) {
                  setState(() {
                    _pageController.animateToPage(index,
                        curve: Curves.easeOut,
                        duration: Duration(milliseconds: 350));
                    _page = index;
                  });
                },
              ),
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
      },
    );
  }
}
