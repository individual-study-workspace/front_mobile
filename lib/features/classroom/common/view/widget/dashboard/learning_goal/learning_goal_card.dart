import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_mobile/common/widget/button/button.dart';
import 'package:front_mobile/common/widget/button/button_style.dart';
import 'package:front_mobile/features/classroom/common/provider/class_main_provider.dart';

import '../../../../../../../common/theme.dart';
import '../../../../../../../common/widget/common_bottom_sheet.dart';
import '../../../../../../../common/widget/test_area.dart';
import '../../../../model/class_main_state.dart';

class LearningGoalCard extends ConsumerStatefulWidget {
  final UserType userType;
  final String? learningGoal;

  const LearningGoalCard({
    super.key,
    required this.userType,
    this.learningGoal,
  });

  @override
  ConsumerState<LearningGoalCard> createState() => _LearningGoalCardState();
}

class _LearningGoalCardState extends ConsumerState<LearningGoalCard> {
  late final TextEditingController learningGoalController;

  @override
  void initState() {
    super.initState();
    learningGoalController = TextEditingController();
  }

  @override
  void dispose() {
    learningGoalController.dispose();
    super.dispose();
  }

  void _showLearningGoalBottomSheet({String? initialValue}) {
    learningGoalController.text = initialValue ?? '';

    CommonBottomSheet.showAction(
      context,
      title: '학습 목표',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '튜터에게 알려주는 달성 목표를 적어주세요',
            style: TextTypes.caption1(color: Palette.textTertiary),
          ),
          const SizedBox(height: 8),
          TextArea(
            controller: learningGoalController,
            hintText: '이 수업을 통해 달성하고 싶은 목표나 의지를 자유롭게 적어주세요.',
            maxLength: 500,
          ),
        ],
      ),
      onRightActionTap: () {
        ref
            .read(classMainProvider.notifier)
            .setLearningGoal(learningGoalController.text);
        Navigator.pop(context);
      },
      onLeftActionTap: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Palette.bgSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '학습 목표',
                style: TextTypes.title4M(color: Palette.textSecondary),
              ),
              if (widget.learningGoal != null &&
                  widget.userType == UserType.tutee) ...[
                const Spacer(),
                TertiaryButton(
                  content: '수정',
                  size: ButtonSize.small,
                  variant: ButtonVariant.neutral,
                  onPressed: () {
                    _showLearningGoalBottomSheet(
                      initialValue: widget.learningGoal,
                    );
                  },
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          if (widget.learningGoal == null) ...[
            Text(
              '학생이 아직 목표를 설정하지 않았어요.',
              style: TextTypes.body2R(color: Palette.textTertiary),
            ),
            if (widget.userType == UserType.tutee) ...[
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: SecondaryButton(
                  size: ButtonSize.medium,
                  content: '등록하기',
                  onPressed: () {
                    _showLearningGoalBottomSheet();
                  },
                ),
              ),
            ],
          ] else
            Text(
              widget.learningGoal!,
              style: TextTypes.body2M(color: Palette.textPrimary),
            ),
        ],
      ),
    );
  }
}
