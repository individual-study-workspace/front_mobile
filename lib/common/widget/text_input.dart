import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';

enum TextInputState { normal, focused, error, disabled, readOnly }

enum TextInputSize { large, medium, small }

class TextInput extends StatelessWidget {
  final Widget? label;
  final String? description;
  final String hintText;
  final String? helperText;

  final TextEditingController? controller;
  final FocusNode? focusNode;

  final TextInputState state;
  final TextInputSize size;

  final VoidCallback? onClear;
  final ValueChanged<String>? onChanged;

  final String? leftIconPath;

  const TextInput({
    super.key,
    this.label,
    this.description,
    this.hintText = '내용을 입력하세요',
    this.helperText,
    this.controller,
    this.focusNode,
    this.state = TextInputState.normal,
    this.size = TextInputSize.large,
    this.onClear,
    this.onChanged,
    this.leftIconPath,
  });

  bool get _isDisabled => state == TextInputState.disabled;

  bool get _isReadOnly => state == TextInputState.readOnly;

  @override
  Widget build(BuildContext context) {
    final borderColor = switch (state) {
      TextInputState.normal => Palette.borderDefault,
      TextInputState.focused => Palette.blue500,
      TextInputState.error => Palette.statusDanger,
      TextInputState.disabled => Palette.borderLight,
      TextInputState.readOnly => Palette.borderDefault,
    };

    final helperColor = switch (state) {
      TextInputState.normal => Palette.gray40,
      TextInputState.focused => Palette.blue600,
      TextInputState.error => Palette.red600,
      TextInputState.disabled => Palette.gray0,
      TextInputState.readOnly => Palette.gray0,
    };

    final backgroundColor = switch (state) {
      TextInputState.normal => Palette.bgSurface,
      TextInputState.focused => Palette.bgSurface,
      TextInputState.error => Palette.statusDangerBg,
      TextInputState.disabled => Palette.bgBase,
      TextInputState.readOnly => Palette.bgBase,
    };

    final double height = switch (size) {
      TextInputSize.large => 56,
      TextInputSize.medium => 48,
      TextInputSize.small => 40,
    };

    final double horizontalPadding = switch (size) {
      TextInputSize.large => 16,
      TextInputSize.medium => 14,
      TextInputSize.small => 10,
    };

    final double leftIconSize = switch (size) {
      TextInputSize.large => 24,
      TextInputSize.medium => 20,
      TextInputSize.small => 20,
    };

    final double clearIconSize = switch (size) {
      TextInputSize.large => 24,
      TextInputSize.medium => 20,
      TextInputSize.small => 20,
    };

    final textStyle = switch (size) {
      TextInputSize.large => TextTypes.body1R(color: Palette.textPrimary),
      TextInputSize.medium => TextTypes.body2R(color: Palette.textPrimary),
      TextInputSize.small => TextTypes.body2R(color: Palette.textPrimary),
    };

    final hintStyle = switch (size) {
      TextInputSize.large => TextTypes.body1R(color: Palette.textTertiary),
      TextInputSize.medium => TextTypes.body2R(color: Palette.textTertiary),
      TextInputSize.small => TextTypes.body2R(color: Palette.textTertiary),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[label!, const SizedBox(height: 8)],

        if (description != null) ...[
          const SizedBox(height: 4),
          Text(
            description!,
            style: const TextStyle(fontSize: 12, color: Palette.gray40),
          ),
          const SizedBox(height: 8),
        ],

        Container(
          height: height,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              if (leftIconPath != null) ...[
                SvgPicture.asset(
                  leftIconPath!,
                  width: leftIconSize,
                  height: leftIconSize,
                ),
                const SizedBox(width: 10),
              ],

              Expanded(
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  enabled: !_isDisabled,
                  readOnly: _isReadOnly,
                  onChanged: _isDisabled ? null : onChanged,
                  style: textStyle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isCollapsed: true,
                    hintText: hintText,
                    hintStyle: hintStyle,
                  ),
                ),
              ),

              if (controller?.text.isNotEmpty ?? false)
                GestureDetector(
                  onTap: _isDisabled ? null : onClear,
                  child: SvgPicture.asset(
                    'assets/icons/xbox_filled.svg',
                    width: clearIconSize,
                    height: clearIconSize,
                    colorFilter: ColorFilter.mode(
                      Palette.iconTertiary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
            ],
          ),
        ),

        if (helperText != null) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              if (state == TextInputState.error)
                SvgPicture.asset(
                  'assets/icons/info_filled.svg',
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(helperColor, BlendMode.srcIn),
                ),

              if (state == TextInputState.focused)
                SvgPicture.asset(
                  'assets/icons/check_filled.svg',
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(helperColor, BlendMode.srcIn),
                ),

              if (state == TextInputState.error ||
                  state == TextInputState.focused)
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
