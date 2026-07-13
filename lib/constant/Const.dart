import 'package:flutter/material.dart';

const primaryColor = Color(0xff2B475E);
const FriendsColor = Color(0xff006D84);
const KcreateAt = "createAt";
const Kmessage = "message";
const Kid = "id";
const Images = ("assets/images/scholar.png");

void snackBar(BuildContext context, Object e) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(e.toString())));
}
