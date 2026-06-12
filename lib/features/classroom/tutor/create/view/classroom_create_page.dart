import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/common/widget/button.dart';
import 'package:front_mobile/common/widget/sub_app_bar.dart';
import 'package:front_mobile/features/classroom/tutor/create/view/confirm_step.dart';

import '../../../../../common/widget/step_progress_bar.dart';
import '../model/classroom_create_state.dart';
import '../provider/classroom_create_provider.dart';
import 'create_basic_info_step.dart';
import 'create_payment_step.dart';
import 'create_schedule_step.dart';

class ClassroomCreatePage extends ConsumerStatefulWidget {
  const ClassroomCreatePage({super.key});

  @override
  ConsumerState<ClassroomCreatePage> createState() =>
      _ClassroomCreatePageState();
}

class _ClassroomCreatePageState extends ConsumerState<ClassroomCreatePage> {
  late final TextEditingController classNameController;

  late final TextEditingController classDescriptionController;

  late final TextEditingController totalLessonsController;

  late final TextEditingController lessonFeeController;
  late final TextEditingController monthlyLessonFeeController;
  late final TextEditingController perLessonFeeController;
  late final TextEditingController perLessonCountController;

  late final TextEditingController inviteCodeController;

  @override
  void initState() {
    super.initState();
    classNameController = TextEditingController();
    classDescriptionController = TextEditingController();
    totalLessonsController = TextEditingController();
    lessonFeeController = TextEditingController();
    monthlyLessonFeeController = TextEditingController();
    perLessonFeeController = TextEditingController();
    perLessonCountController = TextEditingController();
    inviteCodeController = TextEditingController();
  }

  @override
  void dispose() {
    classNameController.dispose();
    classDescriptionController.dispose();
    totalLessonsController.dispose();
    lessonFeeController.dispose();
    monthlyLessonFeeController.dispose();
    perLessonFeeController.dispose();
    perLessonCountController.dispose();
    inviteCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(classroomCreateProvider);

    final notifier = ref.read(classroomCreateProvider.notifier);

    return Scaffold(
      appBar: SubAppBar(
        title: '강의실 개설',
        onBackTap: () {
          notifier.previousStep();
        },
        actions: state.step == ClassroomCreateStep.payment
            ? [
                GestureDetector(
                  child: Text(
                    '건너뛰기',
                    style: TextTypes.title4M(color: Palette.textSecondary),
                  ),
                  onTap: () {
                    notifier.nextStep();
                  },
                ),
              ]
            : null,
      ),

      body: Column(
        children: [
          /// progress
          StepProgressBar(
            currentStep: switch (state.step) {
              ClassroomCreateStep.basicInfo => 1,
              ClassroomCreateStep.schedule => 2,
              ClassroomCreateStep.payment => 3,
              ClassroomCreateStep.confirm => 4,
            },
            totalStep: 4,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: switch (state.step) {
                  ClassroomCreateStep.basicInfo => CreateBasicInfoStep(
                    classNameController: classNameController,
                    classDescriptionController: classDescriptionController,
                  ),

                  ClassroomCreateStep.schedule => CreateScheduleStep(
                    totalLessonsController: totalLessonsController,
                  ),

                  ClassroomCreateStep.payment => CreatePaymentStep(
                    lessonFeeController: lessonFeeController,
                    monthlyLessonFeeController: monthlyLessonFeeController,
                    perLessonFeeController: perLessonFeeController,
                    perLessonCountController: perLessonCountController,
                  ),

                  ClassroomCreateStep.confirm => ConfirmStep(
                    inviteCodeController: inviteCodeController,
                  ),
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SizedBox(
              width: double.infinity,
              height: 52,

              child: PrimaryLargeButton(
                content: state.step == ClassroomCreateStep.confirm
                    ? '개설하기'
                    : '다음',
                isEnabled: state.canProceed,
                onPressed: state.canProceed
                    ? () {
                        if (state.step == ClassroomCreateStep.confirm) {
                        } else {
                          notifier.nextStep();
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
