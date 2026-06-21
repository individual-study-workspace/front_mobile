import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/theme.dart';

import '../../../../../common/widget/common_bottom_sheet.dart';
import '../../../../../common/widget/common_calendar.dart';
import '../model/classroom_create_state.dart';
import '../provider/classroom_create_provider.dart';

class CreateScheduleStep extends ConsumerWidget {
  final TextEditingController totalLessonsController;

  const CreateScheduleStep({super.key, required this.totalLessonsController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classroomCreateState = ref.watch(classroomCreateProvider);
    final classroomNotifier = ref.read(classroomCreateProvider.notifier);

    final tempHour = ValueNotifier(classroomCreateState.startTime.hour);
    final tempMinute = ValueNotifier(classroomCreateState.startTime.minute);

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
          value: formatDateWithWeek(classroomCreateState.startDay),
          iconPath: 'assets/icons/calendar_outline.svg',
          onTap: () {
            classroomNotifier.selectCalendarDate(
              ref.read(classroomCreateProvider).startDay,
            );
            classroomNotifier.setCurrentCalendarDate(
              ref.read(classroomCreateProvider).startDay,
            );
            CommonBottomSheet.showClose(
              context,
              title: '수업 시작일',
              content: Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(classroomCreateProvider);
                  final notifier = ref.read(classroomCreateProvider.notifier);

                  return CommonCalendar(
                    currentDate: state.currentCalendarDate,
                    selectedDate: state.selectedCalendarDate,
                    onDateSelected: notifier.selectCalendarDate,
                    onPreviousMonth: notifier.goToPreviousMonth,
                    onNextMonth: notifier.goToNextMonth,
                    calendarType: CommonCalendarType.select,
                    onTodayTap: () {
                      notifier.selectCalendarDate(DateTime.now());
                      notifier.setCurrentCalendarDate(DateTime.now());
                    },
                  );
                },
              ),
              buttonText: '선택',
              onButtonTap: () {
                classroomNotifier.setStartDay(
                  ref.read(classroomCreateProvider).selectedCalendarDate,
                );
                Navigator.pop(context);
              },
            );
          },
        ),

        ///수업 시작 시간
        const SizedBox(height: 20),
        Text(
          '수업 시작 시간',
          style: TextTypes.title4M(color: Palette.textSecondary),
        ),
        const SizedBox(height: 8),
        _DateTimeField(
          value: formatTime(classroomCreateState.startTime),
          iconPath: 'assets/icons/time_outline.svg',
          onTap: () {
            CommonBottomSheet.showClose(
              context,
              title: '수업 시작 시간',
              content: _TimePickerContent(
                hourNotifier: tempHour,
                minuteNotifier: tempMinute,
                initialHour: classroomCreateState.startTime.hour,
                initialMinute: classroomCreateState.startTime.minute,
              ),
              buttonText: '선택',
              onButtonTap: () {
                ref
                    .read(classroomCreateProvider.notifier)
                    .setStartTime(
                      TimeOfDay(hour: tempHour.value, minute: tempMinute.value),
                    );
                Navigator.pop(context);
              },
            );
          },
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

///수업 시작일, 수업 시작 시간 필드
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
                  style: TextTypes.title4SB(color: Palette.textSecondary),
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

class _TimePickerContent extends StatelessWidget {
  final int initialHour;
  final int initialMinute;

  final ValueNotifier<int> hourNotifier;
  final ValueNotifier<int> minuteNotifier;

  const _TimePickerContent({
    required this.initialHour,
    required this.initialMinute,
    required this.hourNotifier,
    required this.minuteNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          /// 선택 영역
          IgnorePointer(
            child: Center(
              child: Container(
                height: 44,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Palette.bgBase,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          /// Picker
          Row(
            children: [
              Expanded(
                child: CupertinoPicker(
                  selectionOverlay: const SizedBox.shrink(),
                  itemExtent: 44,
                  useMagnifier: true,
                  magnification: 1.05,
                  scrollController: FixedExtentScrollController(
                    initialItem: initialHour,
                  ),
                  onSelectedItemChanged: (value) {
                    hourNotifier.value = value;
                  },
                  children: List.generate(
                    24,
                    (index) => Center(
                      child: Text(
                        index.toString().padLeft(2, '0'),
                        style: TextTypes.title3SB(color: Palette.textPrimary),
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: CupertinoPicker(
                  selectionOverlay: const SizedBox.shrink(),
                  itemExtent: 44,
                  useMagnifier: true,
                  magnification: 1.05,
                  scrollController: FixedExtentScrollController(
                    initialItem: initialMinute,
                  ),
                  onSelectedItemChanged: (value) {
                    minuteNotifier.value = value;
                  },
                  children: List.generate(
                    60,
                    (index) => Center(
                      child: Text(
                        index.toString().padLeft(2, '0'),
                        style: TextTypes.title3SB(color: Palette.textPrimary),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
