import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to ..........",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Consolas',
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/logo1.png',
              width: 120,
              height: 120,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
              // Navigator.pushReplacementNamed(context, '/register');
            },
            color: Colors.white60,
            splashColor: Colors.white60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'เริ่มต้นใช้งาน',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
