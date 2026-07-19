import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/common/widget/sub_app_bar.dart';
import 'package:front_mobile/features/resources/provider/resource_provider.dart';
import 'package:front_mobile/features/resources/view/upload/resource_category_select.dart';
import 'package:front_mobile/features/resources/view/upload/resource_upload_select.dart';
import 'package:front_mobile/features/resources/view/widget/resource_upload_indicator.dart';

class ResourceUploadPage extends ConsumerWidget {
  const ResourceUploadPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref.watch(resourceProvider).currentStep;

    const steps = ['파일 선택', '카테고리', '폴더 선택', '공유 설정'];

    final stepViews = [
      const ResourceUploadSelect(),
      const ResourceCategorySelect(),
      const Placeholder(), // FolderSelectView() 추가 예정
      const Placeholder(), // PublishSettingView() 추가 예정
    ];

    return Scaffold(
      appBar: SubAppBar(title: '자료 업로드'),
      body: Column(
        children: [
          // 상단 스텝 인디케이터
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int index = 0; index < steps.length; index++) ...[
                  ResourceUploadIndicator(
                    index: index,
                    currentStep: currentStep,
                    steps: steps,
                  ),
                  if (index < steps.length - 1)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 14,
                          left: 12.5,
                          right: 12.5,
                        ),
                        child: Divider(
                          height: 2,
                          thickness: 2,
                          color: index < currentStep
                              ? Palette.primaryBorder
                              : Palette.borderLight,
                        ),
                      ),
                    ),
                ],
              ],
            ),
          ),

          // 스텝 컨텐츠
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: stepViews[currentStep],
            ),
          ),

          // rebase 후 변경된 공통 버튼으로 변경 예정
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  if (currentStep > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () =>
                            ref.read(resourceProvider.notifier).prevStep(),
                        child: const Text('이전'),
                      ),
                    ),
                  if (currentStep > 0) const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () =>
                          ref.read(resourceProvider.notifier).nextStep(),
                      child: Text(currentStep == 3 ? '완료' : '다음'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
