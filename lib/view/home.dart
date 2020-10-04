import 'package:finance_tracker/view/add_transaction.dart';
import 'package:finance_tracker/view/drawerpage.dart';
import 'package:flutter/material.dart';
import 'drawerpage.dart';

class HomePage extends StatefulWidget {
  String title;
  String amount;
  String type;
  String description;

  HomePage({this.title,this.amount,this.type,this.description});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List transactions = ['100₹','200₹'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finance Tracker'),
      ),
      drawer: MainDrawer(),
      body: ListView.builder(

        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.title ??'00'),
            subtitle: Text(widget.type ?? 'null'),
          );
          
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[800],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTransaction()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
