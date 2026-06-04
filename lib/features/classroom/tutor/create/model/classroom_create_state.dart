import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

enum ClassroomCreateStep { basicInfo, schedule, payment, confirm }

enum LessonType { offline, online }

enum ScheduleType { weekly, biweekly, oneTime }

enum ClassDays { mon, tue, wed, thu, fri, sat, sun }

extension ClassDaysExtension on ClassDays {
  String get label => switch (this) {
    ClassDays.mon => '월',
    ClassDays.tue => '화',
    ClassDays.wed => '수',
    ClassDays.thu => '목',
    ClassDays.fri => '금',
    ClassDays.sat => '토',
    ClassDays.sun => '일',
  };
}

enum BillingType { monthly, perLesson }

String _today() {
  final now = DateTime.now();
  const weekdays = ['월', '화', '수', '목', '금', '토', '일'];

  final dayOfWeek = weekdays[now.weekday - 1];
  return '${now.year}.${now.month.toString().padLeft(2, '0')}.${now.day.toString().padLeft(2, '0')} ($dayOfWeek)';
}

String _currentTime() {
  final now = DateTime.now();

  final period = now.hour >= 12 ? '오후' : '오전';
  final hour = now.hour % 12 == 0 ? 12 : now.hour % 12;

  return '$period ${hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
}

int _todayDate() {
  final now = DateTime.now();

  return now.day;
}

class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final number = int.tryParse(newValue.text.replaceAll(',', ''));

    if (number == null) {
      return oldValue;
    }

    final formatted = NumberFormat('#,###').format(number);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class ClassroomCreateState {
  final now = DateTime.now();
  final ClassroomCreateStep step;

  /// basicInfo
  final String title;
  final String description;
  final LessonType? lessonType;

  /// schedule
  final ScheduleType? scheduleType;
  final List<ClassDays> selectedDays;
  final String startDay;
  final String startTime;
  final int? totalLessons;

  /// payment
  final BillingType billingType;
  final int? lessonFee;
  final int billingDate;
  final int? monthlyLessonFee;
  final int? perLessonFee;
  final int? perLessonCount;

  ClassroomCreateState({
    this.step = ClassroomCreateStep.basicInfo,

    this.title = '',
    this.description = 'TEST\ntext1 나중에 지울것.',
    this.lessonType,

    this.scheduleType,
    this.selectedDays = const [],
    String? startDay,
    String? startTime,
    this.totalLessons,

    this.billingType = BillingType.monthly,
    this.lessonFee,
    int? billingDate,
    this.monthlyLessonFee,
    this.perLessonFee,
    this.perLessonCount,
  }) : startDay = startDay ?? _today(),
       startTime = startTime ?? _currentTime(),
       billingDate = billingDate ?? _todayDate();

  bool get canProceed {
    switch (step) {
      case ClassroomCreateStep.basicInfo:
        return title.trim().isNotEmpty && lessonType != null;

      case ClassroomCreateStep.schedule:
        return scheduleType != null &&
            startDay.isNotEmpty &&
            startTime.isNotEmpty &&
            totalLessons != null;

      case ClassroomCreateStep.payment:
        return true;

      case ClassroomCreateStep.confirm:
        return true;
    }
  }

  ClassroomCreateState copyWith({
    ClassroomCreateStep? step,

    String? title,
    String? description,
    LessonType? lessonType,

    ScheduleType? scheduleType,
    List<ClassDays>? selectedDays,
    String? startDay,
    String? startTime,
    int? totalLessons,

    BillingType? billingType,
    int? lessonFee,
    int? monthlyLessonFee,
    int? perLessonFee,
    int? perLessonCount,
  }) {
    return ClassroomCreateState(
      step: step ?? this.step,

      title: title ?? this.title,
      description: description ?? this.description,
      lessonType: lessonType ?? this.lessonType,

      scheduleType: scheduleType ?? this.scheduleType,
      selectedDays: selectedDays ?? this.selectedDays,
      startDay: startDay ?? this.startDay,
      startTime: startTime ?? this.startTime,
      totalLessons: totalLessons ?? this.totalLessons,

      billingType: billingType ?? this.billingType,
      lessonFee: lessonFee ?? this.lessonFee,
      monthlyLessonFee: monthlyLessonFee ?? this.monthlyLessonFee,
      perLessonFee: perLessonFee ?? this.perLessonFee,
      perLessonCount: perLessonCount ?? this.perLessonCount,
    );
  }
}
