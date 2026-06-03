import 'package:flutter/material.dart';

import '../../../common/theme.dart';

enum ScheduleType { classType, assignment, todo }

extension ScheduleTypeColor on ScheduleType {
  Color get color {
    switch (this) {
      case ScheduleType.classType:
        return Palette.primary;
      case ScheduleType.assignment:
        return Palette.green400;
      case ScheduleType.todo:
        return Palette.yellow400;
    }
  }
}

class Schedule {
  final DateTime date;
  final ScheduleType type;
  final String title;
  final String deadline; // "오후 11:59 마감" 같은 표시용 문자열

  const Schedule({
    required this.date,
    required this.type,
    required this.title,
    required this.deadline,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      date: DateTime.parse(json['date'] as String),
      type: ScheduleType.values.byName(json['type'] as String),
      title: json['title'] as String,
      deadline: json['deadline'] as String,
    );
  }
}
