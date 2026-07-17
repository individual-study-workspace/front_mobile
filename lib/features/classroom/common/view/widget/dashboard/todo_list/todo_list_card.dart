import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/widget/button/button_style.dart';
import 'package:front_mobile/features/classroom/common/model/todo_list_item.dart';
import 'package:front_mobile/features/classroom/common/view/widget/dashboard/todo_list/empty_todo_list.dart';
import 'package:front_mobile/features/classroom/common/view/widget/dashboard/todo_list/todo_list_item.dart';

import '../../../../../../../common/theme.dart';
import '../../../../../../../common/widget/button/button.dart';
import '../../../../model/class_main_state.dart';
import '../../../../provider/class_main_provider.dart';

class TodoListCard extends ConsumerWidget {
  final UserType userType;
  final List<TodoListItemModel>? todoList;
  final VoidCallback? onMoreTap;

  const TodoListCard({
    super.key,
    this.onMoreTap,
    required this.userType,
    this.todoList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListData = todoList ?? [];
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
          const SizedBox(height: 4),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '투두리스트',
                  style: TextTypes.title4M(color: Palette.textPrimary),
                ),
                const WidgetSpan(child: SizedBox(width: 8)),
                TextSpan(
                  text: todoListData.length.toString(),
                  style: TextTypes.title4M(color: Palette.primaryVariant),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          if (todoListData.isNotEmpty)
            Text(
              '마감 임박순으로 최대 2개 표시됩니다.',
              style: TextTypes.caption1(color: Palette.textSecondary),
            ),
          const SizedBox(height: 12),
          if (todoListData.isEmpty)
            EmptyTodoList(userType: userType)
          else ...[
            Column(
              children: List.generate(
                2,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    bottom: index == todoListData.length - 1 ? 0 : 8,
                  ),
                  child: TodoListItem(
                    todo: todoListData[index],
                    onCheckTap: () {
                      ref
                          .read(classMainProvider.notifier)
                          .setTodoChecked(index);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: TertiaryButton(
                variant: ButtonVariant.neutral,
                contentBuilder: (textColor) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '할 일 전체 보기',
                      style: TextTypes.title4M(color: textColor),
                    ),
                    const SizedBox(width: 2),
                    SvgPicture.asset(
                      'assets/icons/right_outline.svg',
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
