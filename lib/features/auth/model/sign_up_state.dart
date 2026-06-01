class SignUpState {
  ///프로필 설정
  final String name;
  final String email;
  final String? role;

  const SignUpState({this.name = '', this.email = '', this.role});

  /// 사용자 프로필 설정
  bool get isUserProfileValid {
    return name.trim().isNotEmpty && email.trim().isNotEmpty && role != null;
  }

  static const _empty = Object();

  SignUpState copyWith({
    String? name,
    String? email,
    Object? role = _empty,

    bool? isAdult,
    bool? agreeTermsOfService,
    bool? agreePrivacyPolicy,
    bool? agreeMarketing,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      role: role == _empty ? this.role : role as String?,
    );
  }
}
