import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_mobile/features/chat/model/chat_message.dart';

List<ChatMessage> mockMessages = [
  ChatMessage(
    id: 1,
    message: '안녕하세요!',
    time: '오후 2:10',
    isMe: false,
    sentAt: DateTime(2025, 6, 18),
    sender: '홍길동',
  ),
  ChatMessage(
    id: 2,
    message: '네 안녕하세요 선생님!',
    time: '오후 2:11',
    isMe: true,
    sentAt: DateTime(2025, 6, 18),
    sender: '나',
  ),
  ChatMessage(
    id: 3,
    message: '이번주 숙제는 part 3까지 풀어오면 됩니다.',
    time: '오후 2:12',
    isMe: false,
    sentAt: DateTime(2025, 6, 19),
    sender: '홍길동',
  ),
  ChatMessage(
    id: 4,
    message: '넵넵',
    time: '오후 2:13',
    isMe: true,
    sentAt: DateTime(2025, 6, 19),
    sender: '나',
  ),
  ChatMessage(
    id: 5,
    message: '확인했습니다!',
    time: '오후 2:13',
    isMe: true,
    sentAt: DateTime(2025, 6, 19),
    sender: '나',
  ),
  ChatMessage(
    id: 6,
    message: '오늘 수업 어떠셨나요?',
    time: '오후 3:00',
    isMe: false,
    sentAt: DateTime(2025, 6, 20),
    sender: '홍길동',
  ),
];

final chatRoomProvider = NotifierProvider<ChatRoomNotifier, List<ChatMessage>>(
  ChatRoomNotifier.new,
);

class ChatRoomNotifier extends Notifier<List<ChatMessage>> {
  @override
  List<ChatMessage> build() {
    // api 연동 시 여기서 fetch
    return mockMessages;
  }

  // api 연동 시 send 로직 여기에 추가
  void send(String text) {
    state = [
      ...state,
      ChatMessage(
        id: state.length + 1,
        message: text,
        time: '방금',
        isMe: true,
        sentAt: DateTime.now(),
        sender: '나',
      ),
    ];
  }
}
