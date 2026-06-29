import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/common/widget/button.dart';
import 'package:front_mobile/common/widget/main_app_bar.dart';

class EmptyClassPage extends StatelessWidget {
  const EmptyClassPage({super.key});

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
                    '첫 강의실을 만들고 수업 관리를 시작해보세요',
                    textAlign: TextAlign.center,
                    style: TextTypes.body2M(color: Palette.textTertiary),
                  ),
                  SizedBox(height: 32),
                  PrimaryLargeButton(
                    contentBuilder: (textColor) => Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/plus_outline.svg',
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            Palette.iconPrimaryInverse,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '새 강의실 개설하기',
                          style: TextTypes.title3SB(color: textColor),
                        ),
                      ],
                    ),
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
