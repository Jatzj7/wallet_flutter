import 'package:flutter/material.dart';

import 'constants.dart';

Widget addMoneyCard(){
  return Card(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Add Money to'),
        SizedBox(height: 5.0),
        Text(
          'Wallet',
          style: dashboardBalanceActivity,
        ),
        SizedBox(height: 10.0),
        Text(
          'Available Balance: \$10.0',
          style: dashboardAvailableActivity,
        ),

      ],
    ),
  );
}