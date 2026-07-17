import 'package:flutter_riverpod/legacy.dart';

import '../mock/assignment_mock.dart';
import '../mock/curriculum_mock.dart';
import '../mock/todo_list_mock.dart';
import '../model/class_main_state.dart';
import '../model/todo_list_item.dart';

final classMainProvider =
    StateNotifierProvider<ClassMainProvider, ClassMainState>(
      (ref) => ClassMainProvider(),
    );

class ClassMainProvider extends StateNotifier<ClassMainState> {
  ClassMainProvider()
    : super(
        ClassMainState(
          assignments: mockAssignmentItems,
          curriculum: curriculumLessonMock,
          todoList: mockTodoListItems,

          ///mock 임시
        ),
      );

  //
  // ClassMainProvider() : super(ClassMainState());

  void changeTab(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }

  void onPageChanged(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }

  void setClassGuide(String guide) {
    state = state.copyWith(classGuide: guide);
  }

  void setLearningGoal(String goal) {
    state = state.copyWith(learningGoal: goal);
  }

  void setTodoChecked(int index) {
    final newTodoList = [...?state.todoList];

    final item = newTodoList[index];

    newTodoList[index] = TodoListItemModel(
      title: item.title,
      dueDate: item.dueDate,
      isChecked: !item.isChecked,
    );

    state = state.copyWith(todoList: newTodoList);
  }
}
