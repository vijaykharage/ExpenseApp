import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Transaction.dart';

class CustomRow extends StatelessWidget {
  final Transaction txn;
  final Function deletehandler;

  CustomRow(this.txn, this.deletehandler);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        // Card(
        //   child: Row(
        //     children: <Widget>[
        //       // Padding(
        //       //   child: Text('Test this widget'),
        //       //   padding: const EdgeInsets.all(10),
        //       // ),
        //       Container(
        //         child: Text(
        //           '\$ ${txn.amount.toStringAsFixed(2)}',
        //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        //         ),
        //         decoration: BoxDecoration(
        //           border: Border.all(
        //               color: Theme.of(context).primaryColor,
        //               style: BorderStyle.solid,
        //               width: 2),
        //         ),
        //         padding: EdgeInsets.all(5),
        //       ),
        //       Container(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: <Widget>[
        //             Text(
        //               txn.title,
        //               style:
        //                   Theme.of(context).textTheme.title
        //             ),
        //             Text(
        //               DateFormat.yMMMd().format(txn.date),
        //               style: TextStyle(color: Colors.grey, fontSize: 12),
        //             )
        //           ],
        //         ),
        //         padding: EdgeInsets.all(10),
        //       )
        //     ],
        //   ),
        // ),
        Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: FittedBox(
                  child: Text('\$ ${txn.amount.toStringAsFixed(2)}'),
                ),
              ),
            ),
            title: Text(txn.title, style: Theme.of(context).textTheme.title),
            subtitle: Text(
              DateFormat.yMMMd().format(txn.date),
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            trailing: IconButton(
                icon: Icon(Icons.delete, color: Theme.of(context).errorColor,),
                onPressed: () => deletehandler(txn.id)),
          ),
        )
      ],
    ));
  }
}
