import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:wallet_flutter/screens/dashboard.dart';
import 'package:wallet_flutter/screens/dashboard_screen.dart';
import 'package:wallet_flutter/screens/profile_screen.dart';
import 'package:wallet_flutter/screens/request_screen.dart';
import 'package:wallet_flutter/screens/send_screen.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedPage = 0;
  final _pageOptions = [
    DashboardPage(),
    SendScreen(),
    RechargeScreen(),
    RequestScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedPage,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedPage = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Dashboard'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.monetization_on),
              title: Text('Recharge'),
              activeColor: Colors.purpleAccent
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.payment),
              title: Text('Pay'),
              activeColor: Colors.pink
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              activeColor: Colors.blue
          ),
        ],
      ),
      body: _pageOptions[_selectedPage],
    );
  }
}
