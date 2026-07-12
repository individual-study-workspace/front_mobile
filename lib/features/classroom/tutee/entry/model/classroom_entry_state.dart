import 'package:front_mobile/features/classroom/common/model/classroom_type.dart';

import 'classroom_entry_response.dart';

enum ClassroomEntryStep { codeInput, codeCheck }

class ClassroomEntryState {
  final String inviteCode;
  final ClassroomEntryStep step;
  final ClassroomEntryResponse classroomInfo;

  ClassroomEntryState({
    this.inviteCode = '',
    this.step = ClassroomEntryStep.codeInput,
    this.classroomInfo = const ClassroomEntryResponse(
      title: 'Flutter 입문반',
      description: 'Flutter 기초부터 앱 배포까지 진행하는 강의입니다.',
      lessonType: LessonType.online,
      scheduleType: ScheduleType.weekly,
      selectedDays: [ClassDays.mon, ClassDays.wed, ClassDays.fri],
      startDay: '2026-07-01',
      startTime: '19:00',
      totalLessons: 12,
      billingType: BillingType.perLesson,
      lessonFee: 300000,
      billingDate: 25,
      monthlyLessonFee: 300000,
      perLessonFee: 300000,
      perLessonCount: 1,
    ),
  });

  ClassroomEntryState copyWith({String? inviteCode, ClassroomEntryStep? step}) {
    return ClassroomEntryState(
      inviteCode: inviteCode ?? this.inviteCode,
      step: step ?? this.step,
      classroomInfo: classroomInfo ?? this.classroomInfo,
    );
  }

  bool get isInviteCodeValid {
    final regex = RegExp(r'^[A-Za-z0-9]{6}$');
    return regex.hasMatch(inviteCode);
  }
}
