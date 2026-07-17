import 'package:flutter/cupertino.dart';

import '../../../../../../../common/theme.dart';
import '../../../../model/class_main_state.dart';
import '../../../../model/curriculum_response.dart';
import 'curriculum_item.dart';
import 'empty_curriculum.dart';

class CurriculumCard extends StatelessWidget {
  final UserType userType;
  final CurriculumResponse? curriculum;

  const CurriculumCard({super.key, required this.userType, this.curriculum});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Palette.bgSurface,
      ),
      child: Column(
        children: [
          if (curriculum == null)
            EmptyCurriculum(userType: userType)
          else
            CurriculumItem(
              userType: userType,
              curriculum: curriculum!, // 하나씩 전달
            ),
        ],
      ),
    );
  }
}
