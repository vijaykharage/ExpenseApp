import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 20,
            child: FittedBox(
              child: Text('\$${spendingAmount.toStringAsFixed(2)}'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Stack(
              children: <Widget>[
                Container(
                  width: 10,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white10),
                ),
                FractionallySizedBox(
                  child: Container(
                    width: 10,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).accentColor),
                  ),
                  heightFactor: spendingPctOfTotal,
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          FittedBox(
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
