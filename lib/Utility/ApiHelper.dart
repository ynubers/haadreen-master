import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haadreen/Model/UserService.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  Map<String, String> get headers => {
        'Authorization': 'Basic UG93ZXJlZC1CeSA6IEhhc2FuIEFidSBHaGFseW91bg==',
        "Content-Type": "application/x-www-form-urlencoded",
      };

  Future<dynamic> excute(Map<String, dynamic> body) async {
    String _baseUrl = Uri.encodeFull('$myUrl');
    var responseJson;
    try {
      final response = await http.post(_baseUrl, headers: headers, body: body);
      responseJson = json.decode(response.body.toString());
    } on SocketException {
      Fluttertoast.showToast(
          msg: 'No Internet connection', textColor: Colors.red);
    }
    return responseJson;
  }
}
