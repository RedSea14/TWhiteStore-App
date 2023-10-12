import 'package:flutter/material.dart';

class RepeatedListTile extends StatelessWidget {
  final String title;
  final String subTilte;
  final IconData icon;
  final Function() onPressed;
  const RepeatedListTile({
    required this.title,
    required this.subTilte,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTilte),
        leading: Icon(
          icon,
          size: 20,
        ),
      ),
    );
  }
}
