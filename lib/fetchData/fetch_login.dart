import 'package:chatapp/Pages/Chat_page.dart';
import 'package:chatapp/constant/Const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/*Future<void> Fetch_login(BuildContext context) async {
  try {
    var authlogin = FirebaseAuth.instance;
    String? email;
    String? password;
    UserCredential user = await authlogin.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    Navigator.pushNamed(context, Chat_Page.id, arguments: email);
  } catch (e) {
    print(e);
    snackBar(context, e);
  }
}*/
