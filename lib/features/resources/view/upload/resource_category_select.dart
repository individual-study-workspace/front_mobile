import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/features/resources/provider/resource_provider.dart';

class ResourceCategorySelect extends ConsumerWidget {
  const ResourceCategorySelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedId = ref.watch(resourceProvider).selectedCategoryId;
    final categories = ref.read(resourceProvider.notifier).mockCategories;

    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Palette.primary,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "2",
                    style: TextTypes.body2R(color: Palette.textPrimaryInverse),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '카테고리 선택',
                  style: TextTypes.title3SB(color: Palette.gray100),
                ),
              ],
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(left: 34),
              child: Text(
                '자료를 등록할 카테고리를 선택해주세요',
                style: TextTypes.caption1(color: Palette.textSecondary),
              ),
            ),
            SizedBox(height: 40),
            Text('카테고리', style: TextTypes.title4M(color: Palette.gray100)),
            SizedBox(height: 16),
            // 카테고리 카드 리스트
            ...categories.map((category) {
              final isSelected = selectedId == category.id;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  onTap: () => ref
                      .read(resourceProvider.notifier)
                      .selectCategory(category.id),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Palette.violet50 : Palette.bgSurface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? Palette.primary
                            : Palette.borderLight,
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          category.icon,
                          width: 32,
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            isSelected ? Palette.primary : Palette.gray100,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                category.title,
                                style: TextTypes.body1M(
                                  color: isSelected
                                      ? Palette.primary
                                      : Palette.iconPrimary,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                category.description,
                                style: TextTypes.caption1(
                                  color: Palette.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected
                                ? Palette.primary
                                : Colors.transparent,
                            border: Border.all(
                              color: isSelected
                                  ? Palette.primary
                                  : Palette.borderLight,
                            ),
                          ),
                          child: isSelected
                              ? const Icon(
                                  Icons.check,
                                  size: 14,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
