// presentation/bloc/chat_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_event.dart';
import 'chat_state.dart';
import '../../domain/usecases/send_message_usecase.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessageUseCase sendMessageUseCase;

  ChatBloc(this.sendMessageUseCase) : super(ChatInitial());

  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is SendMessage) {
      sendMessageUseCase.sendMessage(event.message);
      final messages = sendMessageUseCase.getMessages();
      yield ChatLoaded(messages);
    }
  }
}
