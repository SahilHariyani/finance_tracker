import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  String _name;
  String _email;
  String _imageUrl;
  List _projectMember;
  List _projectAdmin;
// getters to get data
  String get name => _name;
  String get email => _email;
  String get imageUrl => _imageUrl;
  List get projectAdmin => _projectAdmin;
  List get projectMember => _projectMember;

// set data to instace variables
  void addUser(String name, String email, String imageUrl) {
    _name = name;
    _email = email;
    _imageUrl = imageUrl;
  //notifies to all consumer wigeets
    notifyListeners();
  }

  Future<void> addUserToFirestore() {

        final CollectionReference trans =
        FirebaseFirestore.instance.collection('users');
    return trans
        .doc(_email)
        .set({"userName":_name,"project_member":['gurucool'],"project_admin":['gurucool']})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
        
      }

    
}
