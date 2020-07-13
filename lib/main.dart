import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: "Book Purchase",
      amount: 30.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Petrol Expense",
      amount: 100.00,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Graph Part'),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((tr) {
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
          )
        ],
      ),
    );
  }
}
