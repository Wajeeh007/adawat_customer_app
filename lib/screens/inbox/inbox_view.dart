import 'package:adawat_customer_app/custom_widgets/custom_textfield.dart';
import 'package:adawat_customer_app/screens/chat/chat_model.dart';
import 'package:adawat_customer_app/screens/inbox/inbox_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../helpers/constants.dart';

final InboxViewModel viewModel = Get.put<InboxViewModel>(InboxViewModel());

class InboxView extends StatelessWidget {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          CustomTextField(
            controller: viewModel.searchController,
            hintText: 'Search your chat',
          ),
          Obx(() => ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: viewModel.visibleChats.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Chat(chat: viewModel.visibleChats[index]);
              }
          ),
          )
        ],
      ),
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({super.key, required this.chat});

  final ChatModel chat;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, right: 7),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: chat.imageUrl == null ? Image.asset(
                  'assets/icons/person_circle.png',
                color: Theme.of(context).colorScheme.secondary,
                fit: BoxFit.fitHeight,
                height: 50,
                width: 50,
              ) : Image.network(chat.imageUrl!),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      chat.name!,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      DateFormat('hh:mm a').format(chat.lastMessage!.messageTime!),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: darkThemeLightGrey
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        chat.lastMessage!.message!,
                        style: Theme.of(context).textTheme.labelMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    chat.lastMessage!.isRead! ? const SizedBox() : CircleAvatar(
                      backgroundColor: Get.isDarkMode ? primaryDullYellow : primaryYellow,
                      radius: 5,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}