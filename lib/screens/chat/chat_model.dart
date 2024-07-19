import 'package:adawat_customer_app/models/message.dart';

class ChatModel {

  String? name;
  String? imageUrl;
  Message? lastMessage;
  List<Message>? messages;

  ChatModel({this.name, this.imageUrl, this.lastMessage, this.messages});
}