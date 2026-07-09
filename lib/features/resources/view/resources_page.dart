import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/common/widget/main_app_bar.dart';
import 'package:front_mobile/features/resources/provider/resource_provider.dart';
import 'package:front_mobile/features/resources/view/widget/resource_upload_menu_popup.dart';

class ResourcesPage extends ConsumerWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(resourceProvider);
    final provider = ref.read(resourceProvider.notifier);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(52),
        child: MainAppBar(title: '자료실'),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (state.isFabOpen) ...[
            ResourceUploadMenuPopup(
              onCreateFolder: () {
                provider.closeFab();

                // TODO: 폴더 만들기
              },
              onUploadFile: () {
                provider.closeFab();

                // TODO: 파일 업로드
              },
            ),
            SizedBox(height: 12),
          ],
          SizedBox(
            width: 48,
            height: 48,
            child: FloatingActionButton(
              onPressed: provider.toggleFab,
              backgroundColor: Palette.violet500,
              foregroundColor: Colors.white,
              shape: const CircleBorder(),
              elevation: 4,
              child: AnimatedRotation(
                turns: state.isFabOpen ? 0.125 : 0,
                duration: const Duration(milliseconds: 200),
                child: SvgPicture.asset(
                  'assets/icons/plus_outline.svg',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Palette.iconPrimaryInverse,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                  const SizedBox(width: 8),
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
                        const SizedBox(height: 2),
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
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                              child: LinearProgressIndicator(
                                value: 0.1,
                                minHeight: 8,
                                backgroundColor: Palette.primarySoft,
                                borderRadius: BorderRadius.circular(999),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Palette.primaryBorder,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '0%',
                              style: TextTypes.caption1(
                                color: Palette.textPrimary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
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
            const SizedBox(height: 12),
            SvgPicture.asset(
              'assets/icons/custom_folder_file.svg',
              width: 64,
              height: 64,
            ),
            const SizedBox(height: 16),
            Text(
              '아직 추가된 자료가 없어요',
              style: TextTypes.title1B(color: Palette.textSecondary),
            ),
            const SizedBox(height: 8),
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
