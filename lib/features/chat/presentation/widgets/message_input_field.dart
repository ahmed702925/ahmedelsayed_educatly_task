import 'package:ahmedelsayed_educatly_task/features/chat/domain/message_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat_bloc.dart';
import '../bloc/chat_event.dart';

class MessageInputField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  MessageInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onSubmitted: (value) {
                _sendMessage(value, context);
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _sendMessage(_controller.text, context);
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(String messageText, BuildContext context) {
    if (messageText.isNotEmpty) {
      // Create a new message entity
      final message = MessageEntity(
        id: '', // Leave blank for Firestore to generate an ID
        senderId: BlocProvider.of<ChatBloc>(context).currentUserId, // Get the current user ID
        content: messageText,
        sentTime: DateTime.now(),
      );

      // Dispatch the SendMessageEvent with the new message
      BlocProvider.of<ChatBloc>(context).add(SendMessageEvent(message));

      _controller.clear(); // Clear the input field
    }
  }
}
