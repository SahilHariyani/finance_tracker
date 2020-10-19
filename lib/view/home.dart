import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_tracker/model/user.dart';
import 'package:finance_tracker/view/add_transaction.dart';
import 'package:finance_tracker/view/drawerpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'drawerpage.dart';

class HomePage extends StatefulWidget {
  String title;
  String amount;
  String type;
  String description;

  HomePage({this.title, this.amount, this.type, this.description});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference users = FirebaseFirestore.instance.collection('projects');
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Finance Tracker'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.attach_money),
                text: 'income',
              ),
              Tab(icon: Icon(Icons.attach_money), text: 'expense'),
            ],
          ),
        ),
        drawer: MainDrawer(),
        body: TabBarView(
          children: [
            TransactionType(
              users: users,
              transactionType: 'Income',
            ),
            TransactionType(users: users, transactionType: 'Expense')
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[800],
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddTransaction()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class TransactionType extends StatefulWidget {
  const TransactionType({
    Key key,
    @required this.users,
    @required this.transactionType,
  }) : super(key: key);

  final CollectionReference users;
  final String transactionType;

  @override
  _TransactionTypeState createState() => _TransactionTypeState();
}

class _TransactionTypeState extends State<TransactionType> {
  int totalIncome;
  int totalExpense;
  var userName;
  var userEmail;
  @override
  void initState() {
    // TODO: implement initState
    totalExpense = 0;
    totalIncome = 0;
    userName = Provider.of<UserModel>(context, listen: false).name;
    userEmail = Provider.of<UserModel>(context, listen: false).email;
    
        super.initState();
      }
    
      @override
      Widget build(BuildContext context) {
        return Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                      widget.transactionType == "Income"
                          ? Colors.blue[100]
                          : Colors.red[100],
                      widget.transactionType == "Income"
                          ? Colors.blue[900]
                          : Colors.red[900]
                    ])),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Text(
                          widget.transactionType,
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        Text(
                          "₹10",
                          // widget.transactionType == "Income" ? totalIncome.toString() : totalExpense.toString(),
                          style: TextStyle(
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: StreamBuilder<QuerySnapshot>(
                stream: widget.users
                    .doc('gurucool')
                    .collection('transactions')
                    .where('type', isEqualTo: widget.transactionType)
                    .snapshots(),
                builder:
                    (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                    children: snapshot.data.docs.map((DocumentSnapshot document) {
                      // print(document.data()['userImage']);
    
                      return new ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(document.data()['userImage']),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "₹" + document.data()['amount'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: new Text(document.data()['userName']),
                        subtitle: new Text(document.data()['title']),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        );
      }
    
      
}
