import 'package:flutter/material.dart';
import 'package:wallet_flutter/utilities/add_money.dart';
import 'package:wallet_flutter/utilities/constants.dart';
import 'package:wallet_flutter/utilities/textfield.dart';

class RechargeScreen extends StatefulWidget {
  @override
  _RechargeScreenState createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  final TextEditingController amountController = new TextEditingController();
  final TextEditingController uniqueIdController = new TextEditingController();
  final TextEditingController messageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Recharge'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            addMoneyCard(),
          ],
        )
      ),
    );
  }
}
