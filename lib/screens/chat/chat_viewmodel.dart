import 'package:adawat_customer_app/models/message.dart';
import 'package:adawat_customer_app/screens/chat/chat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatViewModel extends GetxController {

  ScrollController scrollController = ScrollController();

  Rx<ChatModel> chat = ChatModel(
      name: 'Wajeeh',
      lastMessage: Message(
          messageTime: DateTime.now(),
          message: 'Hello',
          isMine: false
      ),
    messages: [
      Message(
          messageTime: DateTime.now().subtract(const Duration(days: 2)),
          message: 'Hello',
          isMine: false
      ),
      Message(
          messageTime: DateTime.now().subtract(const Duration(days: 1)),
          message: 'Hello',
          isMine: false
      ),
      Message(
          messageTime: DateTime.now().subtract(const Duration(hours: 2)),
          message: 'Hello',
          isMine: true
      ),
      Message(
          messageTime: DateTime.now().subtract(const Duration(days: 1)),
          message: 'Hello',
          isMine: false
      ),
      Message(
          messageTime: DateTime.now().subtract(const Duration(minutes: 2)),
          message: 'Hello, Demo repeat test message checking',
          isMine: true
      ),
      Message(
          messageTime: DateTime.now(),
          message: 'Hello',
          isMine: false
      ),
    ]
  ).obs;

  @override
  void onReady() {
    if(scrollController.hasClients) {
      scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }
    super.onReady();
  }
}