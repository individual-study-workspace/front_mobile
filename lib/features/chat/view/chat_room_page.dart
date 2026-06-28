import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/common/widget/sub_app_bar.dart';
import 'package:front_mobile/features/chat/model/chat_message.dart';
import 'package:front_mobile/features/chat/provider/chat_room_provider.dart';
import 'package:front_mobile/features/chat/view/widget/chat_bubble.dart';
import 'package:front_mobile/features/chat/view/widget/chat_file_bubble.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({super.key});

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    // riverpod 연동 시 → ref.watch(chatRoomProvider)로 교체
    final List<ChatMessage> messages = mockMessages;

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
                    item.type == "chat"
                        ? ChatBubble(
                            message: item,
                            showSender: showSender,
                            showTime: showTime,
                            bottomPadding: bottomPadding,
                          )
                        : ChatFileBubble(
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
