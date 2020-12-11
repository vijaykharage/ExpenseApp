import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  final Function addExpenseHandler;

  AddExpense(this.addExpenseHandler);

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final titleTextController = TextEditingController();
  final amountTextController = TextEditingController();
  DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    hasFloatingPlaceholder: true, labelText: 'Title'),
                // onChanged: (text) => this.titleInput = text,
                controller: titleTextController,
                onSubmitted: (_) => _addExpense(),
              ),
              TextField(
                decoration: InputDecoration(
                    hasFloatingPlaceholder: true, labelText: 'Amount'),
                keyboardType: TextInputType.number,
                // onChanged: (text) => this.amountInput = text,
                controller: amountTextController,
                onSubmitted: (_) => _addExpense(),
              ),
              Container(
                height: 60,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: _selectedDate == null
                          ? Text('No Date Selected')
                          : Text(
                              'Selected Date: ${DateFormat.yMd().format(_selectedDate)}'),
                    ),
                    FlatButton(
                      onPressed: _showDatePicker,
                      child: Text('Choose Date'),
                      textColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              RaisedButton(
                onPressed: _addExpense,
                child: Text(
                  'Add Expense',
                ),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
              ),
            ],
          ),
        ),
        elevation: 5,
      ),
    );
  }

  void _addExpense() {
    final String title = titleTextController.text;
    final double amount = double.parse(amountTextController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.addExpenseHandler(
      titleTextController.text,
      double.parse(amountTextController.text),
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 60)),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }
}
