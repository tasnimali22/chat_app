import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  Custombutton({super.key, this.onTap, required this.title});
  String title;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(title, textAlign: TextAlign.center),
    );
  }
}
