import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTrans;
  final Function delTxn;
  TransactionList(this.userTrans, this.delTxn);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
        child: userTrans.isEmpty
            ? LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      "No transaction added yet",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                );
              })
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 5,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                            radius: 30,
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: FittedBox(
                                  child: Text(
                                      '₹${userTrans[index].amount.toStringAsFixed(2)}')),
                            )),
                        title: Text(
                          userTrans[index].title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        subtitle: Text(
                            DateFormat.yMMMd().format(userTrans[index].date)),
                        trailing: MediaQuery.of(context).size.width > 460
                            ? FlatButton.icon(
                                onPressed: () {
                                  delTxn(userTrans[index].id);
                                },
                                icon: Icon(Icons.delete),
                                label: Text("Delete"),
                                textColor: Theme.of(context).errorColor,
                              )
                            : IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () {
                                  delTxn(userTrans[index].id);
                                }),
                      ));
                },
                itemCount: userTrans.length,
                // children: userTrans.map((tr) {}).toList(),
              ));
  }
}
