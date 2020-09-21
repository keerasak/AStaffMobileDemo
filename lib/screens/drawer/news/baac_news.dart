import 'package:flutter/material.dart';

class BaacNewsScreen extends StatefulWidget {
  BaacNewsScreen({Key key}) : super(key: key);

  @override
  _BaacNewsScreenState createState() => _BaacNewsScreenState();
}

class _BaacNewsScreenState extends State<BaacNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('baac news'),
      ),
      body: Center(
        child: Text("content news"),
      ),
    );
  }
}
