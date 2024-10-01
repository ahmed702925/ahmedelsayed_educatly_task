import 'package:flutter/material.dart';

import '../widgets/chat_list.dart';
import '../widgets/message_input_field.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Column(
        children: [
          Expanded(child: ChatList()),
          MessageInputField(),
        ],
      ),
    );
  }
}
