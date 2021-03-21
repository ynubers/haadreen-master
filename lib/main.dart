import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'General/Constant.dart';
import 'MainScreens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'haadreen',
      theme: ThemeData(
        fontFamily: "Raleway",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: Home(),
    );
  }
}
