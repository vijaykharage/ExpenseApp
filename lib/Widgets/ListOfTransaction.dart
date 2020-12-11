import 'package:flutter/material.dart';

import '../Models/Transaction.dart';
import './CustomRow.dart';

class ListOfTransaction extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteHandler;

  ListOfTransaction(this.transactions, this.deleteHandler);

  @override
  _ListOfTransactionState createState() => _ListOfTransactionState();
}

class _ListOfTransactionState extends State<ListOfTransaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 650,

          /// List with without builder method
          /// (Use this only if number of items are not more than 5-10)
          ///
          // child: ListView(
          //   children: <Widget>[
          //     ...widget.transactions.map((txn) {
          //       return CustomRow(txn);
          //     }).toList()
          //   ],
          // ),
          child: widget.transactions.isEmpty
              ? EmptyWidget()

              /// builder method creates cells on demand
              /// resulting memory effenciency and performance boost
              : ListView.builder(
                  itemBuilder: (_, index) {
                    return CustomRow(
                        widget.transactions[index], widget.deleteHandler);
                  },
                  itemCount: widget.transactions.length,
                ),
        ),
      ],
    );
  }
}

class EmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'NO EXPENSES',
          style: Theme.of(context).textTheme.title
          ),
        SizedBox(height: 20),
        Container(
          height: 150,
          child: Image.asset(
            'assets/images/expense.png',
            fit: BoxFit.scaleDown,
          ),
        )
      ],
    );
  }
}
