// domain/usecases/send_message_usecase.dart

import 'package:ahmedelsayed_educatly_task/features/chat/domain/message_entity.dart';

class SendMessageUseCase {
  final List<MessageEntity> messages = [];

  void sendMessage(String text) {
    // Add new message to the message list (you can replace this with repository logic later)
    messages.add(MessageEntity(text: text, isSent: true));
  }

  List<MessageEntity> getMessages() {
    return messages;
  }
}
