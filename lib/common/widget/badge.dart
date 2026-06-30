import 'package:flutter/material.dart';
import 'package:front_mobile/common/theme.dart';

class Badge extends StatelessWidget {
  const Badge({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.violet50,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: Text(text, style: TextTypes.caption2(color: Palette.violet500)),
    );
  }
}
