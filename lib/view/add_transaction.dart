import 'package:finance_tracker/view/home.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddTransaction();
  }
}

class _AddTransaction extends State<AddTransaction> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerAmount = TextEditingController();
  TextEditingController controllerDesc = TextEditingController();
  TextEditingController controllerAttachFile = TextEditingController();
  TextEditingController controllerChoose = TextEditingController();

  var _amount_type = ['Income', 'Expense'];
  var _current_amount_type_selected = 'Income';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Transaction')),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                controller: controllerTitle,
                decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 2.0))),
              )),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: controllerAmount,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Amount",
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0))),
                  ),
                ),
                Expanded(
                    child: DropdownButton<String>(
                  items: _amount_type.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: _current_amount_type_selected,
                  onChanged: (String newTypeSelected) {
                    _onDropDownTypeSelected(newTypeSelected);
                  },
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextFormField(
              controller: controllerDesc,
              decoration: InputDecoration(
                  labelText: "Description",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0))),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: ButtonTheme(
              minWidth: 300,
              height: 55,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.green[400],
                  child: Text(
                    "Add Transaction",
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  onPressed: () {
                    debugPrint(controllerTitle.text);
                    debugPrint(controllerAmount.text);
                    debugPrint(controllerDesc.text);
                    debugPrint(_current_amount_type_selected);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                              title: controllerTitle.text,
                              amount: controllerAmount.text,
                              description: controllerDesc.text,
                              type: _current_amount_type_selected
                            )));
                  }),
            ),
          )
        ],
      ),
    );
  }

  void _onDropDownTypeSelected(String newTypeSelected) {
    setState(() {
      this._current_amount_type_selected = newTypeSelected;
    });
  }
}
