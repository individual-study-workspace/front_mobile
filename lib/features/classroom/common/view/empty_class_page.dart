import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/common/widget/button/button.dart';
import 'package:front_mobile/common/widget/main_app_bar.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/route_path.dart';
import '../model/class_main_state.dart';
import '../provider/class_main_provider.dart';

class EmptyClassPage extends ConsumerWidget {
  const EmptyClassPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(classMainProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: const MainAppBar(title: '강의실'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Palette.violet50,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/book_outline.svg',
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                          Palette.violet600,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.userType == UserType.tutor
                        ? '아직 개설된 강의실이 없어요'
                        : '아직 입장한 강의실이 없어요',
                    style: TextTypes.title1B(color: Palette.textSecondary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.userType == UserType.tutor
                        ? '첫 강의실을 만들고 수업 관리를 시작해보세요'
                        : '튜터에게 받은 초대코드를 입력하고 강의실에 입장해보세요.',
                    textAlign: TextAlign.center,
                    style: TextTypes.body2M(color: Palette.textTertiary),
                  ),
                  SizedBox(height: 32),
                  PrimaryButton(
                    contentBuilder: (textColor) => Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          state.userType == UserType.tutor
                              ? 'assets/icons/plus_outline.svg'
                              : 'assets/icons/pencil_outline.svg',
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            Palette.iconPrimaryInverse,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          state.userType == UserType.tutor
                              ? '새 강의실 개설하기'
                              : '초대코드 입력하기',
                          style: TextTypes.title3SB(color: textColor),
                        ),
                      ],
                    ),
                    onPressed: () {
                      state.userType == UserType.tutor
                          ? context.push(RoutePath.classroomCreate)
                          : context.push(RoutePath.classroomEntry);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
