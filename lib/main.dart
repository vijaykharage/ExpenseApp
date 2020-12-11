import 'package:flutter/material.dart';

import './Widgets/AddExpense.dart';
import './Widgets/ListOfTransaction.dart';
import './Widgets/Chart.dart';
import './Models/Transaction.dart';

void main() => runApp(MyExpenseApp());

class MyExpenseApp extends StatefulWidget {
  @override
  _MyExpenseAppState createState() => _MyExpenseAppState();
}

class _MyExpenseAppState extends State<MyExpenseApp> {
  final List<Transaction> transactions = [];

  List<Transaction> get _recentTransactions {
    return transactions.where((txn) {
      return txn.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown,
        accentColor: Colors.blueAccent[400],
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              button: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense'),
          actions: <Widget>[
            Builder(builder: (ctx) {
              return IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _showAddExpenseWidget(ctx),
              );
            }),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Chart(_recentTransactions),
              ListOfTransaction(
                transactions,
                _deleteExpense
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddExpenseWidget(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: AddExpense(_addExpense),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _addExpense(String title, double amount, DateTime date) {
    if (title.isEmpty || amount <= 0 || date == null) {
      return;
    }

    final transaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date);

    setState(() {
      transactions.add(transaction);
    });
  }

  void _deleteExpense(String id) {
    if (id == null) {
      return;
    }

    setState(() {
      transactions.removeWhere((txn) {
      return txn.id == id;
    });
    });
  }
}
