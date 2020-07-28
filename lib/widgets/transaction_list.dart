import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

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
                  return TransactionItem(
                      transaction: userTrans[index], delTxn: delTxn);
                },
                itemCount: userTrans.length,
                // children: userTrans.map((tr) {}).toList(),
              ));
  }
}
