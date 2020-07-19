import 'package:flutter/material.dart';
import 'package:flutterlearn/pages/ClassInfoPage.dart';
import 'package:flutterlearn/theme/Themes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: crowTheme(),
        home: Scaffold(
          appBar: AppBar(title: Text("课程评价")),
          body: MyLayout(),
    ));
  }
}

class MyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClassInfoPage();
  }
}
