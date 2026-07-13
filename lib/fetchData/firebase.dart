import 'package:chatapp/Pages/Chat_page.dart';
import 'package:chatapp/constant/Const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> FetchRegister(
  String? email,
  String? password,
  BuildContext context,
) async {
  try {
    var authRegester = FirebaseAuth.instance;
    UserCredential user = await authRegester.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    Navigator.pushNamed(context, Chat_Page.id, arguments: email);
  } catch (e) {
    print(e);
    snackBar(context, e);
    // TODO
  }
}
