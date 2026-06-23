import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/common/widget/common_search_bar.dart';
import 'package:front_mobile/common/widget/main_app_bar.dart';
import 'package:front_mobile/common/widget/text_input.dart';
import 'package:front_mobile/features/chat/view/chat_list_card.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(52),
        child: MainAppBar(title: '채팅'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // 검색 창
            CommonSearchBar(hintText: '튜터 또는 강의실명을 검색해보세요'),
            SizedBox(height: 16),
            // api 연동 시 map으로 반복문 돌려서 뿌림
            ChatListCard(),
          ],
        ),
      ),
    );
  }
}
