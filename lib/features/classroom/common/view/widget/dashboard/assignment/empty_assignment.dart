import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../common/theme.dart';
import '../../../../model/class_main_state.dart';

class EmptyAssignment extends StatelessWidget {
  final UserType userType;

  const EmptyAssignment({super.key, required this.userType});

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
            const SizedBox(height: 4),
            Text(
              userType == UserType.tutor
                  ? '현재 채점 대기 중인 과제가 없습니다.'
                  : '현재 제출해야 할 과제가 없습니다.',
              style: TextTypes.body2R(color: Palette.textTertiary),
            ),
          ],
        ),
      ),
    );
  }
}
