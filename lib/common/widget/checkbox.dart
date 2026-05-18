import 'package:flutter/material.dart';
import 'package:front_mobile/common/theme.dart';

enum LargeCheckBoxState { defaultState, checked, disabled }

class LargeCheckBox extends StatelessWidget {
  final LargeCheckBoxState state;

  final VoidCallback? onTap;

  const LargeCheckBox({super.key, required this.state, this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool isChecked = state == LargeCheckBoxState.checked;
    final bool isDisabled = state == LargeCheckBoxState.disabled;

    final Color backgroundColor = switch (state) {
      LargeCheckBoxState.defaultState => Palette.gray0,
      LargeCheckBoxState.checked => Palette.violet500,
      LargeCheckBoxState.disabled => Palette.gray20,
    };

    final Color borderColor = switch (state) {
      LargeCheckBoxState.defaultState => Palette.gray60,
      LargeCheckBoxState.checked => Colors.transparent,
      LargeCheckBoxState.disabled => Palette.gray30,
    };

    final Color checkColor = switch (state) {
      LargeCheckBoxState.defaultState => Colors.transparent,
      LargeCheckBoxState.checked => Palette.bgBase,
      LargeCheckBoxState.disabled => Colors.transparent,
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
        child: isChecked || isDisabled
            ? Icon(Icons.check, size: 16, color: checkColor)
            : null,
      ),
    );
  }
}
