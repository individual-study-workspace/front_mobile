import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/widget/theme.dart';

class ChatTextField extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onSend;
  final VoidCallback? onAttach;

  const ChatTextField({super.key, this.controller, this.onSend, this.onAttach});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 60,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Palette.borderDefault, width: 1)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/paperclip_outline.svg',
              width: 24,
              height: 24,
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: '메시지를 입력하세요',
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  hintStyle: TextStyle(fontSize: 12),
                ),
              ),
            ),
            SizedBox(width: 8),
            SvgPicture.asset(
              'assets/icons/send_outline.svg',
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
