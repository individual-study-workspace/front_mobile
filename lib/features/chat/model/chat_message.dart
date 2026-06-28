class ChatMessage {
  final int id;
  final String message;
  final String time;
  final bool isMe;
  final DateTime sentAt;
  final String sender;
  final String type;

  // file 타입일 때만 사용
  final String? fileName;
  final int? volume;
  final bool? isDownloaded;
  final String? downloadUrl;

  const ChatMessage({
    required this.id,
    required this.message,
    required this.time,
    required this.isMe,
    required this.sentAt,
    required this.sender,
    required this.type,
    this.fileName,
    this.volume,
    this.isDownloaded,
    this.downloadUrl,
  });
}
