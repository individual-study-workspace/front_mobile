import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/sign_up_state.dart';

final signUpProvider = StateNotifierProvider<SignUpNotifier, SignUpState>(
  (ref) => SignUpNotifier(),
);

class SignUpNotifier extends StateNotifier<SignUpState> {
  SignUpNotifier() : super(const SignUpState());

  void setName(String value) {
    state = state.copyWith(name: value);
  }

  void setEmail(String value) {
    state = state.copyWith(email: value);
  }

  void setRole(String value) {
    if (state.role == value) {
      state = state.copyWith(role: null);
    } else {
      state = state.copyWith(role: value);
    }
  }
}
