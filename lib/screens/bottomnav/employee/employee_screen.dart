import 'package:flutter/material.dart';

class EmployeeScreen extends StatefulWidget {
  EmployeeScreen({Key key}) : super(key: key);

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 250.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg3.jpg'),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  child: CircleAvatar(
                    radius: 46.0,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('กีระศักดิ์ พิทยาพละ',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                Text('รหัสพนักงาน 6300002',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                Text('พนักงานคอม 4',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('ข้อมูลพนักงาน'),
            onTap: () {
              Navigator.pushNamed(context, '/employee-detail');
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('เปลี่ยนรหัสผ่าน'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('ติดต่อทีมงาน'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('เปลี่ยนภาษา'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('ออกจากระบบ'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
