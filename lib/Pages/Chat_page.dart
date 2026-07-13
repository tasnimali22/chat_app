import 'package:chatapp/Pages/cubitChat/cubit/chat_cubit.dart';
import 'package:chatapp/constant/Const.dart';
import 'package:chatapp/customWidget/customChatLeft.dart';
import 'package:chatapp/customWidget/customChat_buble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chat_Page extends StatelessWidget {
  Chat_Page({super.key});
  static String id = 'chat_page';
  final _controler = ScrollController();

  TextEditingController controler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(Images), Text("Chat")],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var message = BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                  reverse: true,
                  controller: _controler,
                  itemCount: message.length,
                  itemBuilder: (context, index) {
                    return message[index].id == email
                        ? Chat_buble(message: message[index])
                        : Chat_bubleForfrind(message: message[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controler,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(
                  context,
                ).sendMessage(message: data, email: email.toString());
                controler.clear();
                _controler.animateTo(
                  0,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              decoration: InputDecoration(
                hintText: "Send message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: primaryColor),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    BlocProvider.of<ChatCubit>(context).sendMessage(
                      message: controler.text,
                      email: email.toString(),
                    );
                    _controler.animateTo(
                      0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                    controler.clear();
                  },
                ),

                suffixIconColor: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
