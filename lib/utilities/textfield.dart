import 'package:flutter/material.dart';

import 'constants.dart';

Widget buildTF(TextEditingController textController, IconData icon, String text, String hintText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        text,
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          controller: textController,
          obscureText: true,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            hintText: hintText,
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}