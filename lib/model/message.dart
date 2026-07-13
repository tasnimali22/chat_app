import 'package:chatapp/constant/Const.dart';

class Message {
  String message;
  final String id;
  Message(this.message, this.id);
  factory Message.fromJson(JsonData) {
    return Message(JsonData[Kmessage], JsonData[Kid]);
  }
}
