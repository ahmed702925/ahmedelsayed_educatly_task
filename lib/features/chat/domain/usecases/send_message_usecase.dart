// domain/usecases/send_message_usecase.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ahmedelsayed_educatly_task/features/chat/domain/message_entity.dart';


class SendMessageUseCase {
  final FirebaseFirestore firestore; // Firestore instance injected
  final String currentUserId; // Injected current user ID

  SendMessageUseCase({
    required this.firestore,
    required this.currentUserId,
  });

  Future<void> sendMessage(String messageText) async {
    if (messageText.isNotEmpty) {
      final message = MessageEntity(
        id: '', // Leave blank for Firestore to generate an ID
        senderId: currentUserId,
        content: messageText,
        sentTime: DateTime.now(),
      );

      // Add the message to Firestore
      await firestore.collection('messages').add(message.toJson());
    }
  }

  // Optionally, you can fetch messages from Firestore
  Stream<List<MessageEntity>> getMessages() {
    return firestore.collection('messages')
        .orderBy('sentTime', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return MessageEntity.fromJson(doc.data());
          }).toList();
        });
  }
}
