import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../common/theme.dart';

class AssignmentCardHeader extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback? onMoreTap;

  const AssignmentCardHeader({
    super.key,
    required this.title,
    required this.count,
    this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: title,
                style: TextTypes.title4M(color: Palette.textPrimary),
              ),
              const WidgetSpan(child: SizedBox(width: 8)),
              TextSpan(
                text: '$count',
                style: TextTypes.title4M(color: Palette.primaryVariant),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: onMoreTap,
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(8, 9.5, 4, 9.5),
            child: Row(
              children: [
                Text(
                  '더보기',
                  style: TextTypes.caption1(color: Palette.textTertiary),
                ),
                const SizedBox(width: 2),
                SvgPicture.asset(
                  'assets/icons/right_outline.svg',
                  width: 16,
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
