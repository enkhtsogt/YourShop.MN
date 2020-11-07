import 'package:flutter/material.dart';
import 'package:yourshopmn/widgets/header.dart';
import 'package:yourshopmn/widgets/mainbody.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainBody(),
    );
  }
}
