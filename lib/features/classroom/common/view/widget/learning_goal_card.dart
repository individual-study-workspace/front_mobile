import 'package:flutter/cupertino.dart';

import '../../../../../common/theme.dart';

class LearningGoalCard extends StatelessWidget {
  final String? learningGoal;

  const LearningGoalCard({super.key, this.learningGoal});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Palette.bgSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: learningGoal == null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '학습 목표',
                  style: TextTypes.title4M(color: Palette.textSecondary),
                ),
                const SizedBox(height: 8),
                Text(
                  '학생이 아직 목표를 설정하지 않았어요.',
                  style: TextTypes.body2R(color: Palette.textSecondary),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '학습 목표',
                  style: TextTypes.title4M(color: Palette.textSecondary),
                ),
                const SizedBox(height: 8),
                Text(
                  learningGoal!,
                  style: TextTypes.body2R(color: Palette.textPrimary),
                ),
              ],
            ),
    );
  }
}
