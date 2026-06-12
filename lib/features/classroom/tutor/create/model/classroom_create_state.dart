import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

enum ClassroomCreateStep { basicInfo, schedule, payment, confirm }

enum LessonType { offline, online }

extension LessonTypeExtension on LessonType {
  String get label => switch (this) {
    LessonType.offline => '대면',
    LessonType.online => '비대면',
  };
}

enum ScheduleType { weekly, biweekly, oneTime }

extension ScheduleTypeExtension on ScheduleType {
  String get label => switch (this) {
    ScheduleType.weekly => '매주',
    ScheduleType.biweekly => '격주',
    ScheduleType.oneTime => '1회성',
  };
}

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

extension BillingTypeExtension on BillingType {
  String get label => switch (this) {
    BillingType.monthly => '월별 청구',
    BillingType.perLesson => '회차별 청구',
  };
}

String formatDate(DateTime date) {
  const weekdays = ['월', '화', '수', '목', '금', '토', '일'];

  return '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')} (${weekdays[date.weekday - 1]})';
}

String formatTime(TimeOfDay date) {
  return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
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
  final DateTime startDay;
  final TimeOfDay startTime;
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

    this.scheduleType = ScheduleType.weekly,
    this.selectedDays = const [],
    DateTime? startDay,
    TimeOfDay? startTime,
    this.totalLessons,

    this.billingType = BillingType.monthly,
    this.lessonFee,
    int? billingDate,
    this.monthlyLessonFee,
    this.perLessonFee,
    this.perLessonCount,
  }) : startDay = startDay ?? DateTime.now(),
       startTime = startTime ?? TimeOfDay.now(),
       billingDate = billingDate ?? DateTime.now().day;

  bool get canProceed {
    switch (step) {
      case ClassroomCreateStep.basicInfo:
        return title.trim().isNotEmpty && lessonType != null;

      case ClassroomCreateStep.schedule:
        return scheduleType != null &&
            startDay != null &&
            startTime != null &&
            totalLessons != null;

      case ClassroomCreateStep.payment:
        return billingType == BillingType.monthly &&
                billingDate != null &&
                monthlyLessonFee != null ||
            billingType == BillingType.perLesson &&
                perLessonFee != null &&
                perLessonCount != null ||
            scheduleType == ScheduleType.oneTime && lessonFee != null;

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
    DateTime? startDay,
    TimeOfDay? startTime,
    int? totalLessons,

    BillingType? billingType,
    int? lessonFee,
    int? billingDate,
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
      billingDate: billingDate ?? this.billingDate,
      monthlyLessonFee: monthlyLessonFee ?? this.monthlyLessonFee,
      perLessonFee: perLessonFee ?? this.perLessonFee,
      perLessonCount: perLessonCount ?? this.perLessonCount,
    );
  }
}
