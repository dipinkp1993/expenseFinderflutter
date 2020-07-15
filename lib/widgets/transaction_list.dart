import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTrans;
  TransactionList(this.userTrans);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: userTrans.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    "No transaction added yet",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
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
                      ));
                  /* return Card(
                      child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                            '₹${userTrans[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor)),
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            userTrans[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat.yMMMd().format(userTrans[index].date),
                            style: TextStyle(color: Colors.blueGrey),
                          )
                        ],
                      )
                    ],
                  )
                  );*/
                },
                itemCount: userTrans.length,
                // children: userTrans.map((tr) {}).toList(),
              ));
  }
}
