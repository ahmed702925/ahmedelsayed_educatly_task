import 'package:ahmedelsayed_educatly_task/features/chat/domain/message_entity.dart';
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
              if (state is ChatLoading) {
                // Show a loading indicator if the chat is loading
                return const Center(child: CircularProgressIndicator());
              } else if (state is ChatLoaded) {
                // If the state is loaded, display the messages
                if (state.messages.isEmpty) {
                  return const Center(child: Text("No messages")); // Handle empty state
                }
                
                return ListView.builder(
                  itemCount: state.messages.length, // Use the count of messages
                  itemBuilder: (context, index) {
                    final MessageEntity message = state.messages[index]; // Get the message from the state
                    
                    return Align(
                      alignment: message.senderId == 'currentUserId' // Replace with actual user ID check
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: message.senderId == 'currentUserId' // Replace with actual user ID check
                              ? Colors.greenAccent
                              : Colors.grey[800],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          message.content, // Use message.content instead of message.text
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text("Something went wrong")); // Handle other states
              }
            },
          ),
        ),
      ],
    );
  }
}
