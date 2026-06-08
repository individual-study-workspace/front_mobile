import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/common/widget/button.dart';
import 'package:front_mobile/common/widget/main_app_bar.dart';
import 'package:front_mobile/common/widget/tab_menu.dart';
import 'package:dotted_border/dotted_border.dart';

class ClassMainPage2 extends StatelessWidget {
  const ClassMainPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MainAppBar(title: '드롭다운'),
      ),
      body: Container(
        color: Palette.bgBase,
        child: Column(
          children: [
            TabMenu(
              tabs: const ['대시보드', '커리큘럼', '과제함'],
              selectedIndex: 0,
              onTap: (_) {},
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Palette.bgSurface,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Palette.violet50,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/book_outline.svg',
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.contain,
                                    colorFilter: ColorFilter.mode(
                                      Palette.violet600,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                '커리큘럼을 등록해주세요',
                                style: TextTypes.title3SB(
                                  color: Palette.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '첫 수업 일정을 등록하고 학생과 공유해보세요.',
                                textAlign: TextAlign.center,
                                style: TextTypes.body2R(
                                  color: Palette.textTertiary,
                                ),
                              ),
                              SizedBox(height: 16),
                              PrimaryLargeButton(content: "커리큘럼 등록"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Palette.bgSurface,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '강의 안내',
                            style: TextTypes.title4M(
                              color: Palette.textSecondary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '교재 지참, 지각 규칙 등 학생에게 꼭 알려야 할 내용을 적어주세요.',
                            style: TextTypes.body2R(
                              color: Palette.textTertiary,
                            ),
                          ),
                          SizedBox(height: 8),
                          SecondaryMediumButton(content: '등록하기'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Palette.bgSurface,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '학습 목표',
                            style: TextTypes.title4M(
                              color: Palette.textSecondary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '학생이 아직 목표를 설정하지 않았어요.',
                            style: TextTypes.body2R(
                              color: Palette.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Palette.bgSurface,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '미제출 과제',
                                      style: TextTypes.title4M(
                                        color: Palette.textPrimary,
                                      ),
                                    ),
                                    const WidgetSpan(child: SizedBox(width: 8)),
                                    TextSpan(
                                      text: '0',
                                      style: TextTypes.title4M(
                                        color: Palette.primaryVariant,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '더보기',
                                    style: TextTypes.caption1(
                                      color: Palette.textTertiary,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  SvgPicture.asset(
                                    'assets/icons/right_outline.svg',
                                    width: 16,
                                    height: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          DottedBorder(
                            color: Palette.borderDefault,
                            strokeWidth: 1,
                            dashPattern: const [4, 4],
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Palette.violet50,
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/icons/book_outline.svg',
                                        width: 24,
                                        height: 24,
                                        fit: BoxFit.contain,
                                        colorFilter: ColorFilter.mode(
                                          Palette.violet600,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '현재 진행 중인 과제가 없습니다.',
                                    style: TextTypes.body2R(
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
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Palette.bgSurface,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '투두리스트',
                                      style: TextTypes.title4M(
                                        color: Palette.textPrimary,
                                      ),
                                    ),
                                    const WidgetSpan(child: SizedBox(width: 8)),
                                    TextSpan(
                                      text: '0',
                                      style: TextTypes.title4M(
                                        color: Palette.primaryVariant,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '전체보기',
                                    style: TextTypes.caption1(
                                      color: Palette.textTertiary,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  SvgPicture.asset(
                                    'assets/icons/right_outline.svg',
                                    width: 16,
                                    height: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
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
