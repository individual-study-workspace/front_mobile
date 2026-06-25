import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/route_path.dart';
import '../../../common/widget/custom_navigation_bar.dart';

class MainPage extends StatelessWidget {
  final Widget child;

  const MainPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _getCurrentIndex(context),
        onTap: (index) {
          ///home 제외하고 나중에 수정 필요
          switch (index) {
            case 0:
              context.go(RoutePath.home);
              break;
            case 1:
              context.go(RoutePath.classroomCreate);
              break;
            case 2:
              context.go(RoutePath.chatList);
              break;
            case 3:
              context.go(RoutePath.test);
              break;
            case 4:
              context.go(RoutePath.test);
              break;
          }
        },
      ),
    );
  }
}

int _getCurrentIndex(BuildContext context) {
  final location = GoRouterState.of(context).uri.path;

  ///home 제외하고 나중에 수정 필요
  if (location.startsWith(RoutePath.home)) return 0;
  if (location.startsWith(RoutePath.classroomCreate)) return 1;
  if (location.startsWith(RoutePath.chatList)) return 2;
  if (location.startsWith(RoutePath.test)) return 3;
  if (location.startsWith(RoutePath.test)) return 4;

  return 0;
}
