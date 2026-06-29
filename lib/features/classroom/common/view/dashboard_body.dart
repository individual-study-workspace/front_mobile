import 'package:flutter/material.dart';
import 'package:front_mobile/features/classroom/common/view/widget/assignment_card.dart';
import 'package:front_mobile/features/classroom/common/view/widget/class_guide_card.dart';
import 'package:front_mobile/features/classroom/common/view/widget/curriculum_card.dart';
import 'package:front_mobile/features/classroom/common/view/widget/learning_goal_card.dart';
import 'package:front_mobile/features/classroom/common/view/widget/todo_list_card.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          ///커리큘럼
          CurriculumCard(onPressed: () {}),
          SizedBox(height: 8),

          ///강의안내
          ClassGuideCard(onPressed: () {}),
          SizedBox(height: 8),

          ///학습 목표
          LearningGoalCard(),
          SizedBox(height: 8),

          ///미제출 과제
          AssignmentCard(),
          SizedBox(height: 8),

          ///투두 리스트
          TodoListCard(),
        ],
      ),
    );
  }
}
