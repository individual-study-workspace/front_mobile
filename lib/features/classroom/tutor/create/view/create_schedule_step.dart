import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/theme.dart';

import '../model/classroom_create_state.dart';
import '../provider/classroom_create_provider.dart';

class CreateScheduleStep extends ConsumerStatefulWidget {
  const CreateScheduleStep({super.key});

  @override
  ConsumerState<CreateScheduleStep> createState() => _CreateScheduleStepState();
}

class _CreateScheduleStepState extends ConsumerState<CreateScheduleStep> {
  late final TextEditingController totalLessonsController;

  @override
  void initState() {
    super.initState();
    totalLessonsController = TextEditingController();
  }

  @override
  void dispose() {
    totalLessonsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final classroomCreateState = ref.watch(classroomCreateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///위쪽 설명 부분
        Text('2/4', style: TextTypes.caption1(color: Palette.primary)),
        const SizedBox(height: 4),
        Text('수업 일정 설정', style: TextTypes.title1B(color: Palette.textPrimary)),
        const SizedBox(height: 4),
        Text(
          '수업 형태를 선택한 후 수업 일정을 설정해주세요.',
          style: TextTypes.title4M(color: Palette.textTertiary),
        ),

        const SizedBox(height: 20),

        ///수업 형태
        Text('수업 형태', style: TextTypes.title4M(color: Palette.textSecondary)),

        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _SelectionChips(
                title: '매주',
                isSelected:
                    classroomCreateState.scheduleType == ScheduleType.weekly,
                onTap: () {
                  ref
                      .read(classroomCreateProvider.notifier)
                      .setScheduleType(ScheduleType.weekly);
                },
              ),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: _SelectionChips(
                title: '격주',
                isSelected:
                    classroomCreateState.scheduleType == ScheduleType.biweekly,
                onTap: () {
                  ref
                      .read(classroomCreateProvider.notifier)
                      .setScheduleType(ScheduleType.biweekly);
                },
              ),
            ),
            const SizedBox(width: 8),

            Expanded(
              child: _SelectionChips(
                title: '1회성',
                isSelected:
                    classroomCreateState.scheduleType == ScheduleType.oneTime,
                onTap: () {
                  ref
                      .read(classroomCreateProvider.notifier)
                      .setScheduleType(ScheduleType.oneTime);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        ///수업 방식
        Text('수업 요일', style: TextTypes.title4M(color: Palette.textSecondary)),

        SizedBox(height: 8),

        Row(
          children: ClassDays.values.map((day) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: _SelectionChips(
                  title: day.label,
                  isSelected: classroomCreateState.selectedDays.contains(day),
                  onTap: () {
                    ref
                        .read(classroomCreateProvider.notifier)
                        .setSelectedDays(day);
                  },
                ),
              ),
            );
          }).toList(),
        ),

        ///수업 시작일
        const SizedBox(height: 20),
        Text('수업 시작일', style: TextTypes.title4M(color: Palette.textSecondary)),
        const SizedBox(height: 8),
        _DateTimeField(
          value: classroomCreateState.startDay,
          iconPath: 'assets/icons/calendar_outline.svg',
          onTap: () {},
        ),

        ///수업 시작 시간
        const SizedBox(height: 20),
        Text(
          '수업 시작 시간',
          style: TextTypes.title4M(color: Palette.textSecondary),
        ),
        const SizedBox(height: 8),
        _DateTimeField(
          value: classroomCreateState.startTime,
          iconPath: 'assets/icons/time_outline.svg',
          onTap: () {},
        ),

        ///총 수업 횟수
        const SizedBox(height: 20),
        Text('총 수업 횟수', style: TextTypes.title4M(color: Palette.textSecondary)),
        const SizedBox(height: 8),
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Palette.borderDefault),
          ),
          alignment: Alignment.center,
          child: TextField(
            onChanged: (value) {
              ref
                  .read(classroomCreateProvider.notifier)
                  .setTotalLessons(int.tryParse(value));
            },
            controller: totalLessonsController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: TextTypes.body2R(),
            decoration: InputDecoration(
              border: InputBorder.none,
              isCollapsed: true,
              hintText: 'ex) 8',
              hintStyle: TextTypes.body2R(color: Palette.textSecondary),
            ),
          ),
        ),
      ],
    );
  }
}

///수업 형태, 수업 요일 선택용 칩
class _SelectionChips extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _SelectionChips({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),

        decoration: BoxDecoration(
          color: isSelected ? Palette.primarySoft : Palette.bgSurface,

          border: Border.all(
            color: isSelected ? Palette.primary : Palette.borderDefault,
            width: isSelected ? 2 : 1,
          ),

          borderRadius: BorderRadius.circular(6),
        ),

        child: Center(
          child: Text(
            title,
            style: TextTypes.title4M(
              color: isSelected ? Palette.textPrimary : Palette.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

///수업 시작인, 수업 시작 시간 필드
class _DateTimeField extends StatelessWidget {
  final String value;
  final String iconPath;
  final VoidCallback onTap;

  const _DateTimeField({
    required this.value,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 48,

        decoration: BoxDecoration(
          border: Border.all(color: Palette.borderDefault),
          borderRadius: BorderRadius.circular(8),
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: TextTypes.title3SB(color: Palette.textSecondary),
                ),
              ),

              SvgPicture.asset(
                iconPath,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  Palette.iconSecondary,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
