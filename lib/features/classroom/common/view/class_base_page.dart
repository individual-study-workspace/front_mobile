import 'package:flutter/cupertino.dart';

import 'class_main_page.dart';
import 'empty_class_page.dart';

class ClassBasePage extends StatelessWidget {
  const ClassBasePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO API 연동 후 Provider 상태로 변경
    const hasClassroom = true;

    if (hasClassroom) {
      return const ClassMainPage();
    }

    return const EmptyClassPage();
  }
}
