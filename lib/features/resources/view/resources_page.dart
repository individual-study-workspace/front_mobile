import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/common/widget/main_app_bar.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(52),
        child: MainAppBar(title: '자료실'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Palette.violet50, Palette.violet100],
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/custom_folder_cloud.svg',
                    width: 48,
                    height: 48,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '자료 보관 공간',
                          style: TextTypes.caption1(
                            color: Palette.textSecondary,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '100MB',
                                style: TextTypes.title4SB(
                                  color: Palette.textPrimary,
                                ),
                              ),
                              TextSpan(
                                text: ' / 1GB',
                                style: TextTypes.title4M(
                                  color: Palette.textTertiary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                              child: LinearProgressIndicator(
                                value: 0.1,
                                minHeight: 8,
                                backgroundColor: Palette.primarySoft,
                                borderRadius: BorderRadius.circular(999),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Palette.primaryBorder,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '0%',
                              style: TextTypes.caption1(
                                color: Palette.textPrimary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          '중요 자료를 안전하게 보관하세요!',
                          style: TextTypes.caption1(
                            color: Palette.primaryVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            SvgPicture.asset(
              'assets/icons/custom_folder_file.svg',
              width: 64,
              height: 64,
            ),
            SizedBox(height: 16),
            Text(
              '아직 추가된 자료가 없어요',
              style: TextTypes.title1B(color: Palette.textSecondary),
            ),
            SizedBox(height: 8),
            Text(
              '수업자료, 과제, 참고 자료 등을\n폴더로 만들고 파일을 업로드 해보세요!',
              textAlign: TextAlign.center,
              style: TextTypes.body2R(color: Palette.textTertiary),
            ),
          ],
        ),
      ),
    );
  }
}
