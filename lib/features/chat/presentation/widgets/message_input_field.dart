import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat_bloc.dart';
import '../bloc/chat_event.dart';

class MessageInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.greenAccent),
            onPressed: () {
              final message = messageController.text;
              if (message.isNotEmpty) {
                BlocProvider.of<ChatBloc>(context).add(SendMessage(message));
                messageController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
