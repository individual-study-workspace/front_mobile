import 'package:flutter/cupertino.dart';

import '../theme.dart';

class StepProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalStep;

  const StepProgressBar({
    super.key,
    required this.currentStep,
    this.totalStep = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),

      child: Row(
        children: List.generate(totalStep, (index) {
          final isActive = index < currentStep;

          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: index == totalStep - 1 ? 0 : 4),

              child: Container(
                height: 4,

                decoration: BoxDecoration(
                  color: isActive ? Palette.violet500 : Palette.gray20,

                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
