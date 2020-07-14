import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTrans;
  NewTransaction(this.addTrans);
  void submitForm() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return; //if return addTrans won't executed
    }
    addTrans(enteredTitle, enteredAmount);
  }

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
                onSubmitted: (_) => submitForm(),
                /* onChanged: (v) {
                        titleInput = v;
                      },*/
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitForm(),
                // onChanged: (v) {
                // amountInput = v;
                // },
              ),
              FlatButton(
                onPressed: submitForm,
                child: Text('Add Expense'),
                textColor: Colors.green,
              )
            ],
          )),
    );
  }
}
