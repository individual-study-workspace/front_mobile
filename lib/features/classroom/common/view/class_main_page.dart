import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/common/widget/main_app_bar.dart';
import 'package:front_mobile/common/widget/tab_menu.dart';

import '../provider/class_main_provider.dart';
import 'dashboard_body.dart';

class ClassMainPage extends ConsumerStatefulWidget {
  const ClassMainPage({super.key});

  @override
  ConsumerState<ClassMainPage> createState() => _ClassMainPage();
}

class _ClassMainPage extends ConsumerState<ClassMainPage> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(classMainProvider);
    final provider = ref.read(classMainProvider.notifier);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MainAppBar(title: '드롭다운'),
      ),
      body: Container(
        color: Palette.bgBase,
        child: Column(
          children: [
            TabMenu(
              tabs: const ['대시보드', '커리큘럼', '과제함'],
              selectedIndex: state.selectedTabIndex,
              onTap: (index) {
                provider.changeTab(index);

                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.ease,
                );
              },
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: provider.changeTab,
                children: const [
                  DashboardBody(),
                  SizedBox.shrink(),
                  SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
