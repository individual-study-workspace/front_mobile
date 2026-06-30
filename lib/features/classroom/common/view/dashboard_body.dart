import 'package:flutter/cupertino.dart';
import 'package:front_mobile/features/classroom/common/view/widget/dashboard/assignment/assignment_card.dart';
import 'package:front_mobile/features/classroom/common/view/widget/dashboard/class_guide_card.dart';
import 'package:front_mobile/features/classroom/common/view/widget/dashboard/curriculum/curriculum_card.dart';
import 'package:front_mobile/features/classroom/common/view/widget/dashboard/learning_goal_card.dart';
import 'package:front_mobile/features/classroom/common/view/widget/dashboard/todo_list_card.dart';

import '../model/assignment_info_response.dart';
import '../model/class_main_state.dart';

class DashboardBody extends StatelessWidget {
  final UserType userType;
  final List<AssignmentInfoResponse> assignments;

  const DashboardBody({
    super.key,
    required this.userType,
    required this.assignments,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          /// 커리큘럼
          CurriculumCard(onPressed: () {}),
          const SizedBox(height: 8),

          /// 강의안내
          ClassGuideCard(onPressed: () {}),
          const SizedBox(height: 8),

          /// 학습 목표
          const LearningGoalCard(),
          const SizedBox(height: 8),

          /// 과제
          AssignmentCard(
            userType: userType,
            assignments: assignments,
            onMoreTap: () {},
          ),
          const SizedBox(height: 8),

          /// 투두 리스트
          const TodoListCard(),
        ],
      ),
    );
  }
}
