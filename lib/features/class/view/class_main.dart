import 'package:flutter/material.dart';

import '../../../common/widget/main_app_bar.dart';

class ClassMainPage extends StatelessWidget {
  const ClassMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MainAppBar(title: '강의실'),
            Text('수업 메인 화면'),
          ],
        ),
      ),
    );
  }
}
