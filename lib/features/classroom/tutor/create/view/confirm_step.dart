import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_mobile/common/theme.dart';

import '../model/classroom_create_state.dart';
import '../provider/classroom_create_provider.dart';

class ConfirmStep extends ConsumerWidget {
  final TextEditingController inviteCodeController;

  const ConfirmStep({super.key, required this.inviteCodeController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classroomCreateState = ref.watch(classroomCreateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///위쪽 설명 부분
        Text('4/4', style: TextTypes.caption1(color: Palette.primary)),
        const SizedBox(height: 4),
        Text(
          '강의실 정보 확인 및 개설 준비',
          style: TextTypes.title1B(color: Palette.textPrimary),
        ),
        const SizedBox(height: 4),
        Text(
          '입력하신 정보를 확인하고 학생을 강의실로 초대하세요.',
          style: TextTypes.title4M(color: Palette.textTertiary),
        ),
        const SizedBox(height: 20),

        ///강의실 정보 요약
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Palette.bgBase,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '강의명',
                      style: TextTypes.caption1(color: Palette.textTertiary),
                    ),
                    Text(
                      classroomCreateState.title,
                      style: TextTypes.title3M(color: Palette.textPrimary),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '강의명',
                      style: TextTypes.caption1(color: Palette.textTertiary),
                    ),
                    Text(
                      classroomCreateState.title,
                      style: TextTypes.title3M(color: Palette.textPrimary),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '수업 방식',
                      style: TextTypes.caption1(color: Palette.textTertiary),
                    ),
                    Text(
                      classroomCreateState.lessonType!.label,
                      style: TextTypes.title3M(color: Palette.textPrimary),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '수업 일정',
                      style: TextTypes.caption1(color: Palette.textTertiary),
                    ),
                    classroomCreateState.scheduleType == ScheduleType.oneTime
                        ? Text(
                            '${classroomCreateState.startDay} · ${classroomCreateState.startTime}',
                            style: TextTypes.title3M(
                              color: Palette.textPrimary,
                            ),
                          )
                        : Text(
                            '매주 ${classroomCreateState.selectedDays.map((e) => e.label).join(',')} · ${classroomCreateState.startTime}',
                            style: TextTypes.title3M(
                              color: Palette.textPrimary,
                            ),
                          ),
                  ],
                ),
                classroomCreateState.scheduleType == ScheduleType.oneTime
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '1회성 수업',
                            style: TextTypes.title4M(
                              color: Palette.textSecondary,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${classroomCreateState.startDay} 시작 · 총 ${classroomCreateState.totalLessons}',
                            style: TextTypes.title4M(
                              color: Palette.textSecondary,
                            ),
                          ),
                        ],
                      ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '총 수업료 (수수료 포함)',
                      style: TextTypes.caption1(color: Palette.textTertiary),
                    ),
                    Text(
                      classroomCreateState.scheduleType == ScheduleType.oneTime
                          ? '${classroomCreateState.lessonFee}원'
                          : classroomCreateState.billingType ==
                                BillingType.monthly
                          ? '${classroomCreateState.monthlyLessonFee}원'
                          : '${classroomCreateState.perLessonFee}원',
                      style: TextTypes.title3M(color: Palette.primaryVariant),
                    ),
                  ],
                ),
                if (classroomCreateState.scheduleType != ScheduleType.oneTime)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        classroomCreateState.billingType == BillingType.monthly
                            ? '${classroomCreateState.billingType.label} · 매달 ${classroomCreateState.billingDate}일'
                            : '${classroomCreateState.billingType.label} · ${classroomCreateState.perLessonCount}회차 마다',
                        style: TextTypes.title4M(color: Palette.textSecondary),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),

        ///초대코드
        const SizedBox(height: 20),
        Text('초대코드', style: TextTypes.title4M(color: Palette.textSecondary)),
        const SizedBox(height: 4),
        Text(
          '아래 코드를 학생에게 전달하여 수업을 시작하세요.\n(설정에서 언제든 코드를 변경할 수 있습니다.)',
          style: TextTypes.caption1(color: Palette.textTertiary),
        ),

        const SizedBox(height: 8),
        GestureDetector(
          onLongPress: () async {
            // await Clipboard.setData(
            //   const ClipboardData(text: '복사할 내용'),
            // );
            //
            // Fluttertoast.showToast(
            //   msg: '복사되었습니다.',
            // );
          },
          child:  Container(
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
              controller: inviteCodeController,
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
        )

      ],
    );
  }
}
