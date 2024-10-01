import 'package:ahmedelsayed_educatly_task/features/chat/domain/message_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat_bloc.dart';
import '../bloc/chat_state.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        // if (true) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final message = MessageEntity(text: "Ahmed", isSent:true);
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
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          );
        // } else {
        //   return Center(child: CircularProgressIndicator());
        // }
      },
    );
  }
}
