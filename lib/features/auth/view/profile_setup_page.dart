import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/common/widget/sub_app_bar.dart';

import '../../../common/widget/button.dart';
import '../../../common/widget/text_input.dart';
import '../provider/sign_up_provider.dart';

class ProfileSetupPage extends ConsumerStatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  ConsumerState<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends ConsumerState<ProfileSetupPage> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpProvider);
    return Scaffold(
      appBar: SubAppBar(title: '사용자 프로필 설정'),

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
                    Text('프로필을 설정해주세요', style: TextTypes.title1B()),
                    const SizedBox(height: 4),
                    Text(
                      '서비스에서 사용할 이름과 역할을 선택해주세요.',
                      style: TextTypes.body2M(color: Palette.textSecondary),
                    ),
                    const SizedBox(height: 20),

                    /// 프로필 이미지
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Palette.borderLight),
                              color: Palette.bgBase,
                            ),

                            child: Center(
                              child: SizedBox(
                                width: 40,
                                height: 40,

                                child: SvgPicture.asset(
                                  'assets/icons/user_outline.svg',

                                  colorFilter: ColorFilter.mode(
                                    Palette.gray40,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},

                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 5.5,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/camera_outline.svg',
                                    width: 16,
                                    height: 16,
                                    colorFilter: ColorFilter.mode(
                                      Palette.iconTertiary,
                                      BlendMode.srcIn,
                                    ),
                                  ),

                                  const SizedBox(width: 4),

                                  Text(
                                    '앨범에서 선택',
                                    style: TextTypes.title4M(
                                      color: Palette.textTertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// 이름
                    Text.rich(
                      TextSpan(
                        text: '이름 ',
                        style: TextTypes.title4M(color: Palette.gray60),
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextTypes.title4M(
                              color: Palette.statusDanger,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    LargeSearchInputField(
                      hintText: '홍길동',
                      controller: emailController,
                      onChanged: (value) {
                        ref.read(signUpProvider.notifier).setName(value);
                      },
                    ),

                    const SizedBox(height: 20),

                    /// 이메일
                    Text(
                      '이메일',
                      style: TextTypes.title4M(color: Palette.gray60),
                    ),

                    const SizedBox(height: 8),

                    LargeSearchInputField(
                      hintText: 'user@gmail.com',
                      state: LargeInputState.readOnly,
                    ),

                    const SizedBox(height: 20),

                    /// 역할
                    Text.rich(
                      TextSpan(
                        text: '사용자 유형 선택 ',
                        style: TextTypes.title4M(color: Palette.gray60),
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextTypes.title4M(
                              color: Palette.statusDanger,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: _RoleButton(
                            title: '튜티',
                            description: '강의 개설 및 수업 관리',
                            isSelected: signUpState.role == 'tutee',
                            onTap: () {
                              ref
                                  .read(signUpProvider.notifier)
                                  .setRole('tutee');
                            },
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: _RoleButton(
                            title: '튜터',
                            description: '강의 일정 및 수강',
                            isSelected: signUpState.role == 'tutor',
                            onTap: () {
                              ref
                                  .read(signUpProvider.notifier)
                                  .setRole('tutor');
                            },
                          ),
                        ),
                      ],
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
                  isEnabled: signUpState.isUserProfileValid,
                  onPressed: signUpState.isUserProfileValid
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

///역할 선택
class _RoleButton extends StatelessWidget {
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleButton({
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: isSelected ? Palette.primarySoft : Palette.bgSurface,

          border: Border.all(
            color: isSelected ? Palette.primary : Palette.borderDefault,
            width: isSelected ? 2 : 1,
          ),

          borderRadius: BorderRadius.circular(8),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(title, style: TextTypes.title3SB(color: Palette.textPrimary)),

            const SizedBox(height: 4),

            Text(
              description,
              style: TextTypes.caption1(color: Palette.textTertiary),
            ),
          ],
        ),
      ),
    );
  }
}
