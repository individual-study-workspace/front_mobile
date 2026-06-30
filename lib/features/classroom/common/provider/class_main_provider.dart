import 'package:flutter_riverpod/legacy.dart';

import '../mock/assignment_mock.dart';
import '../model/class_main_state.dart';

final classMainProvider =
    StateNotifierProvider<ClassMainProvider, ClassMainState>(
      (ref) => ClassMainProvider(),
    );

class ClassMainProvider extends StateNotifier<ClassMainState> {
  ClassMainProvider()
    : super(
        ClassMainState(
          assignments: mockAssignmentItems,

          ///mock 임시
        ),
      );

  ///ClassMainProvider() : super(const ClassMainState());

  void changeTab(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }

  void onPageChanged(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }
}
