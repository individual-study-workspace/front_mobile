import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme.dart';

class SubAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackTap;

  const SubAppBar({super.key, required this.title, this.onBackTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,

      leading:IconButton(
        onPressed:
        onBackTap ??
                () {
              Navigator.pop(context);
            },

        icon: SvgPicture.asset(
          'assets/icons/left_outline.svg',
          width: 24,
          height: 24,
        ),
      ),

      title: Text(title, style: TextTypes.title3()),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
