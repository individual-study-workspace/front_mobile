import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/theme.dart';

class ChatListCard extends StatelessWidget {
  const ChatListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Palette.bgSoft,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/user_outline.svg',
                height: 18,
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(
                  Palette.iconPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "강의실명", // 강의실명 api 적용 필요
                          style: TextTypes.title3SB(color: Palette.textPrimary),
                        ),
                        SizedBox(width: 4),
                        Badge(), // 이후 튜터명 뱃지 추가 필요
                      ],
                    ),
                    Text(
                      '오후 00:00',
                      style: TextTypes.caption1(color: Palette.textTertiary),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '마지막으로 남겨진 메시지 텍스트 전부 다 작성', // 마지막 메세지 내용
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextTypes.body2R(color: Palette.textSecondary),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // 읽지 않음 메세지 카운트
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Palette.statusDanger,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '+999',
                        style: TextTypes.caption2(color: Palette.bgSurface),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
