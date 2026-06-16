import '../../../core/api/api_client.dart';
import 'package:front_mobile/common/model/schedule.dart';

class HomeRepository {
  final ApiClient api;

  HomeRepository(this.api);

  Future<List<Schedule>> fetchSchedules() async {
    // TODO: 실제 API 연동 시 아래 주석 해제
    // final res = await api.dio.get('/schedules');
    // return (res.data as List)
    //     .map((json) => Schedule.fromJson(json as Map<String, dynamic>))
    //     .toList();

    await Future<void>.delayed(const Duration(milliseconds: 300));
    return _mockSchedules();
  }
}

List<Schedule> _mockSchedules() {
  final now = DateTime.now();
  final year = now.year;
  final month = now.month;
  final today = now.day;

  return [
    Schedule(
      date: DateTime(year, month, today),
      type: ScheduleType.classType,
      title: 'Flutter UI 실습',
      deadline: '6.3 (화) 18:00 마감',
    ),
    Schedule(
      date: DateTime(year, month, today),
      type: ScheduleType.classType,
      title: 'Riverpod 상태관리',
      deadline: '오후 2:00 - 4:00',
    ),
    Schedule(
      date: DateTime(year, month, today),
      type: ScheduleType.assignment,
      title: '위젯 과제 제출',
      deadline: '오후 11:59 마감',
    ),
    Schedule(
      date: DateTime(year, month, today).add(const Duration(days: 1)),
      type: ScheduleType.todo,
      title: '프로젝트 README 작성',
      deadline: '오늘까지',
    ),
    Schedule(
      date: DateTime(year, month, 6),
      type: ScheduleType.classType,
      title: 'Dart 기초 수업',
      deadline: '오후 1:00 - 3:00',
    ),
    Schedule(
      date: DateTime(year, month, 6),
      type: ScheduleType.assignment,
      title: '기초 문법 과제',
      deadline: '오후 11:59 마감',
    ),
    Schedule(
      date: DateTime(year, month, 13),
      type: ScheduleType.assignment,
      title: '비동기 프로그래밍 과제',
      deadline: '오후 11:59 마감',
    ),
    Schedule(
      date: DateTime(year, month, 18),
      type: ScheduleType.todo,
      title: '중간 발표 자료 준비',
      deadline: '이번 주 금요일',
    ),
  ];
}
