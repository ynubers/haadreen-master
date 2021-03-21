import 'package:flutter/material.dart';
import 'package:haadreen/Model/UserService.dart';
import 'package:haadreen/Utility/ApiHelper.dart';

const kBackgroundColor = Color(0xFFF8F8F8);
const kActiveIconColor = Color(0xFFE68342);
const kTextColor = Color.fromARGB(255, 32, 99, 132);
const KBlueLightColor = Color(0xFFC7B8F5);
const kBlueColor = Color(0xFFF8F8F8);
const kShadowColor = Color(0xFFE6E6E6);
// 0xFFF8F8F8

TextEditingController editingController = TextEditingController();
TabController controller;
bool show = false;

String text = 'https://medium.com/@suryadevsingh24032000';
String subject = 'follow me';
GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

Future<List<HaadreenList>> fetchList() async {
  if (user != null) {
    if (user.length > 0) return user;
  }
  ApiBaseHelper api = new ApiBaseHelper();
  final response = await api.excute({"query": "MyprocedureListHaadreen "});
  user = response
      .map<HaadreenList>((json) => HaadreenList.fromJson(json))
      .toList();
  return user;
}

Future<List<HaadreenList>> searchResults(String userSearch) async {
  if (user != null) {
    if (user.length > 0) return user;
  }
  ApiBaseHelper api = new ApiBaseHelper();
  final response = await api.excute(
    {"query": "MyprocedureListHaadreen "},
  );
  user = response
      .map<HaadreenList>((json) => HaadreenList.fromJson(json))
      .toList();
  return user;
}
