import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat_bloc.dart';
import '../bloc/chat_state.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state is ChatLoaded) {
                // If the state is loaded, display the messages
                return ListView.builder(
                  itemCount: state.messages.length, // Use the count of messages
                  itemBuilder: (context, index) {
                    final message = state.messages[index]; // Get the message from the state
                    return Align(
                      alignment: message.isSent ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: message.isSent ? Colors.greenAccent : Colors.grey[800],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          message.text,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                );
              } else if (state is ChatLoading) {
                // Show a loading indicator if the chat is loading
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: Text("No messages")); // Handle empty state
              }
            },
          ),
        ),
      ],
    );
  }
}
