import 'package:chatapp/constant/Const.dart';
import 'package:chatapp/model/message.dart';
import 'package:flutter/material.dart';

class Chat_buble extends StatelessWidget {
  const Chat_buble({super.key, required this.message});

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerLeft,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: Text(message.message, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
