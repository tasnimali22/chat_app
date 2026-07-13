import 'package:chatapp/Pages/Chat_page.dart';
import 'package:chatapp/Pages/cubit/loginCubit.dart';
import 'package:chatapp/Pages/cubit/loginStateCubit.dart';
import 'package:chatapp/Pages/cubitRegester/cubit/regester_cubit.dart';
import 'package:chatapp/Pages/loginPages.dart';
import 'package:chatapp/constant/Const.dart';
import 'package:chatapp/customWidget/CustomTextFiled.dart';
import 'package:chatapp/customWidget/customButton.dart';
import 'package:chatapp/fetchData/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Regester_pages extends StatelessWidget {
  Regester_pages({super.key});
  static String id = 'Regester_pages';
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: formKey,
          child: BlocConsumer<RegesterCubit, RegesterState>(
            listener: (context, state) {
              if (state is RegesterLoadingState) {
                isLoading = true;
              } else if (state is RegesterSuccessState) {
                Navigator.pushNamed(context, Chat_Page.id, arguments: email);
              } else if (state is RegesterFailureState) {
                snackBar(context, state.errorMassage);
                isLoading = false;
              }
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
                        Text("REGESTER", style: TextStyle(color: Colors.white)),
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
                        if (formKey.currentState!.validate()) {
                          await BlocProvider.of<RegesterCubit>(
                            context,
                          ).fetch_regester(email: email!, password: password!);
                        }
                      },
                      title: 'REGESTER',
                    ),
                    Row(
                      children: [
                        Text(
                          "already have an account? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Login_pages.id,
                              arguments: email,
                            );
                          },
                          child: Text(
                            "Login",
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
