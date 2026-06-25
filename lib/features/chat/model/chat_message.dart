// chat_message.dart
class ChatMessage {
  final int id;
  final String message;
  final String time;
  final bool isMe;
  final DateTime sentAt;
  final String sender;

  const ChatMessage({
    required this.id,
    required this.message,
    required this.time,
    required this.isMe,
    required this.sentAt,
    required this.sender,
  });
}
