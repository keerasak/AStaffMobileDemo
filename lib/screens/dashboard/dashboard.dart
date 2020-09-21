import 'package:baacstaff/screens/bottomnav/benefit/benefit_screen.dart';
import 'package:baacstaff/screens/bottomnav/checkin/checkin_screen.dart';
import 'package:baacstaff/screens/bottomnav/employee/employee_screen.dart';
import 'package:baacstaff/screens/bottomnav/fundloan/fundloan_screen.dart';
import 'package:baacstaff/screens/bottomnav/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //เรียก shared
  SharedPreferences sharedPreferences;

  String fullnameAccount, empIDAccount;

  //ฟังชั่นดึงข้อมูล
  readEmployee() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      empIDAccount = sharedPreferences.getString('storeEmpID');
      fullnameAccount = sharedPreferences.getString('storePrename') +
          sharedPreferences.getString('storeFirstname') +
          " " +
          sharedPreferences.getString('storeLastname');
    });
  }

  //signout
  signOut() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('storeStep', 4);
    Navigator.pushNamed(context, '/lockscreen');
  }

//สถานะเมื่อหน้าจอโดนโหลดครั้งแรก
  @override
  void initState() {
    super.initState();
    readEmployee();
  }

  //สร้างตัวแปรแบบ list เก็บรายการหน้าของ  tab botton
  int _currentIndex = 0;
  String _title;

  final List<Widget> _children = [
    HomeScreen(),
    BenefitScreen(),
    FundloanScreen(),
    CheckinScreen(),
    EmployeeScreen()
  ];

  //เงื่อนไขสลับ tap
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _title = 'หน้าหลัก';
          break;
        case 1:
          _title = 'สวัสดิการ';
          break;
        case 2:
          _title = 'กองทุนกู้ยืมเพื่อ...';
          break;
        case 3:
          _title = 'ลงเวลาทำงาน';
          break;
        case 4:
          _title = 'ข้อมูลของฉัน';
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('$_title'),
      ),
// SideBar
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png')),
                ),
                accountName: Text(empIDAccount),
                accountEmail: Text(fullnameAccount),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg1.jpg'),
                        fit: BoxFit.fill)),
              ),
              ListTile(
                leading: Icon(Icons.new_releases),
                title: Text('ข้อมูลข่าวสาร ธกส.'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/baacnews');
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('ข้อมูลพนักงาน '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.branding_watermark),
                title: Text('สวัสดิการ'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.data_usage),
                title: Text('กองทุนกู้ยืมเพื่อสวัสดิการ'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.timelapse),
                title: Text('ลงเวลาทำงาน'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(
                color: Colors.green[200],
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('ออกจากระบบ'),
                onTap: () {
                  // เคลียร์ค่าใน sharedPreferences
                  signOut();
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text('ยกเลิกการลงทะเบียน'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cancelaccount');
                },
              ),
            ],
          ),
        ),
      ),
// Contect

// Tab Menu
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.green,
        selectedItemColor: Colors.green[900],
        unselectedItemColor: Colors.black,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('หน้าหลัก', style: TextStyle(fontSize: 16)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.enhanced_encryption),
            title: Text('สวัสดิการ', style: TextStyle(fontSize: 16)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            title: Text('กองทุน', style: TextStyle(fontSize: 16)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text('ลงเวลา', style: TextStyle(fontSize: 16)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('ฉัน', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),

      body: _children[_currentIndex],
    );
  }
}
