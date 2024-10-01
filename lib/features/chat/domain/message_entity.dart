// MessageEntity.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageEntity {
  final String id;
  final String senderId;
  final String content;
  final DateTime sentTime;

  MessageEntity({required this.id, required this.senderId, required this.content, required this.sentTime});

  factory MessageEntity.fromJson(Map<String, dynamic> json) {
    return MessageEntity(
      id: json['id'],
      senderId: json['senderId'],
      content: json['content'],
      sentTime: (json['sentTime'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'content': content,
      'sentTime': Timestamp.fromDate(sentTime),
    };
  }
}
