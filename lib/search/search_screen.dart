import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('@matt.wojitas'),
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            EvaIcons.arrowBack,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[],
      ),
      body: Container(
        child: Center(
          child: Text(
            'Page 1',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
