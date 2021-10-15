// ignore_for_file: unnecessary_new

//import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'uploader.dart';
import 'loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Big Daddy Uploader"),
          ),
          body: LoginPage()),
    );
  }
}
