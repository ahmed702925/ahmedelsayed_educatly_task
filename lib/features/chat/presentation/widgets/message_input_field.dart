import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/message_entity.dart';
import '../bloc/chat_bloc.dart';
import '../bloc/chat_event.dart';

class MessageInputField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

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
                if (value.isNotEmpty) {
                  // Create a new message entity
                  final message = MessageEntity(text: value, isSent: true);
                  // Dispatch the SendMessageEvent
                  BlocProvider.of<ChatBloc>(context).add(SendMessageEvent(message));
                  _controller.clear(); // Clear the input field
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                final message = MessageEntity(text: _controller.text, isSent: true);
                BlocProvider.of<ChatBloc>(context).add(SendMessageEvent(message));
                _controller.clear(); // Clear the input field
              }
            },
          ),
        ],
      ),
    );
  }
}
