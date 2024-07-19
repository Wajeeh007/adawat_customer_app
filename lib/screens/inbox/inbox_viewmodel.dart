import 'package:adawat_customer_app/models/message.dart';
import 'package:adawat_customer_app/screens/chat/chat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InboxViewModel extends GetxController {

  TextEditingController searchController = TextEditingController();

  List<ChatModel> allChats = <ChatModel>[
    ChatModel(name: 'Ahsan', lastMessage: Message(message: 'Hi', messageTime: DateTime.now(), isRead: false)),
    ChatModel(name: 'Syed Ahsan', lastMessage: Message(message: 'Hi. This is your service Man', messageTime: DateTime.now(), isRead: false)),
    ChatModel(name: 'Wajeeh Ahsan', lastMessage: Message(message: 'Hi. Also Your service man', messageTime: DateTime.now(), isRead: true)),
    ChatModel(name: 'Umair', lastMessage: Message(message: 'Hi', messageTime: DateTime.now(), isRead: true)),
    ChatModel(name: 'Fahad', lastMessage: Message(message: 'Hi', messageTime: DateTime.now(), isRead: true)),
    ChatModel(name: 'Ahmad Khan', lastMessage: Message(message: 'Hi', messageTime: DateTime.now(), isRead: true)),
  ];
  RxList<ChatModel> visibleChats = <ChatModel>[
    ChatModel(name: 'Ahsan', lastMessage: Message(message: 'Hi', messageTime: DateTime.now(), isRead: false)),
    ChatModel(name: 'Syed Ahsan', lastMessage: Message(message: 'Hi. This is your service Man', messageTime: DateTime.now().subtract(const Duration(minutes: 2)), isRead: false)),
    ChatModel(name: 'Wajeeh Ahsan', lastMessage: Message(message: 'Hi. Also Your service man', messageTime: DateTime.now().subtract(const Duration(minutes: 20)), isRead: true)),
    ChatModel(name: 'Umair', lastMessage: Message(message: 'Hi', messageTime: DateTime.now().subtract(const Duration(days: 2)), isRead: true)),
    ChatModel(name: 'Fahad', lastMessage: Message(message: 'Hi', messageTime: DateTime.now().subtract(const Duration(days: 5)), isRead: true)),
    ChatModel(name: 'Ahmad Khan', lastMessage: Message(message: 'Hi', messageTime: DateTime.now().subtract(const Duration(days: 5)), isRead: true)),
  ].obs;

}