import 'package:flutter/material.dart';

import '../theme.dart';
import 'button.dart';

class CommonBottomSheet extends StatelessWidget {
  final String title;
  final Widget topContent;
  final Widget bottomContent;
  final String buttonText;
  final VoidCallback onButtonTap;

  const CommonBottomSheet({
    super.key,
    required this.title,
    required this.topContent,
    required this.bottomContent,
    required this.buttonText,
    required this.onButtonTap,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required Widget topContent,
    required Widget bottomContent,
    required String buttonText,
    required VoidCallback onButtonTap,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return CommonBottomSheet(
          title: title,
          topContent: topContent,
          bottomContent: bottomContent,
          buttonText: buttonText,
          onButtonTap: onButtonTap,
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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

            const SizedBox(height: 24),

            /// 타이틀
            Text(title, style: TextTypes.title1()),
            const SizedBox(height: 20),

            /// 가변 영역 1
            topContent,
            const SizedBox(height: 4),

            /// divider
            Divider(height: 1, thickness: 1, color: Palette.borderDefault),
            const SizedBox(height: 4),

            /// 가변 영역 2
            bottomContent,
            const SizedBox(height: 20),
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
