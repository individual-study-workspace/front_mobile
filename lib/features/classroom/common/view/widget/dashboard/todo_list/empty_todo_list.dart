import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/widget/button/button_style.dart';

import '../../../../../../../common/theme.dart';
import '../../../../../../../common/widget/button/button.dart';
import '../../../../model/class_main_state.dart';

class EmptyTodoList extends StatelessWidget {
  final UserType userType;

  const EmptyTodoList({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Palette.borderDefault,
      strokeWidth: 1,
      dashPattern: const [4, 4],
      borderType: BorderType.RRect,
      radius: const Radius.circular(8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.violet50,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/checks_outline.svg',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                  colorFilter: const ColorFilter.mode(
                    Palette.violet600,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '현재 등록된 할 일이 없습니다.',
              style: TextTypes.body2R(color: Palette.textTertiary),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: TertiaryButton(
                size: ButtonSize.small,
                contentBuilder: (textColor) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '투두리스트로 이동',
                      style: TextTypes.title4M(color: textColor),
                    ),
                    const SizedBox(width: 2),
                    SvgPicture.asset(
                      'assets/icons/right_outline.svg',
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
