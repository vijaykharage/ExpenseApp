import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../Models/Transaction.dart';
import '../Widgets/ChartBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentExpenses;
  List<Map<String, Object>> get groupedExpenses {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalAmount = 0.0;

      for (var expense in recentExpenses) {
        if (expense.date.day == weekDay.day &&
            expense.date.month == weekDay.month &&
            expense.date.year == weekDay.year) {
          totalAmount += expense.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalAmount,
      };
    }).reversed.toList();
  }

  double get totalExpense {
    return groupedExpenses.fold(0.0, (sum, txn) {
      return sum + txn['amount'];
    });
  }

  Chart(this.recentExpenses);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        color: Colors.white54,
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedExpenses.map((txn) {
          return ChartBar(
            txn['day'],
            txn['amount'],
            totalExpense == 0.0
                ? 0.0
                : (txn['amount'] as double) / totalExpense,
          );
        }).toList()),
      ),
      height: 200,
    );
  }
}
