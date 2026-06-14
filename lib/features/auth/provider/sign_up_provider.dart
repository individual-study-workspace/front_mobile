import 'package:flutter_riverpod/legacy.dart';

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

  void setAdult(bool value) {
    state = state.copyWith(isAdult: value);
  }

  void setAgreeTermsOfService(bool value) {
    state = state.copyWith(agreeTermsOfService: value);
  }

  void setAgreePrivacyPolicy(bool value) {
    state = state.copyWith(agreePrivacyPolicy: value);
  }

  void setAgreeMarketing(bool value) {
    state = state.copyWith(agreeMarketing: value);
  }

  void setAllAgreements(bool value) {
    state = state.copyWith(
      isAdult: value,
      agreeTermsOfService: value,
      agreePrivacyPolicy: value,
      agreeMarketing: value,
    );
  }
}
