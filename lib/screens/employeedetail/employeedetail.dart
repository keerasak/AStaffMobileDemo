import 'package:flutter/material.dart';

class EmployeeDetailScreen extends StatefulWidget {
  EmployeeDetailScreen({Key key}) : super(key: key);

  @override
  _EmployeeDetailScreenState createState() => _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends State<EmployeeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลพนักงาน'),
      ),
      body: ListView(children: [
        ListTile(
          leading: Icon(Icons.person),
          title: Text('ชื่อ-สกุล'),
          subtitle: Text('กีระศักดิ์ พิทยาพละ'),
        ),
        ListTile(
          leading: Icon(Icons.credit_card),
          title: Text('รหัสพนักงาน'),
          subtitle: Text('6300002'),
        ),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text('เงินเดือน'),
          subtitle: Text('5555555'),
        ),
        ListTile(
          leading: Icon(Icons.mobile_screen_share),
          title: Text('เบอร์โทร'),
          subtitle: Text('0988876877'),
        )
      ]),
    );
  }
}
