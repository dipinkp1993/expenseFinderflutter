import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTrans;
  NewTransaction(this.addTrans);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                /* onChanged: (v) {
                        titleInput = v;
                      },*/
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                // onChanged: (v) {
                // amountInput = v;
                // },
              ),
              FlatButton(
                onPressed: () {
                  addTrans(titleController.text,
                      double.parse(amountController.text));
                  /* print(titleInput);
                        print(amountInput);*/
                },
                child: Text('Add Expense'),
                textColor: Colors.green,
              )
            ],
          )),
    );
  }
}
