import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yourshopmn/screens/verificationcode.dart';
import 'package:yourshopmn/widgets/socialbottomsheet.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  var _txtNumber = TextEditingController();
  String _txtNumberHint = "91091002";

  @override
  void initState() {
    _txtNumber.addListener(() {
      setState(() {
        _txtNumberHint = _txtNumber.text;
        print("Утасны дугаараа оруулна уу: ${_txtNumber.text}");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 96.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text("Утасны дугаараар баталгаажуулах",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.title),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, bottom: 36.0),
                  child: Text(
                      "Бид таны  +976$_txtNumberHint-луу мессеж илгээлээ.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 24.0, bottom: 8.0, left: 24.0, right: 24.0),
                      child: TextField(
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).dividerColor,
                          hintStyle: Theme.of(context).textTheme.subtitle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 36.0, bottom: 8.0, left: 36.0, right: 24.0),
                      child: CountryPickerDropdown(
                        initialValue: 'mn',
                        itemBuilder: _buildDropdownItem,
                        onValuePicked: (Country country) {
                          print("${country.name}");
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 24.0, bottom: 8.0, left: 184.0, right: 24.0),
                      child: TextField(
                        controller: _txtNumber,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.timesCircle,
                              color: Theme.of(context).accentColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _txtNumber.text = "";
                              });
                              print("Дугаар арилгах.");
                            },
                          ),
                          hintText: "Дугаар",
                          hintStyle: Theme.of(context).textTheme.display2,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 36.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Сошиалаар нэвтрэх   ",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      GestureDetector(
                        onTap: () {
                          socialBottomSheet(context);
                          print("Social дарагдсан");
                        },
                        child: Text(
                          "Сошиал сүлжээ",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(4.0),
                            ),
                            color: Color(0xFFF93963),
                            onPressed: () => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerificationScreen()),
                              ),
                            },
                            child: new Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 10.0,
                              ),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(
                                    child: Text(
                                      "Дараагийн",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildDropdownItem(Country country) => Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(
          width: 8.0,
        ),
        Text(
          "+${country.phoneCode}(${country.isoCode})",
          style: TextStyle(fontSize: 14),
        ),
      ],
    );

void socialBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SocialBottomSheet();
      });
}
