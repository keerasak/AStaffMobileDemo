import 'package:baacstaff/models/RegisterModel.dart';
import 'package:baacstaff/services/rest_api.dart';
import 'package:baacstaff/utils/utils.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class EmployeeDetailScreen extends StatefulWidget {
  EmployeeDetailScreen({Key key}) : super(key: key);

  @override
  _EmployeeDetailScreenState createState() => _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends State<EmployeeDetailScreen> {
  //เรียกใช้ models
  RegisterModel _dataEmployee;

  @override
  void initState() {
    super.initState();
    readEmployee();
  }

//call api
  void readEmployee() async {
    //check conect internet
    var result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.none) {
      Utility.getInstance().showAlertDialog(
          context, 'ออฟไลน์', 'คุณยังไม่ได้เชื่อมต่ออินเตอร์เนต');
      print("ไม่มีการเชื่อมต่อ");
    } else {
      var empData = {"empid": "5601965", "cizid": "7127225663620"};
      var response = await CallAPI().getEmployee(empData);
      print(response.data.firstname);
      setState(() {
        _dataEmployee = response;
      });
    }
  }

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
          // subtitle: Text('${_dataEmployee.data.firstname}'),
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
