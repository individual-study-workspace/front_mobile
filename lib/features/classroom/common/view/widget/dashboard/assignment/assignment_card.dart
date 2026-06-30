import 'package:flutter/cupertino.dart';

import '../../../../../../../common/theme.dart';
import '../../../../model/assignment_info_response.dart';
import '../../../../model/class_main_state.dart';
import 'assignment_card_header.dart';
import 'assignment_item.dart';
import 'empty_assignment.dart';

class AssignmentCard extends StatelessWidget {
  final UserType userType;
  final List<AssignmentInfoResponse> assignments;
  final VoidCallback? onMoreTap;

  const AssignmentCard({
    super.key,
    required this.userType,
    required this.assignments,
    this.onMoreTap,
  });

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
          AssignmentCardHeader(
            title: userType == UserType.tutor ? '미채점 과제' : '미제출 과제',
            count: assignments.length,
            onMoreTap: onMoreTap,
          ),
          const SizedBox(height: 8),

          if (assignments.isEmpty)
            EmptyAssignment(userType: userType)
          else
            Column(
              children: List.generate(
                assignments.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    bottom: index == assignments.length - 1 ? 0 : 8,
                  ),
                  child: AssignmentItem(
                    userType: userType,
                    assignment: assignments[index], // 하나씩 전달
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
