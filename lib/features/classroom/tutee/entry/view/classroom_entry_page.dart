import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_mobile/common/widget/button/button.dart';
import 'package:front_mobile/common/widget/sub_app_bar.dart';

import '../../../../../common/theme.dart';
import '../../../../../common/widget/modal.dart';
import '../../../../../common/widget/text_input.dart';
import '../../../common/model/classroom_type.dart';
import '../model/classroom_entry_state.dart';
import '../provider/classroom_entry_provider.dart';

class ClassroomEntryPage extends ConsumerStatefulWidget {
  const ClassroomEntryPage({super.key});

  @override
  ConsumerState<ClassroomEntryPage> createState() => _ClassroomEntryPageState();
}

class _ClassroomEntryPageState extends ConsumerState<ClassroomEntryPage> {
  late final TextEditingController inviteCodeController;
  late final TextEditingController lessonGoalController;

  @override
  void initState() {
    super.initState();
    inviteCodeController = TextEditingController();
    lessonGoalController = TextEditingController();
  }

  @override
  void dispose() {
    inviteCodeController.dispose();
    lessonGoalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(classroomEntryProvider);

    return Scaffold(
      appBar: SubAppBar(title: '강의실 입장', onBackTap: () {}),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///위쪽 설명 부분
                    Text(
                      '초대코드 입력',
                      style: TextTypes.title1B(color: Palette.textPrimary),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '초대코드를 입력하여 참여할 강의실 정보를 확인하세요.',
                      style: TextTypes.title4M(color: Palette.textTertiary),
                    ),

                    const SizedBox(height: 20),

                    ///초대코드 입력칸
                    TextInput(
                      hintText: '초대 코드 6자리를 입력하세요.',
                      size: TextInputSize.large,
                      controller: inviteCodeController,
                      onChanged: (value) {
                        ref
                            .read(classroomEntryProvider.notifier)
                            .setInviteCode(value);
                      },
                      onClear: () {
                        inviteCodeController.clear();
                        ref
                            .read(classroomEntryProvider.notifier)
                            .setInviteCode('');
                      },
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '강의명',
                                  style: TextTypes.caption1(
                                    color: Palette.textTertiary,
                                  ),
                                ),
                                Text(
                                  state.classroomInfo.title,
                                  style: TextTypes.title3M(
                                    color: Palette.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '수업 방식',
                                  style: TextTypes.caption1(
                                    color: Palette.textTertiary,
                                  ),
                                ),
                                Text(
                                  state.classroomInfo.lessonType!.label,
                                  style: TextTypes.title3M(
                                    color: Palette.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '수업 일정',
                                  style: TextTypes.caption1(
                                    color: Palette.textTertiary,
                                  ),
                                ),
                                state.classroomInfo.scheduleType ==
                                        ScheduleType.oneTime
                                    ? Text(
                                        '${state.classroomInfo.startDay} · ${state.classroomInfo.startTime}',
                                        style: TextTypes.title3M(
                                          color: Palette.textPrimary,
                                        ),
                                      )
                                    : Text(
                                        '매주 ${state.classroomInfo.selectedDays.map((e) => e.label).join(',')} · ${state.classroomInfo.startTime}',
                                        style: TextTypes.title3M(
                                          color: Palette.textPrimary,
                                        ),
                                      ),
                              ],
                            ),
                            state.classroomInfo.scheduleType ==
                                    ScheduleType.oneTime
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
                                        '${state.classroomInfo.startDay} 시작 · 총 ${state.classroomInfo.totalLessons}회',
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
                                  style: TextTypes.caption1(
                                    color: Palette.textTertiary,
                                  ),
                                ),
                                Text(
                                  state.classroomInfo.scheduleType ==
                                          ScheduleType.oneTime
                                      ? '${state.classroomInfo.lessonFee}원'
                                      : state.classroomInfo.billingType ==
                                            BillingType.monthly
                                      ? '${state.classroomInfo.monthlyLessonFee}원'
                                      : '${state.classroomInfo.perLessonFee}원',
                                  style: TextTypes.title3M(
                                    color: Palette.primaryVariant,
                                  ),
                                ),
                              ],
                            ),
                            if (state.classroomInfo.scheduleType !=
                                ScheduleType.oneTime)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    state.classroomInfo.billingType ==
                                            BillingType.monthly
                                        ? '${state.classroomInfo.billingType.label} · 매달 ${state.classroomInfo.billingDate}일'
                                        : '${state.classroomInfo.billingType.label} · ${state.classroomInfo.perLessonCount}회차 마다',
                                    style: TextTypes.title4M(
                                      color: Palette.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SizedBox(
              width: double.infinity,
              height: 52,

              child: PrimaryButton(
                content: state.step == ClassroomEntryStep.codeInput
                    ? '확인하기'
                    : '승인 신청하기',
                isEnabled: state.isInviteCodeValid,
                onPressed: state.isInviteCodeValid
                    ? () {
                        if (state.step == ClassroomEntryStep.codeInput) {
                          ///코드 확인하고 성공하면
                          ref
                              .read(classroomEntryProvider.notifier)
                              .setClassroomEntryStep(
                                ClassroomEntryStep.codeCheck,
                              );
                        } else {
                          ///승인 신청하고 완료되면 모달
                          showDialog(
                            context: context,
                            builder: (_) {
                              return Modal(
                                showCloseButton: false,
                                title: '입장 신청이 완료되었습니다',
                                description:
                                    '튜터의 승인 후 강의실 입장이 가능합니다.\n잠시만 기다려 주세요!',
                                rightText: '확인',
                                onRight: () {
                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
                        }
                      }
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
