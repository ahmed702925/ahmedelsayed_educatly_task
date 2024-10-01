// presentation/bloc/chat_event.dart
import 'package:equatable/equatable.dart';

import '../../domain/message_entity.dart';

abstract class ChatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendMessageEvent extends ChatEvent {
  final MessageEntity message; // The message entity to be sent

  SendMessageEvent(this.message); // Constructor to initialize the message
}
