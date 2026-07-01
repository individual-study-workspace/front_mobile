import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_mobile/app/route_path.dart';
import 'package:front_mobile/features/auth/view/profile_setup_page.dart';
import 'package:front_mobile/features/auth/view/terms_agreement_page.dart';
import 'package:front_mobile/features/resources/view/resources_page.dart';
import 'package:front_mobile/features/test/view/test_page.dart';
import 'package:go_router/go_router.dart';

import '../features/chat/view/chat_list_page.dart';
import '../features/classroom/tutor/create/view/classroom_create_page.dart';
import '../features/home/view/home_page.dart';
import '../features/main/view/main_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    ///일단 이렇게 진행 이후에 home으로 변경
    initialLocation: RoutePath.resources,
    routes: [
      // 인증 영역
      GoRoute(
        path: RoutePath.termsAgreement,
        builder: (_, __) => const TermsAgreementPage(),
      ),
      GoRoute(
        path: RoutePath.profileSetup,
        builder: (_, __) => const ProfileSetupPage(),
      ),

      // 메인 영역
      ShellRoute(
        builder: (context, state, child) {
          return MainPage(child: child);
        },
        routes: [
          GoRoute(path: RoutePath.home, builder: (_, __) => const HomePage()),
          GoRoute(
            path: RoutePath.classroomCreate,
            builder: (_, __) => const ClassroomCreatePage(),
          ),
          GoRoute(
            path: RoutePath.chatList,
            builder: (_, __) => const ChatListPage(),
          ),
          GoRoute(
            path: RoutePath.resources,
            builder: (_, __) => const ResourcesPage(),
          ),
          GoRoute(path: RoutePath.test, builder: (_, __) => const TestPage()),
        ],
      ),
    ],
  );
});
