import 'package:baacstaff/screens/consent/consent_screen.dart';
import 'package:baacstaff/screens/dashboard/dashboard.dart';
import 'package:baacstaff/screens/drawer/cancel_account/cancel_account_screen.dart';
import 'package:baacstaff/screens/drawer/news/baac_news.dart';
import 'package:baacstaff/screens/employeedetail/employeedetail.dart';
import 'package:baacstaff/screens/lockscreen/lockscreen.dart';
import 'package:baacstaff/screens/pincode/pincode_screen.dart';
import 'package:baacstaff/screens/register/register_screen.dart';
import 'package:baacstaff/screens/setpassword/setpassword_screen.dart';
import 'package:baacstaff/screens/welcome/welcomeScreen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/welcome": (BuildContext context) => WelcomeScreen(),
  "/register": (BuildContext context) => RegisterScreen(),
  "/consent": (BuildContext context) => ConcentScreen(),
  "/pin": (BuildContext context) => PincodeScreen(),
  "/setPassword": (BuildContext context) => SetPasswordScreen(),
  "/dashboard": (BuildContext context) => DashboardScreen(),
  "/baacnews": (BuildContext context) => BaacNewsScreen(),
  "/cancelaccount": (BuildContext context) => CancelAccountScreen(),
  "/lockscreen": (BuildContext context) => LockScreen(),
  "/employee-detail": (BuildContext context) => EmployeeDetailScreen(),
};
