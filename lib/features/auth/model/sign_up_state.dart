class SignUpState {
  ///프로필 설정
  final String name;
  final String email;
  final String? role;

  /// 약관 동의
  final bool isAdult;
  final bool agreeTermsOfService;
  final bool agreePrivacyPolicy;
  final bool agreeMarketing;

  const SignUpState({
    this.name = '',
    this.email = '',
    this.role,

    this.isAdult = false,
    this.agreeTermsOfService = false,
    this.agreePrivacyPolicy = false,
    this.agreeMarketing = false,
  });

  /// 사용자 프로필 설정
  bool get isUserProfileValid {
    return name.trim().isNotEmpty && email.trim().isNotEmpty && role != null;
  }

  /// 서비스 이용 약관
  /// 동의 후 넘어가기
  bool get isTermsAgreed {
    return isAdult && agreeTermsOfService && agreePrivacyPolicy;
  }

  ///전체 동의하기
  bool get isAllAgreements {
    return isAdult &&
        agreeTermsOfService &&
        agreePrivacyPolicy &&
        agreeMarketing;
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

      isAdult: isAdult ?? this.isAdult,
      agreeTermsOfService: agreeTermsOfService ?? this.agreeTermsOfService,
      agreePrivacyPolicy: agreePrivacyPolicy ?? this.agreePrivacyPolicy,
      agreeMarketing: agreeMarketing ?? this.agreeMarketing,
    );
  }
}
