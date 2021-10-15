import 'dart:io' as prefix;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2_1/main.dart';
//import 'package:image_cropper/image_cropper.dart';
//import "package:images_picker/images_picker.dart";
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class uploaderPage extends StatefulWidget {
  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<uploaderPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: ListView(
            padding: EdgeInsets.only(top: 0),
            children: <Widget>[
              Container(
                  height: 300,
                  color: Colors.black,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Image.asset(
                        "images/logo.png",
                        width: 150,
                        height: 150,
                      ),
                    ],
                  )),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Column(
                  children: const [
                    SizedBox(height: 35.0),
                    Text(
                      "大宝贝助手",
                      textScaleFactor: 1.25,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("选择要上传的文件",
                        textScaleFactor: 0.75,
                        style: TextStyle(color: Colors.blue))
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 25.0),
                    // ignore: deprecated_member_use
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: 100,
                          child: const Text(
                            "选择文件",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        color: Colors.blue,
                        onPressed: () {}),
                    const SizedBox(
                      height: 20.0,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: 100,
                          child: const Text(
                            "上传文件",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        color: Colors.green,
                        onPressed: () async {
                          _pickImage(context);
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _pickImage(BuildContext context) async {
    var asset;
    final List<AssetEntity>? assets = await AssetPicker.pickAssets(context,
        selectedAssets: asset, requestType: RequestType.image);

    Image(
        image: AssetEntityImageProvider(asset), alignment: Alignment(0.0, 0.0));
  }
}
