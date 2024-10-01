// presentation/bloc/chat_state.dart
import 'package:ahmedelsayed_educatly_task/features/chat/domain/message_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {
  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoaded extends ChatState {
  final List<MessageEntity> messages;

  ChatLoaded(this.messages);

  @override
  List<Object> get props => [messages];
}
