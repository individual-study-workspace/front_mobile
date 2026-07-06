import '../../../common/model/classroom_type.dart';

class ClassroomEntryResponse {
  final String title;
  final String description;
  final LessonType? lessonType;

  final ScheduleType? scheduleType;
  final List<ClassDays> selectedDays;
  final String startDay; // "2026-06-14"
  final String startTime; // "14:30"
  final int? totalLessons;

  final BillingType billingType;
  final int? lessonFee;
  final int billingDate;
  final int? monthlyLessonFee;
  final int? perLessonFee;
  final int? perLessonCount;

  const ClassroomEntryResponse({
    required this.title,
    required this.description,
    required this.lessonType,
    required this.scheduleType,
    required this.selectedDays,
    required this.startDay,
    required this.startTime,
    required this.totalLessons,
    required this.billingType,
    required this.lessonFee,
    required this.billingDate,
    required this.monthlyLessonFee,
    required this.perLessonFee,
    required this.perLessonCount,
  });
}
