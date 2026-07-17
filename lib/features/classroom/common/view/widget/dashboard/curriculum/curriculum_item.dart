import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/widget/button/button.dart';
import 'package:front_mobile/common/widget/button/button_style.dart';
import 'package:front_mobile/common/widget/common_badge.dart';
import 'package:front_mobile/features/classroom/common/model/classroom_type.dart';
import 'package:front_mobile/features/classroom/common/model/curriculum_response.dart';

import '../../../../../../../common/theme.dart';
import '../../../../../../../common/widget/percent_progress_bar.dart';
import '../../../../model/class_main_state.dart';

class CurriculumItem extends StatelessWidget {
  final UserType userType;
  final CurriculumResponse curriculum;

  const CurriculumItem({
    super.key,
    required this.userType,
    required this.curriculum,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///badge 넣는 곳
        Row(
          children: [
            CommonBadge(
              text: '현재회차',
              textStyle: TextTypes.caption2(color: Palette.blue500),
              backgroundColor: Palette.blue50,
            ),
            const SizedBox(width: 6),
            CommonBadge(
              text: '(비)대면',
              textStyle: TextTypes.caption2(color: Palette.textSecondary),
              backgroundColor: Palette.bgBase,
            ),
            const SizedBox(width: 6),
            CommonBadge(
              text: '보강',
              textStyle: TextTypes.caption2(color: Palette.yellow600),
              backgroundColor: Palette.yellow50,
            ),
          ],
        ),
        const SizedBox(height: 12),

        Text(curriculum.title, style: TextTypes.title1B()),

        const SizedBox(height: 4),

        SizedBox(
          height: 24,
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/time_outline.svg',
                height: 12,
                width: 12,
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(
                  Palette.iconTertiary,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '${formatDateWithWeek(curriculum.date)}  ${curriculum.startTime} ~ ${curriculum.endTime}',
                style: TextTypes.caption1(color: Palette.textSecondary),
              ),
            ],
          ),
        ),

        const SizedBox(height: 2),

        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/map_pin_outline.svg',
              height: 12,
              width: 12,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                Palette.iconTertiary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              curriculum.place,
              style: TextTypes.caption1(color: Palette.textSecondary),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () {
                // 클릭 이벤트
              },
              child: SizedBox(
                width: 24,
                height: 24,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/copy_outline.svg',
                    width: 16,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                      Palette.iconSecondary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Palette.bgBase,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '수업 메모',
                style: TextTypes.caption1(color: Palette.textSecondary),
              ),
              const SizedBox(height: 6),
              Text(
                (curriculum.memo?.isNotEmpty ?? false)
                    ? curriculum.memo!
                    : '수업 메모 내용이 없습니다.',
                style: TextTypes.body2M(
                  color: (curriculum.memo?.isNotEmpty ?? false)
                      ? Palette.textPrimary
                      : Palette.textTertiary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        SizedBox(
          width: double.infinity,
          child: TertiaryButton(
            variant: ButtonVariant.neutral,
            size: ButtonSize.small,
            onPressed: () {},
            contentBuilder: (textColor) => Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '커리큘럼 회차 정보 수정',
                  style: TextTypes.title4M(color: textColor),
                ),
                const SizedBox(width: 4),
                SvgPicture.asset(
                  'assets/icons/right_outline.svg',
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(
                    Palette.iconTertiary,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 8),

        SizedBox(
          width: double.infinity,
          child: PrimaryButton(onPressed: () {}, content: '수업 입장'),
        ),

        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: Divider(color: Palette.borderLight),
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            Text(
              '강의 진행도',
              style: TextTypes.caption1(color: Palette.textSecondary),
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${curriculum.progress}',
                    style: TextTypes.title4M(color: Palette.primaryVariant),
                  ),
                  TextSpan(
                    text: ' / ${curriculum.totalLessonCount}회차',
                    style: TextTypes.title4M(color: Palette.textSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 6),

        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: PercentProgressBar(
            current: curriculum.progress,
            total: curriculum.totalLessonCount,
          ),
        ),
      ],
    );
  }
}
