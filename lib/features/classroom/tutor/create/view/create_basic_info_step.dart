import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_mobile/common/theme.dart';

import '../../../../../common/widget/test_area.dart';
import '../../../../../common/widget/text_input.dart';
import '../model/classroom_create_state.dart';
import '../provider/classroom_create_provider.dart';

class CreateBasicInfoStep extends ConsumerWidget {
  final TextEditingController classNameController;
  final TextEditingController classDescriptionController;

  const CreateBasicInfoStep({
    super.key,
    required this.classNameController,
    required this.classDescriptionController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classroomCreateState = ref.watch(classroomCreateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///위쪽 설명 부분
        Text('1/4', style: TextTypes.caption1(color: Palette.primary)),
        const SizedBox(height: 4),
        Text('수업 기본 정보', style: TextTypes.title1B(color: Palette.textPrimary)),
        const SizedBox(height: 4),
        Text(
          '학생과 함께할 새로운 강의실을 만들어보세요.',
          style: TextTypes.title4M(color: Palette.textTertiary),
        ),

        const SizedBox(height: 20),

        ///강의실 이름
        TextInput(
          label: Text('강의실 이름'),
          hintText: '예) 주 2회 수능 영어 집중반',
          size: TextInputSize.medium,
          controller: classNameController,
          onChanged: (value) {
            ref.read(classroomCreateProvider.notifier).setTitle(value);
          },
          maxLength: 20,
          onClear: () {
            classNameController.clear();
            ref.read(classroomCreateProvider.notifier).setTitle('');
          },
        ),

        const SizedBox(height: 20),

        ///수업 방식
        Text('수업 방식', style: TextTypes.title4M(color: Palette.textSecondary)),

        SizedBox(height: 6),

        Row(
          children: [
            Expanded(
              child: _LessonType(
                title: '비대면',
                isSelected:
                    classroomCreateState.lessonType == LessonType.online,
                onTap: () {
                  ref
                      .read(classroomCreateProvider.notifier)
                      .setLessonType(LessonType.online);
                },
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: _LessonType(
                title: '대면',
                isSelected:
                    classroomCreateState.lessonType == LessonType.offline,
                onTap: () {
                  ref
                      .read(classroomCreateProvider.notifier)
                      .setLessonType(LessonType.offline);
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 20),

        ///강의 안내
        Text(
          '강의 안내 (선택)',
          style: TextTypes.title4M(color: Palette.textSecondary),
        ),
        SizedBox(height: 4),
        Text(
          '학생에게 보여지는 강의실 소개글입니다.',
          style: TextTypes.caption1(color: Palette.textTertiary),
        ),
        SizedBox(height: 8),
        TextArea(
          controller: classDescriptionController,
          hintText: '수업 진행 방식, 준비물, 지각 규정 등 미리 알아두면 좋을 내용을 자유롭게 적어주세요.',
          maxLength: 200,
          onChanged: (value) {
            ref.read(classroomCreateProvider.notifier).setDescription(value);
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class _LessonType extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _LessonType({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),

        decoration: BoxDecoration(
          color: isSelected ? Palette.primarySoft : Palette.bgSurface,

          border: Border.all(
            color: isSelected ? Palette.primary : Palette.borderDefault,
            width: isSelected ? 2 : 1,
          ),

          borderRadius: BorderRadius.circular(6),
        ),

        child: Center(
          child: Text(
            title,
            style: TextTypes.title4M(
              color: isSelected ? Palette.textPrimary : Palette.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
