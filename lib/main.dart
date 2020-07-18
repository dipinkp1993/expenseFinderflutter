import './widgets/chart.dart';
import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';

void main() => runApp(MyApp());

//AnimatedList
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Finder',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.indigo,
        fontFamily: "Quicksand",
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ))),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    /* Transaction(
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
    )*/
  ];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((txn) {
      return txn.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList(); //getting dates after 7 days before current date
  }

  void _addNewTransaction(String txtitle, double txamount, DateTime chseDt) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: chseDt);
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  /*String titleInput;
  String amountInput;*/
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTxns(String tid) {
    setState(() {
      _userTransactions.removeWhere((txn) => txn.id == tid);
    });
  }

  @override
  Widget build(BuildContext context) {
    //final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final appBar = AppBar(
      title: Text('Expense Finder', style: TextStyle(fontFamily: 'OpenSans')),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context))
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.4,
              child: Chart(_recentTransactions),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.6,
              child: TransactionList(_userTransactions, _deleteTxns),
            ),
            /* Transform(
              transform: Matrix4.skewX(0.1),
              child: TransactionList(_userTransactions),
            )*/
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
