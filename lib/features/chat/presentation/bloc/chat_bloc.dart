import 'package:ahmedelsayed_educatly_task/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/message_entity.dart';
import 'chat_state.dart';
import 'chat_event.dart'; // Import the ChatEvent class

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  List<MessageEntity> _messages = []; // Private list to hold messages

  ChatBloc(SendMessageUseCase sendMessageUseCase) : super(ChatInitial()) {
    // Register event handlers
    on<SendMessageEvent>((event, emit) {
      _messages.add(event.message); // Add the new message to the list
      emit(ChatLoaded(messages: _messages)); // Emit a loaded state with messages
    });
  }
}
