import 'package:flutter_riverpod/legacy.dart';

import '../model/classroom_entry_state.dart';

final classroomEntryProvider =
    StateNotifierProvider<ClassroomEntryNotifier, ClassroomEntryState>(
      (ref) => ClassroomEntryNotifier(),
    );

class ClassroomEntryNotifier extends StateNotifier<ClassroomEntryState> {
  ClassroomEntryNotifier() : super(ClassroomEntryState());

  void setClassroomEntryStep(ClassroomEntryStep value) {
    state = state.copyWith(step: value);
  }

  void setInviteCode(String value) {
    state = state.copyWith(inviteCode: value);
  }
}
