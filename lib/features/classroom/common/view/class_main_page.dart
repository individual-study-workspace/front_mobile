import 'package:flutter/material.dart';
import 'package:front_mobile/common/widget/button.dart';
import 'package:front_mobile/common/widget/main_app_bar.dart';

import 'package:front_mobile/common/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClassMainPage extends StatelessWidget {
  const ClassMainPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    '아직 개설된 강의실이 없어요',
                    style: TextTypes.title1B(color: Palette.textSecondary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '강의를 개설하면 수업, 과제, 할 일을\n이 곳에서 확인할 수 있어요.',
                    textAlign: TextAlign.center,
                    style: TextTypes.body2M(color: Palette.textTertiary),
                  ),
                  SizedBox(height: 32),
                  PrimaryLargeButton(content: "새 강의실 개설하기"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
