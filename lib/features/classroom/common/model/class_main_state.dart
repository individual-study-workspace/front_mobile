import 'package:front_mobile/features/classroom/common/model/todo_list_item.dart';

import 'assignment_info_response.dart';
import 'curriculum_response.dart';

enum UserType { tutor, tutee }

class ClassMainState {
  final UserType userType;

  ///튜터 튜티는 아마 나중에 AUTH쪽에서 전역으로 받을 가능성 多
  final int selectedTabIndex;
  final List<AssignmentInfoResponse>? assignments;
  final List<TodoListItemModel>? todoList;
  final CurriculumResponse? curriculum;
  final String? classGuide;
  final String? learningGoal;

  ClassMainState({
    this.userType = UserType.tutor,
    this.selectedTabIndex = 0,
    this.assignments,
    this.todoList,
    this.curriculum,
    this.classGuide = "TEST",
    this.learningGoal = "TEST",
  });

  ClassMainState copyWith({
    UserType? userType,
    int? selectedTabIndex,
    List<AssignmentInfoResponse>? assignments,
    List<TodoListItemModel>? todoList,
    CurriculumResponse? curriculum,
    String? classGuide,
    String? learningGoal,
  }) {
    return ClassMainState(
      userType: userType ?? this.userType,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      assignments: assignments ?? this.assignments,
      todoList: todoList ?? this.todoList,
      curriculum: curriculum ?? this.curriculum,
      classGuide: classGuide ?? this.classGuide,
      learningGoal: learningGoal ?? this.learningGoal,
    );
  }
}
