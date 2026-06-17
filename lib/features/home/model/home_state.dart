import 'package:front_mobile/common/model/schedule.dart';

class HomeState {
  final DateTime currentMonth;
  final DateTime selectedDate;
  final int selectedTabIndex; // 0=수업, 1=과제, 2=할 일
  final List<Schedule> schedules;
  final bool isLoading;

  const HomeState({
    required this.currentMonth,
    required this.selectedDate,
    this.selectedTabIndex = 0,
    this.schedules = const [],
    this.isLoading = false,
  });

  /// 선택된 날짜의 일정만 필터링
  List<Schedule> get schedulesForSelectedDate {
    return schedules
        .where((schedule) => _isSameDay(schedule.date, selectedDate))
        .toList();
  }

  /// 선택된 날짜의 수업 개수
  int get classCount => schedulesForSelectedDate
      .where((schedule) => schedule.type == ScheduleType.classType)
      .length;

  /// 선택된 날짜의 과제 개수
  int get assignmentCount => schedulesForSelectedDate
      .where((schedule) => schedule.type == ScheduleType.assignment)
      .length;

  /// 선택된 날짜의 할 일 개수
  int get todoCount => schedulesForSelectedDate
      .where((schedule) => schedule.type == ScheduleType.todo)
      .length;

  /// 현재 선택된 탭에 해당하는 일정 목록
  List<Schedule> get selectedTabSchedules {
    final type = _typeForTabIndex(selectedTabIndex);

    return schedulesForSelectedDate
        .where((schedule) => schedule.type == type)
        .toList();
  }

  /// 날짜 셀 하단 도트 렌더링용 — 해당 날짜에 어떤 타입이 있는지만 반환 (중복 제거)
  List<ScheduleType> scheduleTypesForDate(DateTime date) {
    return schedules
        .where((schedule) => _isSameDay(schedule.date, date))
        .map((schedule) => schedule.type)
        .toSet()
        .toList();
  }

  HomeState copyWith({
    DateTime? currentMonth,
    DateTime? selectedDate,
    int? selectedTabIndex,
    List<Schedule>? schedules,
    bool? isLoading,
  }) {
    return HomeState(
      currentMonth: currentMonth ?? this.currentMonth,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      schedules: schedules ?? this.schedules,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  static bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static ScheduleType _typeForTabIndex(int index) {
    switch (index) {
      case 0:
        return ScheduleType.classType;
      case 1:
        return ScheduleType.assignment;
      case 2:
        return ScheduleType.todo;
      default:
        return ScheduleType.classType;
    }
  }
}
