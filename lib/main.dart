import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/chat/presentation/bloc/chat_bloc.dart';
import 'features/chat/presentation/pages/chat_page.dart';
import 'features/chat/domain/usecases/send_message_usecase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Provide ChatBloc and inject the use case here
        BlocProvider(
          create: (context) {
            final currentUserId = FirebaseAuth.instance.currentUser?.uid ??
                ''; // Get the current user ID
            return ChatBloc(
              SendMessageUseCase(
                firestore:
                    FirebaseFirestore.instance, // Pass Firestore instance
                currentUserId: currentUserId, // Pass current user ID
              ),
            );
          },
        ),
        // Add other BlocProviders if needed
      ],
      child: MaterialApp(
        title: 'Chat App',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.greenAccent,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.greenAccent),
        ),
        home: ChatPage(), // The main page of the app (chat interface)
      ),
    );
  }
}
