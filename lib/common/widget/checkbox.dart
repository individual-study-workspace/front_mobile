import 'package:flutter/material.dart';
import 'package:front_mobile/common/theme.dart';

class LargeCheckBox extends StatelessWidget {
  final bool isChecked;
  final bool isDisabled;

  final VoidCallback? onTap;

  const LargeCheckBox({
    super.key,
    required this.isChecked,
    this.isDisabled = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = switch ((isChecked, isDisabled)) {
      (_, true) when isChecked => Palette.gray40,
      (_, true) => Palette.gray20,
      (true, false) => Palette.violet500,
      (false, false) => Palette.gray0,
    };

    final Color borderColor = switch ((isChecked, isDisabled)) {
      (_, true) when isChecked => Colors.transparent,
      (_, true) => Palette.gray30,
      (true, false) => Colors.transparent,
      (false, false) => Palette.gray60,
    };

    final Color checkColor = switch ((isChecked, isDisabled)) {
      (_, true) when isChecked => Palette.gray0,
      (_, true) => Colors.transparent,
      (true, false) => Palette.bgBase,
      (false, false) => Colors.transparent,
    };

    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
          border: isChecked ? null : Border.all(color: borderColor, width: 1),
        ),
        alignment: Alignment.center,
        child: isChecked
            ? Icon(Icons.check, size: 16, color: checkColor)
            : null,
      ),
    );
  }
}

class MediumCheckBox extends StatelessWidget {
  final bool isChecked;
  final bool isDisabled;

  final VoidCallback? onTap;

  const MediumCheckBox({
    super.key,
    required this.isChecked,
    this.isDisabled = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = switch ((isChecked, isDisabled)) {
      (_, true) when isChecked => Palette.gray40,
      (_, true) => Palette.gray20,
      (true, false) => Palette.violet500,
      (false, false) => Palette.gray0,
    };

    final Color borderColor = switch ((isChecked, isDisabled)) {
      (_, true) when isChecked => Colors.transparent,
      (_, true) => Palette.gray30,
      (true, false) => Colors.transparent,
      (false, false) => Palette.gray60,
    };

    final Color checkColor = switch ((isChecked, isDisabled)) {
      (_, true) when isChecked => Palette.gray0,
      (_, true) => Colors.transparent,
      (true, false) => Palette.bgBase,
      (false, false) => Colors.transparent,
    };

    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
          border: isChecked ? null : Border.all(color: borderColor, width: 1),
        ),
        alignment: Alignment.center,
        child: isChecked
            ? Icon(Icons.check, size: 16, color: checkColor)
            : null,
      ),
    );
  }
}
