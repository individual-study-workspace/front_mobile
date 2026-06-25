import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/features/chat/model/chat_message.dart';

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
