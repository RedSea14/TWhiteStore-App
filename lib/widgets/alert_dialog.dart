import 'package:flutter/material.dart';

class MyAlertDialog {
  static void showMyDialog({
    required BuildContext context,
    required String title,
    required String content,
    required Function() tabYes,
    required Function() tabNo,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: tabYes,
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: tabNo,
            child: const Text('No'),
          ),
        ],
      ),
    );
  }
}
