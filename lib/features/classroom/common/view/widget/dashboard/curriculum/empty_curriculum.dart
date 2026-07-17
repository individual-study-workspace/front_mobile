import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/app/route_path.dart';
import 'package:front_mobile/common/widget/button/button.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../common/theme.dart';
import '../../../../model/class_main_state.dart';

class EmptyCurriculum extends StatelessWidget {
  final UserType userType;

  const EmptyCurriculum({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              'assets/icons/book_outline.svg',
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
        const SizedBox(height: 12),
        Text(
          '커리큘럼을 등록해주세요',
          style: TextTypes.title3SB(color: Palette.textPrimary),
        ),
        const SizedBox(height: 4),
        Text(
          '첫 수업 일정을 등록하고 학생과 공유해보세요.',
          textAlign: TextAlign.center,
          style: TextTypes.body2R(color: Palette.textTertiary),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            content: '커리큘럼 등록',
            onPressed: () {
              context.push(RoutePath.classroomCreate);
            },
          ),
        ),
      ],
    );
  }
}
