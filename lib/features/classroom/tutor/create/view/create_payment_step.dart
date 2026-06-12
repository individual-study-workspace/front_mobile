import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/theme.dart';

import '../../../../../common/widget/common_bottom_sheet.dart';
import '../model/classroom_create_state.dart';
import '../provider/classroom_create_provider.dart';

class CreatePaymentStep extends ConsumerWidget {
  final TextEditingController lessonFeeController;
  final TextEditingController monthlyLessonFeeController;
  final TextEditingController perLessonFeeController;
  final TextEditingController perLessonCountController;

  const CreatePaymentStep({
    super.key,
    required this.lessonFeeController,
    required this.monthlyLessonFeeController,
    required this.perLessonFeeController,
    required this.perLessonCountController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classroomCreateState = ref.watch(classroomCreateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///위쪽 설명 부분
        Text('3/4', style: TextTypes.caption1(color: Palette.primary)),
        const SizedBox(height: 4),
        Text(
          '수업료 정산 알림 설정',
          style: TextTypes.title1B(color: Palette.textPrimary),
        ),
        const SizedBox(height: 4),
        Text(
          '수업 일정에 맞춰 정산 알림을 자동으로 보내드려요. 결제일을 놓치지 않고 튜터오 학생 모두 편리하게 관리할 수 있어요.',
          style: TextTypes.title4M(color: Palette.textTertiary),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Palette.bgBase,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              classroomCreateState.description,
              style: TextTypes.body2R(color: Palette.textTertiary),
            ),
          ),
        ),
        const SizedBox(height: 20),

        ///수업 일정 1회성일 때
        if (classroomCreateState.scheduleType == ScheduleType.oneTime) ...[
          ///수업료
          Text('수업료', style: TextTypes.title4M(color: Palette.textSecondary)),
          const SizedBox(height: 4),
          Text(
            '이번 수업의 총액을 입력해주세요.',
            style: TextTypes.caption1(color: Palette.textTertiary),
          ),
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
                    .setLessonFee(int.tryParse(value));
              },
              controller: lessonFeeController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                NumberFormatter(),
              ],
              style: TextTypes.body2R(),
              decoration: InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
                hintText: 'ex) 400,000',
                hintStyle: TextTypes.body2R(color: Palette.textSecondary),
              ),
            ),
          ),

          ///수업 형태가 매주/격주 일때
        ] else ...[
          ///청구 주기 방식
          Text(
            '청구 주기 방식',
            style: TextTypes.title4M(color: Palette.textSecondary),
          ),
          const SizedBox(height: 4),
          Text(
            '설정한 횟수의 수업이 완료될 때마다 청구되는 방식입니다.',
            style: TextTypes.caption1(color: Palette.textTertiary),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _BillingType(
                  title: '월별 청구',
                  isSelected:
                      classroomCreateState.billingType == BillingType.monthly,
                  onTap: () {
                    ref
                        .read(classroomCreateProvider.notifier)
                        .setBillingType(BillingType.monthly);
                  },
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: _BillingType(
                  title: '회차별 청구',
                  isSelected:
                      classroomCreateState.billingType == BillingType.perLesson,
                  onTap: () {
                    ref
                        .read(classroomCreateProvider.notifier)
                        .setBillingType(BillingType.perLesson);
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          ///월별 청구일 때
          if (classroomCreateState.billingType == BillingType.monthly) ...[
            ///정기 청구일
            Text(
              '정기 청구일',
              style: TextTypes.title4M(color: Palette.textSecondary),
            ),
            const SizedBox(height: 4),
            Text(
              '매달 정산일을 선택해주세요.',
              style: TextTypes.caption1(color: Palette.textTertiary),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                final tempDay = ValueNotifier(classroomCreateState.billingDate);

                CommonBottomSheet.show(
                  context,
                  title: '정기 청구일',
                  content: _DayPickerContent(dayNotifier: tempDay),
                  buttonText: '선택',
                  onButtonTap: () {
                    ref
                        .read(classroomCreateProvider.notifier)
                        .setBillingDate(tempDay.value);

                    Navigator.pop(context);
                  },
                );
              },
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
                          '매달 ${classroomCreateState.billingDate}일',
                          style: TextTypes.title3SB(
                            color: Palette.textSecondary,
                          ),
                        ),
                      ),

                      SvgPicture.asset(
                        'assets/icons/down_outline.svg',
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
            ),

            ///월별 총 수업료
            const SizedBox(height: 20),
            Text(
              '월별 총 수업료',
              style: TextTypes.title4M(color: Palette.textSecondary),
            ),
            const SizedBox(height: 4),
            Text(
              '한 달 기준 총 수업료를 입력해주세요.',
              style: TextTypes.caption1(color: Palette.textTertiary),
            ),

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
                      .setMonthlyLessonFee(int.tryParse(value));
                },
                controller: monthlyLessonFeeController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: TextTypes.body2R(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isCollapsed: true,
                  hintText: 'ex) 400,000',
                  hintStyle: TextTypes.body2R(color: Palette.textSecondary),
                ),
              ),
            ),
          ]
          ///회차별 청구일 때
          else ...[
            Text(
              '수업료 청구 단위 회차',
              style: TextTypes.title4M(color: Palette.textSecondary),
            ),
            const SizedBox(height: 4),
            Text(
              '몇 회 수업마다 정산할 지 입력해주세요.\n(예: 8회 입력 시 8회, 16히, 24회 수업 완료 후 결제 알림 발송됩니다.)',
              style: TextTypes.caption1(color: Palette.textTertiary),
            ),
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
                      .setPerLessonFeeCount(int.tryParse(value));
                },
                controller: perLessonCountController,
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

            ///회차 총 수업료
            const SizedBox(height: 20),
            Text(
              '회차 총 수업료',
              style: TextTypes.title4M(color: Palette.textSecondary),
            ),
            const SizedBox(height: 4),
            Text(
              '설정한 회차 전체의 합계 금액을 입력해 주세요.',
              style: TextTypes.caption1(color: Palette.textTertiary),
            ),
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
                      .setPerLessonFee(int.tryParse(value));
                },
                controller: perLessonFeeController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  NumberFormatter(),
                ],
                style: TextTypes.body2R(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isCollapsed: true,
                  hintText: 'ex) 400,000',
                  hintStyle: TextTypes.body2R(color: Palette.textSecondary),
                ),
              ),
            ),
          ],
        ],
      ],
    );
  }
}

///수업 형태, 수업 요일 선택용 칩
class _BillingType extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _BillingType({
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

///일자 선택 바텀시트
class _DayPickerContent extends StatelessWidget {
  final ValueNotifier<int> dayNotifier;

  const _DayPickerContent({
    super.key,
    required this.dayNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<int>(
          valueListenable: dayNotifier,
          builder: (context, selectedDay, _) {
            return Text(
              '$selectedDay일 / 말일',
              style: TextTypes.caption1(
                color: Palette.textTertiary,
              ),
            );
          },
        ),

        const SizedBox(height: 12),

        SizedBox(
          height: 180,
          child: ValueListenableBuilder<int>(
            valueListenable: dayNotifier,
            builder: (context, selectedDay, _) {
              return Stack(
                children: [
                  ListWheelScrollView.useDelegate(
                    itemExtent: 44,
                    physics: const FixedExtentScrollPhysics(),
                    controller: FixedExtentScrollController(
                      initialItem: selectedDay - 1,
                    ),
                    onSelectedItemChanged: (index) {
                      dayNotifier.value = index + 1;
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 32,
                      builder: (context, index) {
                        final day = index + 1;
                        final isSelected = selectedDay == day;

                        return Center(
                          child: Text(
                            index == 31 ? '말일' : '${day}일',
                            style: TextTypes.title3SB(
                              color: isSelected
                                  ? Palette.textPrimary
                                  : Palette.textTertiary,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  /// 선택 영역
                  IgnorePointer(
                    child: Center(
                      child: Container(
                        height: 44,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Palette.borderDefault,
                            ),
                            bottom: BorderSide(
                              color: Palette.borderDefault,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Icon(
              Icons.info,
              size: 16,
              color: Palette.primary,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                '해당 날짜가 없는 달은 말일에 청구됩니다.',
                style: TextTypes.caption2(
                  color: Palette.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}