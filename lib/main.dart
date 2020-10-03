import 'package:finance_tracker/services/firebase_init.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import './view/add_transaction.dart';
=======
import 'view/login.dart';
>>>>>>> 7190415e2c3d98d3eb18e0f9868aff45a0f24431

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      theme: ThemeData(primaryColor: Colors.green[800]),
      home: AddTransaction(),
=======
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green[800]),
      home: LoginPage(),
>>>>>>> 7190415e2c3d98d3eb18e0f9868aff45a0f24431
    );
  }
}
