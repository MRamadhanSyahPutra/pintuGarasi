import 'package:flutter/material.dart';

class Info {
  static void snackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Color.fromRGBO(67, 107, 105, 1),
        content: Text(
          message,
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 245, 1),
          ),
        ),
        duration: Duration(milliseconds: 1700),
      ),
    );
  }
}
