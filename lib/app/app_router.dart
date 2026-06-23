import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_mobile/app/route_path.dart';
import 'package:front_mobile/features/auth/view/profile_setup_page.dart';
import 'package:front_mobile/features/auth/view/terms_agreement_page.dart';
import 'package:go_router/go_router.dart';
import 'package:front_mobile/features/chat/view/chat_list_page.dart';
import '../features/classroom/tutor/create/view/classroom_create_page.dart';
import '../features/home/view/home_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    ///일단 이렇게 진행 이후에 home으로 변경
    initialLocation: RoutePath.termsAgreement,
    routes: [
      GoRoute(path: RoutePath.home, builder: (_, __) => const HomePage()),
      GoRoute(
        path: RoutePath.termsAgreement,
        builder: (_, __) => const TermsAgreementPage(),
      ),
      GoRoute(
        path: RoutePath.profileSetup,
        builder: (_, __) => const ProfileSetupPage(),
      ),
      GoRoute(
        path: RoutePath.classroomCreate,
        builder: (_, __) => const ClassroomCreatePage(),
      ),
      GoRoute(
        path: RoutePath.chatList,
        builder: (_, __) => const ChatListPage(),
      ),
    ],
  );
});
