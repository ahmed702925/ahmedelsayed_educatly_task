import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/chat/presentation/bloc/chat_bloc.dart';
import 'features/chat/presentation/pages/chat_page.dart';
import 'features/chat/domain/usecases/send_message_usecase.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Provide ChatBloc and inject the use case here
        BlocProvider(
          create: (context) => ChatBloc(SendMessageUseCase()),
        ),
      ],
      child: MaterialApp(
        title: 'Chat App',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.greenAccent, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.greenAccent),
        ),
        home: ChatPage(), // The main page of the app (chat interface)
      ),
    );
  }
}
