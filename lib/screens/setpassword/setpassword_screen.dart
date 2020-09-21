import 'package:baacstaff/utils/Passwordwidget.dart';
import 'package:baacstaff/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/error_codes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetPasswordScreen extends StatefulWidget {
  SetPasswordScreen({Key key}) : super(key: key);

  @override
  _SetPasswordScreenState createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  // สร้างตัวแปรสำหรับผูกกับฟอร์ม
  final formKey = GlobalKey<FormState>();

  // สร้างตัวแปรไว้รับค่าจากฟอร์ม
  String passwordText, passwordConfirmText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("กำหนดรหัสผ่านเพื่อใช้งาน")),
      ),
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 50),
                    child: TextFormField(
                      autofocus: false,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 24, color: Colors.teal),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          size: 28,
                        ),
                        labelText: 'กำหนดรหัสผ่านเพื่อเข้าใช้งาน',
                        errorStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'กรอกรหัสผ่านก่อน';
                        } else if (value.length != 6) {
                          return 'กรุณาป้อนรหัสผ่านด้วยเลข 6 หลัก';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        passwordText = value.trim();
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: TextFormField(
                      autofocus: false,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 24, color: Colors.teal),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          size: 28,
                        ),
                        labelText: 'กำหนดรหัสผ่านเพื่อเข้าใช้งานอีกครั้ง',
                        errorStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'กรอกรหัสผ่านก่อน';
                        } else if (value.length != 6) {
                          return 'กรุณาป้อนรหัสผ่านด้วยเลข 6 หลัก';
                        } else if (passwordConfirmText != passwordText) {
                          Utility.getInstance().showAlertDialog(
                              context,
                              'มีข้อผิดพลาด',
                              'ยืนยันรหัสทั้ง 2 ช่องไม่ตรงกัน ลองใหม่');
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        passwordConfirmText = value.trim();
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: RaisedButton(
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          if (passwordText != passwordConfirmText) {
                            Utility.getInstance().showAlertDialog(
                                context,
                                "มีข้อผิดพลาด",
                                'รหัสผ่านไม่ตรงกัน กรุณาลองใหม่');
                          } else {
                            //Call API
                            _setPasswordSubmit(context);
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'บันทึกข้อมูล',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  void _setPasswordSubmit(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('storestep', 3);
    Navigator.pushNamed(context, '/dashboard');
  }
}
