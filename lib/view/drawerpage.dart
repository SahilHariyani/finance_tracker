import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_tracker/model/user.dart';
import 'package:finance_tracker/services/sign_in_google.dart';
import 'package:finance_tracker/view/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<UserModel>(context, listen: false).name;
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).primaryColor,
          child: Center(child: Consumer<UserModel>(
            builder: (context, value, child) {
              return Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(value.imageUrl),
                            fit: BoxFit.fill)),
                  ),
                  Text(
                    value.name,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    value.email,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              );
            },
          )),
        ),

         Flexible(
           child: StreamBuilder<QuerySnapshot>(
                  stream: users.where('userName', isEqualTo: userName).snapshots(),
                  builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
            return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData == null) {
            print('test');
            return Center(child: Text('No data yet'));
        }

        return new ListView(
            children:
            snapshot.data.docs.map((DocumentSnapshot document) {
              // print(document.data()['userImage']);

              return new ListTile(
            title: new Text(document.data()['project_admin'][0]),
            // subtitle: new Text(document.data()['title']),
              );
            }).toList(),
        );
                  }),
         ),
        ListTile(
          title: Text('Add Project'),
          trailing: Icon(Icons.add),
        ),
        ListTile(
          title: Text('Logout'),
          trailing: Icon(Icons.logout),
          onTap: () async {
            await signOutGoogle();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              ),
            );
          },
        )

      ],
    ));
  }
}
