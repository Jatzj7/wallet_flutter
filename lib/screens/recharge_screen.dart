import 'package:flutter/material.dart';
import 'package:wallet_flutter/main_page.dart';
import 'package:wallet_flutter/screens/reacharge_card.dart';
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

  bool enableLogInButton = false;

  @override
  void initState() {
    super.initState();
    amountController.addListener(validate);
  }

  void validate() {
    if (amountController.text == '') {
      setState(() {
        enableLogInButton = false;
      });
    }  else {
      setState(() {
        enableLogInButton = true;
      });
    }
  }
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
              SizedBox(height: 20.0,),
              addMoneyCard(),
            ],
          )),
    );
  }

  Widget addMoneyCard() {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.blue,
                  size: 50.0,
                ),
              )
            ],
          ),
          addMoney(amountController, Icons.add, '\$ Amount'),
          _addAmountBtn(),
        ],
      ),
    );
  }

  Widget addMoney(
      TextEditingController textController, IconData icon, String hintText) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 80.0,
      child: TextField(
        style: addTextStyle,
        decoration: new InputDecoration(hintText: "\$ Amount",hintStyle: addHintTextStyle,suffixIcon: Icon(Icons.add),),
        keyboardType: TextInputType.number,
        controller: textController,
      ),
    );
  }

  Widget _addAmountBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0,horizontal: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed:  () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CardRecharge()),
          );
        },
        padding: EdgeInsets.all(15.0),
        color: Colors.blueAccent,
        child: Text(
          'Proceed To Add Money',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
