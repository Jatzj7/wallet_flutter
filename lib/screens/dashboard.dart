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
      backgroundColor: Color(0xFF398AE5),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
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
                  _paySection(),
                  _moreSection()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _moreSection() {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white54.withOpacity(0.7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'More',
            style: dashboardMoreActivity,
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        splashColor: Colors.teal.shade100, // inkwell color
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Icon(
                            Icons.restaurant,
                            size: 40.0,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Order Ahead',
                    style: dashboardMoreActivity,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        splashColor: Colors.teal.shade100, // inkwell color
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Icon(
                            Icons.flight,
                            size: 40.0,
                            color: Colors.indigoAccent.shade700,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Flight Tickets',
                    style: dashboardMoreActivity,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        splashColor: Colors.teal.shade100, // inkwell color
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Icon(
                            Icons.train,
                            size: 40.0,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Train Tickets',
                    style: dashboardMoreActivity,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _paySection() {
    return Container(
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.teal[600],
            Colors.teal[500],
            Colors.teal[400],
            Colors.teal[300],
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'SEND AND REQUEST MONEY',
            style: dashboardActivity,
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: Colors.teal, // button color
                      child: InkWell(
                        splashColor: Colors.teal.shade100, // inkwell color
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Icon(
                            IconData(0xe900, fontFamily: 'SendIcon'),
                            size: 60.0,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'SEND MONEY',
                    style: dashboardActivity,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: Colors.teal, // button color
                      child: InkWell(
                        splashColor: Colors.teal.shade100, // inkwell color
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Icon(
                              IconData(0xe900, fontFamily: 'WalletIcon'),
                              size: 60.0,
                              color: Colors.white),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'RECIEVE MONEY',
                    style: dashboardActivity,
                  )
                ],
              ),
            ],
          )
        ],
      ),
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
