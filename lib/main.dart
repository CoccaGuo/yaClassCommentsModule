import 'package:flutter/material.dart';
import 'package:flutterlearn/ClassInfoPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Cocca Works")),
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
