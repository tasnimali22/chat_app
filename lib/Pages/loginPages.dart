import 'package:chatapp/Pages/Chat_page.dart';
import 'package:chatapp/Pages/cubit/loginCubit.dart';
import 'package:chatapp/Pages/cubit/loginStateCubit.dart';
import 'package:chatapp/Pages/cubitChat/cubit/chat_cubit.dart';
import 'package:chatapp/Pages/regesterPage.dart';
import 'package:chatapp/constant/Const.dart';
import 'package:chatapp/customWidget/CustomTextFiled.dart';
import 'package:chatapp/customWidget/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login_pages extends StatelessWidget {
  Login_pages({super.key});
  static String id = 'login page';
  bool isLoading = false;
  String? email;
  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: formKey,
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoadingState) {
                isLoading = true;
              } else if (state is LoginSuccessState) {
                BlocProvider.of<ChatCubit>(context).getMessage();
                Navigator.pushNamed(context, Chat_Page.id, arguments: email);
              } else if (state is LoginFailureState) {
                snackBar(context, state.errorMassage);
                isLoading = false;
              }
              // TODO: implement listener
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: isLoading,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 70),
                      child: Container(height: 100, child: Image.asset(Images)),
                    ),
                    Center(
                      child: Text(
                        "Scholer chat",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text("SIGNIN", style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                    SizedBox(height: 10),
                    CustomTextFiled(
                      onchanged: (data) {
                        email = data;
                      },
                      hintText: 'Email',
                    ),
                    SizedBox(height: 10),
                    CustomTextFiled(
                      obscure: true,
                      onchanged: (data) {
                        password = data;
                      },
                      hintText: 'Password',
                    ),
                    SizedBox(height: 10),
                    Custombutton(
                      onTap: () async {
                        Navigator.pushNamed(
                          context,
                          Chat_Page.id,
                          arguments: email,
                        );
                        if (formKey.currentState!.validate()) {
                          await BlocProvider.of<LoginCubit>(
                            context,
                          ).fetch_login(email: email!, password: password!);
                          Navigator.pushNamed(
                            context,
                            Chat_Page.id,
                            arguments: email,
                          );
                        }
                      },

                      title: 'LOGIN',
                    ),
                    Row(
                      children: [
                        Text(
                          "don't have an account? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Regester_pages.id,
                              arguments: email,
                            );
                          },
                          child: Text(
                            "Regester",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
