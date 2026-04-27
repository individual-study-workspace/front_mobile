import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/widget/theme.dart';

class CommonSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const CommonSearchBar({
    super.key,
    this.controller,
    this.hintText = '튜터 또는 과목 검색...',
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Palette.primarySoft,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/search_outline.svg',
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(color: Palette.textSecondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
