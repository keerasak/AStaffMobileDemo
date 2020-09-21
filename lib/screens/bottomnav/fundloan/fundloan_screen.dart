import 'package:flutter/material.dart';

class FundloanScreen extends StatefulWidget {
  FundloanScreen({Key key}) : super(key: key);

  @override
  _FundloanScreenState createState() => _FundloanScreenState();
}

class _FundloanScreenState extends State<FundloanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('fundloan'),
      // ),
      body: Center(
        child: Text("fundloan Screen"),
      ),
    );
  }
}
