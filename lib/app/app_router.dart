import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_mobile/app/route_path.dart';
import 'package:front_mobile/features/auth/view/profile_setup_page.dart';
import 'package:front_mobile/features/auth/view/terms_agreement_page.dart';
import 'package:front_mobile/features/chat/view/chat_room_page.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    ///일단 이렇게 진행 이후에 home으로 변경
    initialLocation: RoutePath.chatRoom,
    routes: [
      GoRoute(
        path: RoutePath.termsAgreement,
        builder: (_, __) => const TermsAgreementPage(),
      ),
      GoRoute(
        path: RoutePath.profileSetup,
        builder: (_, __) => const ProfileSetupPage(),
      ),
      // 채팅룸 개발을 위해 기본 페이지를 채팅룸으로 임시 변경
      GoRoute(
        path: RoutePath.chatRoom,
        builder: (_, __) => const ChatRoomPage(),
      ),
    ],
  );
});
