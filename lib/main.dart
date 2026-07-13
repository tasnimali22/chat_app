import 'package:chatapp/Pages/Chat_page.dart';
import 'package:chatapp/Pages/cubit/loginCubit.dart';
import 'package:chatapp/Pages/cubitChat/cubit/chat_cubit.dart';
import 'package:chatapp/Pages/cubitRegester/cubit/regester_cubit.dart';
import 'package:chatapp/Pages/loginPages.dart';
import 'package:chatapp/Pages/regesterPage.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(create: (BuildContext context) => RegesterCubit()),
        BlocProvider(create: (BuildContext context) => ChatCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Login_pages.id: (context) => Login_pages(),
          Regester_pages.id: (context) => Regester_pages(),
          Chat_Page.id: (context) => Chat_Page(),
        },
        initialRoute: Login_pages.id,
      ),
    );
  }
}
