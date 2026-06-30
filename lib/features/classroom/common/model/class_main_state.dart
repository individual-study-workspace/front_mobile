import 'assignment_info_response.dart';

enum UserType { tutor, tutee }

class ClassMainState {
  final UserType userType;

  ///튜터 튜티는 아마 나중에 AUTH쪽에서 전역으로 받을 가능성 多
  final int selectedTabIndex;
  final List<AssignmentInfoResponse> assignments;

  const ClassMainState({
    this.userType = UserType.tutor,
    this.selectedTabIndex = 0,
    this.assignments = const [],
  });

  ClassMainState copyWith({
    UserType? userType,
    int? selectedTabIndex,
    List<AssignmentInfoResponse>? assignments,
  }) {
    return ClassMainState(
      userType: userType ?? this.userType,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      assignments: assignments ?? this.assignments,
    );
  }
}
