import 'package:flutter/material.dart';

class MessengerHandle {
  static void showSnackbar(var scaffoldKey, String text) {
    scaffoldKey.currentState!.hideCurrentSnackBar();
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1000),
        backgroundColor: Colors.blueAccent,
        content: Container(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
    );
  }
}
