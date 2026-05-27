import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';

enum LargeInputState { normal, focused, error, disabled, readOnly }

class LargeSearchInputField extends StatelessWidget {
  final String label;
  final String? description;
  final String hintText;
  final String? helperText;

  final TextEditingController? controller;
  final FocusNode? focusNode;

  final LargeInputState state;

  final VoidCallback? onClear;
  final ValueChanged<String>? onChanged;

  final String? leftIconPath;

  const LargeSearchInputField({
    super.key,
    this.label = '레이블',
    this.description,
    this.hintText = '내용을 입력하세요',
    this.helperText,
    this.controller,
    this.focusNode,
    this.state = LargeInputState.normal,
    this.onClear,
    this.onChanged,
    this.leftIconPath,
  });

  bool get _isDisabled => state == LargeInputState.disabled;

  bool get _isReadOnly => state == LargeInputState.readOnly;

  @override
  Widget build(BuildContext context) {
    final borderColor = switch (state) {
      LargeInputState.normal => Palette.borderDefault,
      LargeInputState.focused => Palette.blue500,
      LargeInputState.error => Palette.statusDanger,
      LargeInputState.disabled => Palette.borderLight,
      LargeInputState.readOnly => Palette.borderDefault,
    };

    final helperColor = switch (state) {
      LargeInputState.normal => Palette.gray40,
      LargeInputState.focused => Palette.blue600,
      LargeInputState.error => Palette.red600,
      LargeInputState.disabled => Palette.gray0,
      LargeInputState.readOnly => Palette.gray0,
    };

    final backgroundColor = switch (state) {
      LargeInputState.normal => Palette.bgSurface,
      LargeInputState.focused => Palette.bgSurface,
      LargeInputState.error => Palette.statusDangerBg,
      LargeInputState.disabled => Palette.bgBase,
      LargeInputState.readOnly => Palette.bgBase,
    };

    final textColor = switch (state) {
      LargeInputState.normal => Palette.textSecondary,
      LargeInputState.focused => Palette.textPrimary,
      LargeInputState.error => Palette.textSecondary,
      LargeInputState.disabled => Palette.textDisabled,
      LargeInputState.readOnly => Palette.textSecondary,
    };

    final hintColor = switch (state) {
      LargeInputState.normal => Palette.textSecondary,
      LargeInputState.focused => Palette.textPrimary,
      LargeInputState.error => Palette.textSecondary,
      LargeInputState.disabled => Palette.textDisabled,
      LargeInputState.readOnly => Palette.textSecondary,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Row(
            children: [
              Icon(Icons.info_outline, size: 16, color: Palette.gray60),
              const SizedBox(width: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Palette.gray60,
                ),
              ),
            ],
          ),
        ],

        const SizedBox(height: 4),

        if (description != null) ...[
          const SizedBox(height: 4),
          Text(
            description!,
            style: const TextStyle(fontSize: 12, color: Palette.gray40),
          ),
        ],

        const SizedBox(height: 8),

        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              if (leftIconPath != null) ...[
                SvgPicture.asset(leftIconPath!, width: 20, height: 20),
                const SizedBox(width: 10),
              ],

              Expanded(
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  onChanged: _isDisabled ? null : onChanged,
                  enabled: !_isDisabled,
                  readOnly: _isReadOnly,
                  style: TextStyle(fontSize: 16, color: textColor),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isCollapsed: true,
                    hintText: hintText,
                    hintStyle: TextStyle(fontSize: 16, color: hintColor),
                  ),
                ),
              ),

              if ((controller?.text.isNotEmpty ?? false))
                GestureDetector(
                  onTap: _isDisabled ? null : onClear,
                  child: SvgPicture.asset(
                    'assets/icons/xbox_filled.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
            ],
          ),
        ),

        if (helperText != null) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              if (state == LargeInputState.error ||
                  state == LargeInputState.focused) ...[
                if (state == LargeInputState.error) ...[
                  SvgPicture.asset(
                    'assets/icons/info_filled.svg',
                    width: 16,
                    height: 16,
                    color: helperColor,
                  ),
                ],
                if (state == LargeInputState.focused) ...[
                  SvgPicture.asset(
                    'assets/icons/xbox_filled.svg',
                    width: 16,
                    height: 16,
                    color: helperColor,
                  ),
                ],
              ],

              const SizedBox(width: 4),
              Text(
                helperText!,
                style: TextStyle(fontSize: 12, color: helperColor),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
