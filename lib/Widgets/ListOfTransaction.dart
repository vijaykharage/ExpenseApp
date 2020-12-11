import 'package:flutter/material.dart';

import '../Models/Transaction.dart';
import './CustomRow.dart';
import './NoExpense.dart';

class ListOfTransaction extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteHandler;

  ListOfTransaction(this.transactions, this.deleteHandler);

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
          child: transactions.isEmpty
              ? NoExpenseWidget()

              /// builder method creates cells on demand
              /// resulting memory effenciency and performance boost
              : ListView.builder(
                  itemBuilder: (_, index) {
                    return CustomRow(transactions[index], deleteHandler);
                  },
                  itemCount: transactions.length,
                ),
        ),
      ],
    );
  }
}
