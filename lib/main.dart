import 'package:flutter/material.dart';
import 'package:yourshopmn/screens/login.dart';
import 'package:yourshopmn/widgets/header.dart';
import 'package:yourshopmn/widgets/mainbody.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.white,
        primaryColor: Color(0xFFF93963),
        accentColor: Colors.cyan[600],
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          subtitle: TextStyle(fontSize: 16),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          display1: TextStyle(
              fontSize: 14.0, fontFamily: 'Montserrat1', color: Colors.white),
          display2: TextStyle(
              fontSize: 14.0, fontFamily: 'Montserrat', color: Colors.black54),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
