import 'package:flutter/material.dart';
import 'package:unihub/home/home_page.dart';
import 'package:unihub/home/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size(double.infinity, MediaQuery.of(context).size.height * 0.07),
          child: HomeAppBar(),
        ),
        body: HomePage());
  }
}
