// ignore: file_names
// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_final_fields, avoid_print, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, non_constant_identifier_names, import_of_legacy_library_into_null_safe, unused_import

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'uploader.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormFieldState<String>> _PasswordFieldKey =
      GlobalKey<FormFieldState<String>>();

  String _username = '';
  String _password = '';
  bool _checkBoxValue = false;

  String _errorUsernameText = '';
  String _errorPasswordText = '';

  //username Controller
  TextEditingController _usernameController = new TextEditingController();
  //password Controller
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            print('点击空白处');
          },
          child: ListView(
            padding: EdgeInsets.only(top: 0),
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.blueAccent,
                    Colors.lightBlue,
                  ]),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      //decoration: BoxDecoration(color: Colors.grey),
                      height: 150,
                      child: Container(
                        //decoration: BoxDecoration(color: Colors.white30),
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Text('登录',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                        alignment: AlignmentDirectional.topCenter,
                        child: FractionallySizedBox(
                          child: Text('Big Daddy Uploader',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 11.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),

              //用户名输入框

              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextFormField(
                  controller: _usernameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(Icons.person),
                      hintText: 'please input student id:',
                      labelText: 'Student id',
                      errorText: _errorUsernameText.isEmpty
                          ? null
                          : _errorUsernameText),
                ),
              ),

              SizedBox(height: 24.0),

              //密码输入框

              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextFormField(
                  controller: _passwordController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(Icons.person),
                      hintText: 'please input password:',
                      labelText: 'Password',
                      errorText: _errorPasswordText.isEmpty
                          ? null
                          : _errorUsernameText),
                ),
              ),
              SizedBox(height: 24),

              //登录按钮
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: InkWell(
                  highlightColor: Colors.blue,
                  splashColor: Colors.teal,
                  onTap: () {
                    _login(context);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: LinearGradient(colors: [
                        Colors.blueAccent,
                        Colors.lightBlue,
                      ]),
                    ),
                    child: Center(
                      child: Text('登录',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    //用户名监听
    _usernameController.addListener(() {
      print(_usernameController.text);

      String student_id = _usernameController.text;
      if (student_id.isEmpty) {
        print('isEmpty');
        setState(() {
          _errorUsernameText = '请输入学号';
        });
      } else {
        setState(() {
          _errorUsernameText = '';
        });
      }
    });

    //密码监听
    _passwordController.addListener(() {
      String password = _passwordController.text;

      if (password.isEmpty) {
        setState(() {
          _errorPasswordText = '请输入密码';
        });
      } else {
        setState(() {
          _errorPasswordText = '';
        });
      }
    });

    super.initState();
  }

  void _showInfoDialog(String content) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: <Widget>[
            SimpleDialogOption(
              child: Text(content),
            )
          ],
        );
      },
    );
  }

  //处理登陆事件
  void _login(BuildContext context) async {
    Response response;
    var dio = Dio();
    Map<String, dynamic> formData = {
      'id': _usernameController.text,
      'pwd': _passwordController.text,
      'token': 'SOSD'
    };
    response = await dio.post('http://59.77.134.5:4999/', data: formData);
    print(response);

    if (response.data["message"] == "登陆成功") {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => uploaderPage()));
    } else if (response.data["message"] == "登陆失败") {
      print('11111');
      _showInfoDialog("登陆失败");
    }
  }
}
