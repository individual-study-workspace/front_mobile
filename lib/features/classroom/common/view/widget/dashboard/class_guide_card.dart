import 'package:flutter/cupertino.dart';

import '../../../../../../common/theme.dart';
import '../../../../../../common/widget/button.dart';

class ClassGuideCard extends StatelessWidget {
  final VoidCallback? onPressed;

  const ClassGuideCard({super.key, this.onPressed});

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
          Text('강의 안내', style: TextTypes.title4M(color: Palette.textSecondary)),
          const SizedBox(height: 8),
          Text(
            '교재 지참, 지각 규칙 등 학생에게 꼭 알려야 할 내용을 적어주세요.',
            style: TextTypes.body2R(color: Palette.textTertiary),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: SecondaryMediumButton(content: '등록하기', onPressed: onPressed),
          ),
        ],
      ),
    );
  }
}
