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
