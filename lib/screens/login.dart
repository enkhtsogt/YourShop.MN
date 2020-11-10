import 'package:flutter/material.dart';
import 'package:yourshopmn/screens/verifynumber.dart';

import 'package:yourshopmn/utils/progressdialog.dart';
import 'package:yourshopmn/widgets/edittext.dart';
import 'package:yourshopmn/widgets/header.dart';
import 'package:yourshopmn/widgets/submitbutton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ProgressDialog progressDialog;

  @override
  Widget build(BuildContext context) {
    progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Нэвтэрч байна...');
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Text("Та тавтай морилно уу",
                    style: Theme.of(context).textTheme.title),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Нэвтрэх",
                      style: Theme.of(context).textTheme.subtitle),
                ),
                EditText(title: "И-мэйл хаяг"),
                EditText(title: "Нууц үг"),
                SubmitButton(
                  title: "Нэвтрэх",
                  act: () async {
                    progressDialog.show();
                    Future.delayed(const Duration(milliseconds: 1500), () {
                      setState(() {
                        progressDialog.hide();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifyScreen(),
                          ),
                        );
                      });
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text("Та нууц үгээ мартсан уу?"),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Та бүртгэлгүй юу?  ",
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Бүртгүүлэх",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
