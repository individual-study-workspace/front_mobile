import 'package:flutter/cupertino.dart';

import '../../../../../../../common/theme.dart';
import '../../../../../../../common/widget/checkbox.dart';
import '../../../../../tutor/create/model/classroom_create_state.dart';
import '../../../../model/todo_list_item.dart';

class TodoListItem extends StatelessWidget {
  final TodoListItemModel todo;
  final VoidCallback? onCheckTap;

  const TodoListItem({super.key, required this.todo, this.onCheckTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MediumCheckBox(isChecked: todo.isChecked, onTap: onCheckTap),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: TextTypes.body1M(color: Palette.textPrimary),
              ),
              if (todo.dueDate != null) ...[
                const SizedBox(height: 4),
                Text(
                  formatDateWithWeek(todo.dueDate!),
                  style: TextTypes.caption1(color: Palette.statusDanger),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
