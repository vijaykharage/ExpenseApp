import 'package:flutter/material.dart';

class NoExpenseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('NO EXPENSES :(', style: Theme.of(context).textTheme.title),
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

