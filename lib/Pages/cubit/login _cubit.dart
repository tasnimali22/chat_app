import 'package:chatapp/Pages/Chat_page.dart';
import 'package:chatapp/Pages/cubit/loginStateCubit.dart';
import 'package:chatapp/constant/Const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> fetch_login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      var authlogin = FirebaseAuth.instance;

      UserCredential user = await authlogin.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e == "weak-password") {
        emit(LoginFailureState(errorMassage: 'weak-password'));
      }
      if (e == "email-already-in-use") {
        emit(LoginFailureState(errorMassage: 'email-already-in-use'));
      }
    } catch (e) {
      emit(
        LoginFailureState(errorMassage: "there was an error please try again"),
      );
    }
  }
}
