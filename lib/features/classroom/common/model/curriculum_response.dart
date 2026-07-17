import 'classroom_type.dart';

class CurriculumResponse {
  final int id;
  final String title;

  /// 현재 회차
  final int lessonNo;

  /// 전체 회차
  final int totalLessonCount;

  final LessonType type;

  /// 보강 여부
  final bool isSupplement;

  final DateTime date;
  final String startTime;
  final String endTime;

  final String place;

  final String? memo;

  /// 진행도
  final int progress;

  const CurriculumResponse({
    required this.id,
    required this.title,
    required this.lessonNo,
    required this.totalLessonCount,
    required this.type,
    required this.isSupplement,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.place,
    this.memo,
    required this.progress,
  });

  CurriculumResponse.empty()
    : id = 0,
      title = '',
      lessonNo = 0,
      totalLessonCount = 0,
      type = LessonType.online,
      isSupplement = false,
      date = DateTime.fromMillisecondsSinceEpoch(0),
      startTime = '',
      endTime = '',
      place = '',
      memo = null,
      progress = 0;
}
