import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_flutter/utilities/constants.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: CircleAvatar(
                          radius: 40.0,
                          backgroundColor: Colors.black,
                        ),
                      )),
                      _accountListTile('Manage Balance'),
                      _accountListTile('See Activity'),
                      _paySection()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paySection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'SEND AND REQUEST MONEY',
          style: dashboardActivity,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                FlatButton.icon(
                  label: Text(''),
                  onPressed: () {},
                  icon: Icon(IconData(0xe900, fontFamily: 'SendIcon'),size: 100.0,),
                  splashColor: Color(0xFFa0d6b4),
                ),
                Text(
                  'SEND MONEY',
                  style: dashboardActivity,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                FlatButton.icon(
                  label: Text(''),
                  onPressed: () {},
                  icon: Icon(IconData(0xe900, fontFamily: 'WalletIcon'),size: 100.0),
                  splashColor: Color(0xFFa0d6b4),
                ),
                Text(
                  'RECIEVE MONEY',
                  style: dashboardActivity,
                )
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget _accountListTile(String text) {
    return ListTile(
      leading: Text(text, style: dashboardActivity),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
      onTap: () {},
    );
  }
}
