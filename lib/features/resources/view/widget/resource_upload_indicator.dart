import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/theme.dart';

class ResourceUploadIndicator extends StatelessWidget {
  final int index;
  final int currentStep;
  final List<String> steps;

  const ResourceUploadIndicator({
    super.key,
    required this.index,
    required this.currentStep,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = index == currentStep;
    final isDone = index < currentStep;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDone
                ? Palette.primary
                : isActive
                ? Palette.bgSurface
                : Palette.bgSoft,
            border: isActive
                ? Border.all(width: 1, color: Palette.primary)
                : null,
          ),
          alignment: Alignment.center,
          child: isDone
              ? SvgPicture.asset(
                  'assets/icons/check_outline.svg',
                  width: 16,
                  height: 16,
                  colorFilter: const ColorFilter.mode(
                    Palette.iconPrimaryInverse,
                    BlendMode.srcIn,
                  ),
                )
              : Text(
                  '${index + 1}',
                  style: TextTypes.caption1(
                    color: isActive ? Palette.primary : Palette.textTertiary,
                  ),
                ),
        ),
        const SizedBox(height: 4),
        Text(
          steps[index],
          style: TextTypes.caption1(
            color: isDone
                ? Palette.iconSecondary
                : isActive
                ? Palette.textPrimary
                : Palette.textDisabled,
          ),
        ),
      ],
    );
  }
}
