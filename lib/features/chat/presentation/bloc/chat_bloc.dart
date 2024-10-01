import 'package:ahmedelsayed_educatly_task/features/chat/domain/message_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/send_message_usecase.dart';
import 'chat_state.dart';
import 'chat_event.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessageUseCase sendMessageUseCase; // Injected use case
  List<MessageEntity> _messages = []; // Private list to hold messages

  // Add a property to hold the current user's ID
  final String currentUserId;

  // Constructor
  ChatBloc(this.sendMessageUseCase)
      : currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '', // Get the current user ID
        super(ChatInitial()) {
    // Register event handlers
    on<SendMessageEvent>((event, emit) async {
      // Send the message using the use case
      await sendMessageUseCase.sendMessage(event.message.content);

      // Update the local list of messages
      _messages.add(event.message);
      
      // Emit a loaded state with messages
      emit(ChatLoaded(messages: _messages));
    });

    // Optionally, handle other events such as loading messages, if needed
    // Example: on<LoadMessagesEvent>((event, emit) async { ... });
  }
}
