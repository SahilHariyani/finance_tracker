import 'package:finance_tracker/services/sign_in_google.dart';

import 'home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: RaisedButton(
        color: Colors.greenAccent,
        
        child: Text('Sign In with Google'),
        onPressed: () {
           signInWithGoogle(context).then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  
                  return HomePage();
                },
              ),
            );
          }
        });
        },
      )),
    );
  }
}
