import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_flutter/utilities/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  mainDetails(),
                  Divider(),
                  mainAccount(),
                  Divider(),
                  privacy(),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget privacy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'PRIVACY AND SECURITY',
            style: headStyleBlack,
          ),
        ),
        _accountListTile(Icons.fingerprint, 'Privacy', 'Sharing and Visibility'),
        _accountListTile(Icons.notifications, 'Notifications', 'Turn notifications on/off'),
        _accountListTile(Icons.lock, 'Security', 'Screen lock'),
        _accountListTile(Icons.exit_to_app, 'Log out', 'Log out from Wallet'),
        _accountListTile(Icons.power_settings_new, 'Close account', 'Clear wallet account'),
      ],
    );
  }

  Widget mainAccount() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'ACCOUNT',
              style: headStyleBlack,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5.0),
            child: Text(
              'Signed in as : jk.j@gmail.com',
              style: subheadStyleGrey,
            ),
          ),
          _accountListTile(Icons.call, 'Mobile Number', '+91 7984787878'),
          _accountListTile(
              Icons.account_balance, 'Payment Methods', 'Indusland Bank: 0091'),
        ],
      ),
    );
  }

  Widget _accountListTile(IconData icon, String text, String subText) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
      ),
      title: Text(text),
      subtitle: Text(
        subText,
        style: subheadStyleGrey,
      ),
      onTap: () {},
    );
  }

  Widget mainDetails() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              top: 20.0, left: 30.0, right: 30.0, bottom: 20.0),
          child: CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.black,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Jatin Kumar Jain',
              style: dashboardBalanceActivity,
            ),
            Text(
              '+91 7984787878',
              style: dashboardAvailableActivity,
            ),
            Text(
              'UPI id: jatzj0098',
              style: dashboardAvailableActivity,
            ),
          ],
        )
      ],
    );
  }
}
