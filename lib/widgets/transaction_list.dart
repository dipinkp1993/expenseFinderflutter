import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTrans;
  TransactionList(this.userTrans);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTrans.map((tr) {
        return Row(
          children: <Widget>[
            Container(
              child: Text('₹${tr.amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green)),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2)),
              padding: EdgeInsets.all(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tr.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
                Text(
                  DateFormat.yMMMd().format(tr.date),
                  style: TextStyle(color: Colors.blueGrey),
                )
              ],
            )
          ],
        );
      }).toList(),
    );
  }
}
