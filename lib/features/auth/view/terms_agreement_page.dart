import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/common/widget/sub_app_bar.dart';

import '../../../common/widget/button.dart';
import '../../../common/widget/checkbox.dart';
import '../provider/sign_up_provider.dart';

class TermsAgreementPage extends ConsumerWidget {
  const TermsAgreementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    return Scaffold(
      appBar: SubAppBar(title: '서비스 이용 약관'),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    /// 타이틀
                    Text('서비스 이용 약관 동의', style: TextTypes.title1B()),
                    const SizedBox(height: 4),
                    Text(
                      '원활한 서비스 이용을 위해 약관을 확인하고 동의해주세요.',
                      style: TextTypes.body2M(color: Palette.textSecondary),
                    ),
                    const SizedBox(height: 20),

                    ///전체 동의
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: GestureDetector(
                        onTap: () {
                          ref
                              .read(signUpProvider.notifier)
                              .setAllAgreements(!signUpState.isAllAgreements);
                        },
                        child: Row(
                          children: [
                            MediumCheckBox(
                              isChecked: signUpState.isAllAgreements
                                  ? true
                                  : false,

                              onTap: () {
                                ref
                                    .read(signUpProvider.notifier)
                                    .setAllAgreements(
                                      !signUpState.isAllAgreements,
                                    );
                              },
                            ),
                            SizedBox(width: 8),
                            Text(
                              '전체 동의하기',
                              style: TextTypes.title3M(
                                color: Palette.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Divider(height: 1),
                    SizedBox(height: 4),

                    ///성인 확인
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: GestureDetector(
                        onTap: () {
                          ref
                              .read(signUpProvider.notifier)
                              .setAdult(!signUpState.isAdult);
                        },
                        child: Row(
                          children: [
                            MediumCheckBox(
                              isChecked: signUpState.isAdult ? true : false,

                              onTap: () {
                                ref
                                    .read(signUpProvider.notifier)
                                    .setAdult(!signUpState.isAdult);
                              },
                            ),
                            SizedBox(width: 8),
                            Text(
                              '(필수) 만 19세 이상입니다.',
                              style: TextTypes.title3M(
                                color: Palette.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///(필수) 서비스 이용약관
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                ref
                                    .read(signUpProvider.notifier)
                                    .setAgreeTermsOfService(
                                      !signUpState.agreeTermsOfService,
                                    );
                              },
                              child: Row(
                                children: [
                                  MediumCheckBox(
                                    isChecked: signUpState.agreeTermsOfService
                                        ? true
                                        : false,

                                    onTap: () {
                                      ref
                                          .read(signUpProvider.notifier)
                                          .setAgreeTermsOfService(
                                            !signUpState.agreeTermsOfService,
                                          );
                                    },
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '(필수) 서비스 이용약관',
                                    style: TextTypes.title3M(
                                      color: Palette.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/right_outline.svg',
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                Palette.iconTertiary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///(필수) 개인정보 처리방침
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                ref
                                    .read(signUpProvider.notifier)
                                    .setAgreePrivacyPolicy(
                                      !signUpState.agreePrivacyPolicy,
                                    );
                              },
                              child: Row(
                                children: [
                                  MediumCheckBox(
                                    isChecked: signUpState.agreePrivacyPolicy
                                        ? true
                                        : false,

                                    onTap: () {
                                      ref
                                          .read(signUpProvider.notifier)
                                          .setAgreePrivacyPolicy(
                                            !signUpState.agreePrivacyPolicy,
                                          );
                                    },
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '(필수) 개인정보 처리방침',
                                    style: TextTypes.title3M(
                                      color: Palette.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/right_outline.svg',
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                Palette.iconTertiary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///(선택) 마케팅 정보 수신
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                ref
                                    .read(signUpProvider.notifier)
                                    .setAgreeMarketing(
                                      !signUpState.agreeMarketing,
                                    );
                              },
                              child: Row(
                                children: [
                                  MediumCheckBox(
                                    isChecked: signUpState.agreeMarketing
                                        ? true
                                        : false,

                                    onTap: () {
                                      ref
                                          .read(signUpProvider.notifier)
                                          .setAgreeMarketing(
                                            !signUpState.agreeMarketing,
                                          );
                                    },
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '(선택) 마케팅 정보 수신',
                                    style: TextTypes.title3M(
                                      color: Palette.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/right_outline.svg',
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                Palette.iconTertiary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 52,

                child: PrimaryLargeButton(
                  content: '시작하기',
                  isEnabled: signUpState.isTermsAgreed,
                  onPressed: signUpState.isTermsAgreed
                      ? () {
                          // 다음 단계
                        }
                      : null,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
