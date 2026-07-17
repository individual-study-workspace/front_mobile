import 'package:flutter/cupertino.dart';

import '../theme.dart';

class PercentProgressBar extends StatelessWidget {
  const PercentProgressBar({
    super.key,
    required this.current,
    required this.total,
    this.height = 8,
    this.backgroundColor = Palette.bgBase,
    this.progressColor = Palette.primary,
  });

  final int current;
  final int total;
  final double height;
  final Color backgroundColor;
  final Color progressColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final value = total == 0 ? 0.0 : current / total;
        final progress = (constraints.maxWidth * value.clamp(0.0, 1.0));

        return Stack(
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: height,
              width: progress,
              decoration: BoxDecoration(
                color: progressColor,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        );
      },
    );
  }
}
