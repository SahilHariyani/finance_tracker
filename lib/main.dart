import 'package:finance_tracker/services/firebase_init.dart';
import 'package:flutter/material.dart';
import './view/add_transaction.dart';
import 'view/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green[800]),

      home: FirebaseInit(),
    );
  }
}
