import 'package:flutter/cupertino.dart';
import 'package:front_mobile/features/classroom/common/model/todo_list_item.dart';
import 'package:front_mobile/features/classroom/common/view/widget/dashboard/assignment/assignment_card.dart';
import 'package:front_mobile/features/classroom/common/view/widget/dashboard/class_guide/class_guide_card.dart';
import 'package:front_mobile/features/classroom/common/view/widget/dashboard/learning_goal/learning_goal_card.dart';
import 'package:front_mobile/features/classroom/common/view/widget/dashboard/todo_list/todo_list_card.dart';

import '../../../model/assignment_info_response.dart';
import '../../../model/class_main_state.dart';
import '../../../model/curriculum_response.dart';
import 'curriculum/curriculum_card.dart';

class DashboardBody extends StatelessWidget {
  final UserType userType;
  final List<AssignmentInfoResponse>? assignments;
  final List<TodoListItemModel>? todoList;
  final CurriculumResponse? curriculum;
  final String? classGuide;
  final String? learningGoal;

  const DashboardBody({
    super.key,
    required this.userType,
    required this.assignments,
    required this.todoList,
    required this.curriculum,
    this.classGuide,
    this.learningGoal,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          /// 커리큘럼
          CurriculumCard(userType: userType, curriculum: curriculum),
          const SizedBox(height: 8),

          /// 강의안내
          ClassGuideCard(userType: userType, classGuide: classGuide),
          const SizedBox(height: 8),

          /// 학습 목표
          LearningGoalCard(userType: userType, learningGoal: learningGoal),
          const SizedBox(height: 8),

          /// 과제
          AssignmentCard(
            userType: userType,
            assignments: assignments,
            onMoreTap: () {},
          ),
          const SizedBox(height: 8),

          /// 투두 리스트
          TodoListCard(userType: userType, todoList: todoList),
        ],
      ),
    );
  }
}
