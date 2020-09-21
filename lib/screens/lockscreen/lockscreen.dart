import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'numpad.dart';

class LockScreen extends StatefulWidget {
  LockScreen({Key key}) : super(key: key);

  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  int length = 6;

  SharedPreferences sharedPreferences;
  //signin
  signIn() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('storeStep', 3);
    Navigator.pushNamed(context, '/dashboard');
  }

  onChange(String number) {
    if (number.length == length) {
      print(number);
      //ส่งค่าเชค API
      //ส่งไปหน้า dashboard
      signIn();
    }
    // print(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Lock Screen'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child:
                        IconButton(icon: Icon(Icons.close), onPressed: () {})),
              ],
            ),
            Image.asset(
              'assets/images/logo1.png',
              width: 80,
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'กรุณาใส่รหัสผ่าน',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
            Numpad(
              length: length,
              onChange: onChange,
            )
          ],
        ),
      ),
    );
  }
}
