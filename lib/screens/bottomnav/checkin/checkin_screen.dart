import 'package:flutter/material.dart';

class CheckinScreen extends StatefulWidget {
  CheckinScreen({Key key}) : super(key: key);

  @override
  _CheckinScreenState createState() => _CheckinScreenState();
}

class _CheckinScreenState extends State<CheckinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Checkin'),
      // ),
      body: Center(
        child: Text("Checkin Screen"),
      ),
    );
    ;
  }
}
