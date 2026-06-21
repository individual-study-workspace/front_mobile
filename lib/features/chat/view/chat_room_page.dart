import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/common/widget/sub_app_bar.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({super.key});

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    final List<ChatMessage> messages = [
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

    return Scaffold(
      appBar: SubAppBar(title: '홍길동'), // api 연동 시 닉네임으로 변경 필요
      body: Column(
        children: [
          // 공지 영역
          Container(
            color: Palette.primarySoft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '이번주 숙제: part 3 풀기',
                    style: TextTypes.title3SB(color: Palette.textPrimary),
                  ),
                  SvgPicture.asset(
                    'assets/icons/down_outline.svg',
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      Palette.iconTertiary,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            // 채팅 빌드
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final item = messages[index];
                final prev = index > 0
                    ? messages[index - 1]
                    : null; // 이전 메세지가 있는 지 체크
                final showDivider =
                    prev == null ||
                    !_isSameDay(
                      prev.sentAt,
                      item.sentAt,
                    ); // 날짜 구분선 표시 여부 이전 메세지와 날짜 다른 지
                final showSender =
                    !item.isMe &&
                    (prev == null ||
                        prev.sender != item.sender); // 발신자 체크 이전 메세지와 발신자가 다른 지
                final next = index < messages.length - 1
                    ? messages[index + 1]
                    : null; // 다음 메세지 체크
                final showTime =
                    next == null ||
                    next.sender != item.sender ||
                    next.time !=
                        item.time; // 다음 메세지가 없거나 발신자가 바뀌거나 시간이 다르면 메세지에 발신 시간 표시
                final bottomPadding = next == null || next.sender != item.sender
                    ? 16.0
                    : 4.0; // 말풍선 간격 같은 발신자의 메세지 간격은 4, 발신자가 달라지면 간격 16

                return Column(
                  children: [
                    if (showDivider) _DateDivider(date: item.sentAt),
                    ChatBubble(
                      message: item,
                      showSender: showSender,
                      showTime: showTime,
                      bottomPadding: bottomPadding,
                    ),
                  ],
                );
              },
            ),
          ),
          // 채팅 입력 영역 임시로 해둠 공통으로 수정할 지 확인
          SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Palette.bgSurface,
                border: Border(
                  top: BorderSide(color: Palette.borderDefault, width: 1),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/paperclip_outline.svg',
                    width: 32,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      Palette.iconPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Palette.bgBase,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextField(
                        minLines: 1,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: '메시지를 입력하세요',
                          hintStyle: TextTypes.body2R(
                            color: Palette.textTertiary,
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextTypes.body2R(color: Palette.textPrimary),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    'assets/icons/send_outline.svg',
                    width: 32,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      Palette.iconDisabled, // 입력 가능 시 아이콘 색상 변경해야 할 듯
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 날짜 바뀔 시 채팅 사이 날짜 표시
class _DateDivider extends StatelessWidget {
  final DateTime date;
  const _DateDivider({required this.date});

  String _format(DateTime d) {
    const weeks = ['월', '화', '수', '목', '금', '토', '일'];
    return '${d.year}년 ${d.month}월 ${d.day}일 ${weeks[d.weekday - 1]}요일';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Palette.bgSoft,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              child: Text(
                _format(date),
                style: TextTypes.caption1(color: Palette.textSecondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 채팅 메세지 모델
class ChatMessage {
  final int id;
  final String message;
  final String time;
  final bool isMe;
  final DateTime sentAt;
  final String sender;

  ChatMessage({
    required this.id,
    required this.message,
    required this.time,
    required this.isMe,
    required this.sentAt,
    required this.sender,
  });
}

// 채팅
class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final bool showSender;
  final bool showTime;
  final double bottomPadding;

  const ChatBubble({
    super.key,
    required this.message,
    required this.showSender,
    required this.showTime,
    required this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        // 채팅 간의 간격
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Column(
          crossAxisAlignment: message.isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            // 상대방 닉네임 (발신자 바뀔 때만)
            if (!message.isMe && showSender)
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Palette.bgSoft,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: SvgPicture.asset(
                        'assets/icons/user_outline.svg',
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          Palette.iconSecondary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    message.sender,
                    style: TextTypes.caption1(color: Palette.textPrimary),
                  ),
                  SizedBox(width: 4),
                  Badge(), // 강의실 공통 뱃지로 변경 필요
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                mainAxisAlignment: message.isMe
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // 내 메세지 시간 표기
                  if (message.isMe && showTime)
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Text(
                        message.time,
                        style: TextTypes.caption2(color: Palette.textTertiary),
                      ),
                    ),
                  Flexible(
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.68,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: message.isMe ? Palette.primary : Palette.bgBase,
                        borderRadius: BorderRadius.only(
                          // 내 메세지와 타인메세지의 뾰족한 부분 구분
                          topLeft: Radius.circular(message.isMe ? 12 : 2),
                          topRight: Radius.circular(message.isMe ? 2 : 12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        message.message,
                        style: TextTypes.body2M(
                          color: message.isMe
                              ? Palette.textPrimaryInverse
                              : Palette.textPrimary,
                        ),
                      ),
                    ),
                  ),
                  // 타인 메세지 시간 표기
                  if (!message.isMe && showTime)
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        message.time,
                        style: TextTypes.caption2(color: Palette.textTertiary),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
