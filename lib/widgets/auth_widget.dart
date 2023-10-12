import 'package:flutter/material.dart';

var textFormDecoration = InputDecoration(
  labelText: 'Fullname',
  hintText: 'Enter Your Fullname',
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.purple,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(20),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.purple,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(20),
  ),
);

class AuthMainButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const AuthMainButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.purple,
      borderRadius: BorderRadius.circular(20),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class HaveAccount extends StatelessWidget {
  final Function() onPressed;
  final String actionLabel;
  final String haveAccount;
  const HaveAccount({
    required this.onPressed,
    required this.actionLabel,
    required this.haveAccount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          haveAccount,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              actionLabel,
              style: const TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ))
      ],
    );
  }
}

class AuthHeaderLabel extends StatelessWidget {
  final String label;
  const AuthHeaderLabel({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.home,
            size: 30,
          ),
        )
      ],
    );
  }
}
