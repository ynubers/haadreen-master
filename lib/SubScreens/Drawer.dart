import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myDrawerMenu() {
  return Drawer(
    child: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: <Widget>[
                ListTile(
                    trailing: Icon(Icons.home),
                    title: Text(
                      "الرئيسية",
                      textAlign: TextAlign.end,
                    ),
                    onTap: () {
                      // Home button action
                    }),
                ListTile(
                    trailing: Icon(Icons.person),
                    title: Text(
                      "الملف الشخصي",
                      textAlign: TextAlign.end,
                    ),
                    onTap: () {}),
                ListTile(
                    trailing: Icon(Icons.search),
                    title: Text(
                      "البحث عن الخدمات",
                      textAlign: TextAlign.end,
                    ),
                    onTap: () {}),
                ListTile(
                    trailing: Icon(Icons.help),
                    title: Text(
                      "للمساعدة",
                      textAlign: TextAlign.end,
                    ),
                    onTap: () {
                      // Home button action
                    }),
              ],
            ))),
  );
}
