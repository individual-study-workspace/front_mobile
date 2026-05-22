import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme.dart';

class MainAppBar extends StatelessWidget {
  final String? title;
  final Widget? left;
  final List<Widget>? actions;

  const MainAppBar({super.key, this.title, this.left, this.actions});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,

      child: Container(
        height: 56,
        color: Palette.bgSurface,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),

        child: Row(
          children: [
            /// 왼쪽 영역
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,

                child:
                    left ??
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 12,
                      ),

                      child: Text(title ?? '', style: TextTypes.h3()),
                    ),
              ),
            ),

            /// 오른쪽 액션
            Row(
              mainAxisSize: MainAxisSize.min,
              children: actions ?? _defaultActions(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _defaultActions() {
    return [
      IconButton(
        onPressed: () {}, //이후에 세팅
        icon: SvgPicture.asset(
          'assets/icons/notification_outline.svg',
          width: 24,
          height: 24,
        ),
      ),

      IconButton(
        onPressed: () {}, //이후에 세팅
        icon: SvgPicture.asset(
          'assets/icons/setting_outline.svg',
          width: 24,
          height: 24,
        ),
      ),
    ];
  }
}
