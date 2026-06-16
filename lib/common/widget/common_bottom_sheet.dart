import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme.dart';
import 'button.dart';

enum BottomSheetHeaderType { close, action }

class CommonBottomSheet extends StatelessWidget {
  final String title;
  final Widget content;
  final String buttonText;
  final VoidCallback onButtonTap;

  final BottomSheetHeaderType headerType;

  final String? leftActionText;
  final String? rightActionText;

  final VoidCallback? onLeftActionTap;
  final VoidCallback? onRightActionTap;

  const CommonBottomSheet.close({
    super.key,
    required this.title,
    required this.content,
    required this.buttonText,
    required this.onButtonTap,
  }) : headerType = BottomSheetHeaderType.close,
       leftActionText = null,
       rightActionText = null,
       onLeftActionTap = null,
       onRightActionTap = null;

  const CommonBottomSheet.action({
    super.key,
    required this.title,
    required this.content,
    required this.buttonText,
    required this.onButtonTap,
    this.leftActionText = '취소',
    this.rightActionText = '저장',
    this.onLeftActionTap,
    this.onRightActionTap,
  }) : headerType = BottomSheetHeaderType.action;

  static Future<T?> showClose<T>(
    BuildContext context, {
    required String title,
    required Widget content,
    required String buttonText,
    required VoidCallback onButtonTap,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return CommonBottomSheet.close(
          title: title,
          content: content,
          buttonText: buttonText,
          onButtonTap: onButtonTap,
        );
      },
    );
  }

  static Future<T?> showAction<T>(
    BuildContext context, {
    required String title,
    required Widget content,
    required String buttonText,
    required VoidCallback onButtonTap,
    String leftActionText = '취소',
    String rightActionText = '저장',
    VoidCallback? onLeftActionTap,
    VoidCallback? onRightActionTap,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return CommonBottomSheet.action(
          title: title,
          content: content,
          buttonText: buttonText,
          onButtonTap: onButtonTap,
          leftActionText: leftActionText,
          rightActionText: rightActionText,
          onLeftActionTap: onLeftActionTap,
          onRightActionTap: onRightActionTap,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, bottomInset + 8),
      decoration: BoxDecoration(
        color: Palette.gray0,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 핸들
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 32,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),

            const SizedBox(height: 28),

            /// Header
            switch (headerType) {
              BottomSheetHeaderType.close => Row(
                children: [
                  Text(title, style: TextTypes.title1B()),
                  const Spacer(),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/icons/close_outline.svg',
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          Palette.iconPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              BottomSheetHeaderType.action => Row(
                children: [
                  InkWell(
                    onTap: onLeftActionTap,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                      child: Text(
                        leftActionText!,
                        style: TextTypes.title4M(color: Palette.textTertiary),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Center(
                      child: Text(title, style: TextTypes.title1B()),
                    ),
                  ),

                  InkWell(
                    onTap: onRightActionTap,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                      child: Text(
                        rightActionText!,
                        style: TextTypes.title4M(color: Palette.primaryVariant),
                      ),
                    ),
                  ),
                ],
              ),
            },

            const SizedBox(height: 12),

            /// Content
            content,

            const SizedBox(height: 20),

            /// Bottom Button
            SizedBox(
              width: double.infinity,
              height: 40,
              child: PrimaryMediumButton(
                content: buttonText,
                onPressed: onButtonTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
