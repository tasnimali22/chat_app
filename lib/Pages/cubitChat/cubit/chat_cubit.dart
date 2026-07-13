import 'package:bloc/bloc.dart';
import 'package:chatapp/constant/Const.dart';
import 'package:chatapp/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  List<Message> messagesList = [];
  CollectionReference messages = FirebaseFirestore.instance.collection(
    'message',
  );
  void sendMessage({required String message, required String email}) {
    try {
      messages.add({Kmessage: message, Kid: email, KcreateAt: DateTime.now()});
    } on Exception catch (e) {
      // TODO
    }
  }

  void getMessage() {
    messages.orderBy(KcreateAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccessState(messages: List.from(messagesList)));
    });
  }
}
