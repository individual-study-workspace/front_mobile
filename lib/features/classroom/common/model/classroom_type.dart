import 'package:flutter/material.dart';

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
  return '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}';
}

String formatDateWithWeek(DateTime date) {
  const weekdays = ['월', '화', '수', '목', '금', '토', '일'];

  return '${formatDate(date)} (${weekdays[date.weekday - 1]})';
}

String formatTime(TimeOfDay date) {
  return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
}

String getDueDateText(String dueDate) {
  final due = DateTime.parse(dueDate);
  final now = DateTime.now();

  // 시간 제거 (날짜만 비교)
  final today = DateTime(now.year, now.month, now.day);
  final target = DateTime(due.year, due.month, due.day);

  final diff = target.difference(today).inDays;

  if (diff > 0) {
    return 'D-$diff';
  } else if (diff == 0) {
    return 'D-Day';
  } else {
    return 'D+${diff.abs()}';
  }
}
