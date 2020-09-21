import 'dart:convert';
import 'package:baacstaff/utils/utils.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:baacstaff/services/rest_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // create var for Form
  final formKey = GlobalKey<FormState>();
  // create var for recieve data
  String empID, cizID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                //จากที่โหลดใช้ image: AssetImage(Path),
                image: NetworkImage(
                    'https://i.pinimg.com/originals/b6/d0/64/b6d0641b836797eea79669006b2885da.jpg'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 100),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo1.png'),
                      width: 150,
                      height: 150,
                    ),
                    // Text(
                    //   'Register',
                    //   style: TextStyle(fontSize: 30),
                    // )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    color: Colors.white54,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        children: [
                          TextFormField(
                            maxLength: 7,
                            initialValue: '5601965',
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please enter รหัสพนักงาน";
                              } else if (value.length != 7) {
                                return ("กรุณากรอกรหัสพนักงาน 7 หลัก");
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              empID = value.trim();
                            },
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                size: 20,
                              ),
                              labelText: 'รหัสพนักงาน',
                              hintText: 'รหัสพนักงาน',
                            ),
                          ),
                          TextFormField(
                            maxLength: 13,
                            initialValue: '7127225663620',
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please enter National ID";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              cizID = value.trim();
                            },
                            autofocus: false,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.portrait,
                                size: 20,
                              ),
                              labelText: 'National ID',
                              hintText: '13 digits only',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      var data = {"empid": empID, "cizid": cizID};
                      _register(data);
                    }
                    //Navigator.pushNamed(context, '/consent');
                  },
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Text(
                      'ลงทะเบียน',
                      style: TextStyle(fontSize: 24, color: Colors.white70),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // function check api
  void _register(data) async {
    //check conect internet
    var result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.none) {
      Utility.getInstance().showAlertDialog(
          context, 'ออฟไลน์', 'คุณยังไม่ได้เชื่อมต่ออินเตอร์เนต');
      print("ไม่มีการเชื่อมต่อ");
    } else {
      var response = await CallAPI().postData(data, "/register");
      var body = json.decode(response.body);
      print(body);
      // print(body['code']);
      // print(body['data']['empid']);
      if (body['code'] == '200') {
        //ส่งไปหน้า consent
        //สร้างตัวแปรประะเภท sharePrefference เก็บข้อมูลในแอพ
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        //keep date
        sharedPreferences.setString('storeEmpID', body['data']['empid']);
        sharedPreferences.setString('storePrename', body['data']['prename']);
        sharedPreferences.setString(
            'storeFirstname', body['data']['firstname']);
        sharedPreferences.setString('storeLastname', body['data']['lastname']);
        sharedPreferences.setInt('storeStep', 1);
        Navigator.pushNamed(context, '/consent');
      } else {
        Utility.getInstance().showAlertDialog(context, 'มีข้อผิดพลาด',
            'ข้อมูลที่ใช้ลงทะเบียนไม่ถูกต้อง กรุณาลองอีกครั้ง');
      }
    }
  }
}
