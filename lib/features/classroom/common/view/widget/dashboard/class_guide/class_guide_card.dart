import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_mobile/common/widget/button/button.dart';
import 'package:front_mobile/common/widget/button/button_style.dart';
import 'package:front_mobile/features/classroom/common/provider/class_main_provider.dart';

import '../../../../../../../common/theme.dart';
import '../../../../../../../common/widget/common_bottom_sheet.dart';
import '../../../../../../../common/widget/test_area.dart';
import '../../../../model/class_main_state.dart';

class ClassGuideCard extends ConsumerStatefulWidget {
  final UserType userType;
  final String? classGuide;

  const ClassGuideCard({super.key, required this.userType, this.classGuide});

  @override
  ConsumerState<ClassGuideCard> createState() => _ClassGuideCardState();
}

class _ClassGuideCardState extends ConsumerState<ClassGuideCard> {
  late final TextEditingController classGuideController;

  @override
  void initState() {
    super.initState();
    classGuideController = TextEditingController();
  }

  @override
  void dispose() {
    classGuideController.dispose();
    super.dispose();
  }

  void _showClassGuideBottomSheet({String? initialValue}) {
    classGuideController.text = initialValue ?? '';

    CommonBottomSheet.showAction(
      context,
      title: '강의 안내',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          TextArea(
            controller: classGuideController,
            hintText: '수업 진행 방식, 준비물, 지각 규정 등 미리 알아두면 좋을 내용을 자유롭게 적어주세요.',
            maxLength: 500,
          ),
        ],
      ),
      onRightActionTap: () {
        ref
            .read(classMainProvider.notifier)
            .setClassGuide(classGuideController.text);
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
                '강의 안내',
                style: TextTypes.title4M(color: Palette.textSecondary),
              ),
              if (widget.classGuide != null &&
                  widget.userType == UserType.tutor) ...[
                const Spacer(),
                TertiaryButton(
                  content: '수정',
                  size: ButtonSize.small,
                  variant: ButtonVariant.neutral,
                  onPressed: () {
                    _showClassGuideBottomSheet(initialValue: widget.classGuide);
                  },
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          if (widget.classGuide == null) ...[
            Text(
              widget.userType == UserType.tutor
                  ? '교재 지참, 지각 규칙 등 학생에게 꼭 알려야 할 내용을 적어주세요.'
                  : '교재 지참, 지각 규칙 등 학생에게 꼭 알려야 할 내용을 준비 중이에요.',
              style: TextTypes.body2R(color: Palette.textTertiary),
            ),
            if (widget.userType == UserType.tutor) ...[
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: SecondaryButton(
                  variant: ButtonVariant.neutral,
                  size: ButtonSize.medium,
                  content: '등록하기',
                  onPressed: () {
                    _showClassGuideBottomSheet();
                  },
                ),
              ),
            ],
          ] else
            Text(
              widget.classGuide!,
              style: TextTypes.body2M(color: Palette.textPrimary),
            ),
        ],
      ),
    );
  }
}
