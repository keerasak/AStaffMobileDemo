import 'package:flutter/material.dart';

class BenefitScreen extends StatefulWidget {
  BenefitScreen({Key key}) : super(key: key);

  @override
  _BenefitScreenState createState() => _BenefitScreenState();
}

class _BenefitScreenState extends State<BenefitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Benefit'),
      // ),
      body: Center(
        child: Text("Benefit Screen"),
      ),
    );
  }
}
