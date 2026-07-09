import 'package:flutter/material.dart';

import '../theme.dart';

class CommonBadge extends StatelessWidget {
  const CommonBadge({
    super.key,
    required this.text,
    this.textStyle,
    this.backgroundColor = Palette.violet50,
  });

  final String text;
  final TextStyle? textStyle;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: Text(
        text,
        style: textStyle ?? TextTypes.caption1(color: Palette.violet500),
      ),
    );
  }
}
