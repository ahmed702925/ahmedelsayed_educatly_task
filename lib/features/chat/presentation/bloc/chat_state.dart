import 'package:equatable/equatable.dart';
import '../../domain/message_entity.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object?> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<MessageEntity> messages; // List of messages

  ChatLoaded({required this.messages}); // Constructor to initialize messages

  @override
  List<Object?> get props => [messages]; // Return messages for equality
}
