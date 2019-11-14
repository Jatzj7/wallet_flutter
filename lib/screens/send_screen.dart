import 'package:flutter/material.dart';
import 'package:wallet_flutter/utilities/textfield.dart';

class SendScreen extends StatefulWidget {
  @override
  _SendScreenState createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final TextEditingController amountController = new TextEditingController();
  final TextEditingController uniqueIdController = new TextEditingController();
  final TextEditingController messageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          buildTF(uniqueIdController, Icons.person, 'Enter PersonId', 'Enter unique wallet Id')
        ],
      )
    );
  }
}
