import 'home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
      color: Colors.greenAccent,
      child: Text('Sign In with Google'),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      },
    ));
  }
}
