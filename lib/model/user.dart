import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  String _name;
  String _email;
  String _imageUrl;

// getters to get data
  String get name => _name;
  String get email => _email;
  String get imageUrl => _imageUrl;

// set data to instace variables
  void addUser(String name, String email, String imageUrl) {
    _name = name;
    _email = email;
    _imageUrl = imageUrl;
  //notifies to all consumer wigeets
    notifyListeners();
  }
}
