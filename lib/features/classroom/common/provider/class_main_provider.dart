import 'package:flutter_riverpod/legacy.dart';

import '../model/class_main_state.dart';

final classMainProvider =
    StateNotifierProvider<ClassMainProvider, ClassMainState>(
      (ref) => ClassMainProvider(),
    );

class ClassMainProvider extends StateNotifier<ClassMainState> {
  ClassMainProvider() : super(const ClassMainState());

  void changeTab(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }

  void onPageChanged(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }
}
