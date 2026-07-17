import 'package:flutter/material.dart';

import '../../theme.dart';

enum ButtonSize { large, medium, small }

enum ButtonVariant { brand, neutral, destructive }

class ButtonStyleData {
  final Color backgroundColor;
  final Color textColor;
  final Color pressedColor;
  final Color? borderColor;
  final Color? pressedBorderColor;

  const ButtonStyleData({
    required this.backgroundColor,
    required this.textColor,
    required this.pressedColor,
    this.borderColor,
    this.pressedBorderColor,
  });
}

class ButtonSizeData {
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final EdgeInsets builderPadding;
  final TextStyle Function(Color color) textStyle;

  const ButtonSizeData({
    required this.borderRadius,
    required this.padding,
    required this.builderPadding,
    required this.textStyle,
  });
}

class ButtonStyleUtil {
  static ButtonStyleData primaryStyle(ButtonVariant variant, bool isEnabled) {
    switch (variant) {
      case ButtonVariant.brand:
        return ButtonStyleData(
          backgroundColor: isEnabled
              ? Palette.primary
              : Palette.primary.withValues(alpha: 0.3),
          textColor: Palette.textPrimaryInverse,
          pressedColor: Palette.primaryVariant,
        );

      case ButtonVariant.neutral:
        return ButtonStyleData(
          backgroundColor: isEnabled
              ? Palette.bgSurface
              : Palette.bgSurface.withValues(alpha: 0.3),
          textColor: isEnabled ? Palette.textPrimary : Palette.textDisabled,
          pressedColor: Palette.bgBase,
        );

      case ButtonVariant.destructive:
        return ButtonStyleData(
          backgroundColor: isEnabled
              ? Palette.statusDanger
              : Palette.statusDanger.withValues(alpha: 0.3),
          textColor: isEnabled
              ? Palette.textPrimaryInverse
              : Palette.textPrimaryInverse.withValues(alpha: 0.3),
          pressedColor: Palette.red600,
        );
    }
  }

  static ButtonStyleData secondaryStyle(ButtonVariant variant, bool isEnabled) {
    switch (variant) {
      case ButtonVariant.brand:
        return ButtonStyleData(
          backgroundColor: Colors.transparent,
          textColor: isEnabled
              ? Palette.textPrimary
              : Palette.textPrimary.withValues(alpha: 0.3),
          pressedColor: Palette.primarySoft,
          borderColor: isEnabled
              ? Palette.primary
              : Palette.primary.withValues(alpha: 0.3),
          pressedBorderColor: Palette.primary,
        );

      case ButtonVariant.neutral:
        return ButtonStyleData(
          backgroundColor: Colors.transparent,
          textColor: isEnabled
              ? Palette.textPrimary
              : Palette.textPrimary.withValues(alpha: 0.3),
          pressedColor: Palette.bgBase,
          borderColor: isEnabled
              ? Palette.borderDefault
              : Palette.borderDefault.withValues(alpha: 0.3),
          pressedBorderColor: Palette.borderDefault,
        );

      case ButtonVariant.destructive:
        return ButtonStyleData(
          backgroundColor: Colors.transparent,
          textColor: isEnabled
              ? Palette.textPrimary
              : Palette.textPrimary.withValues(alpha: 0.3),
          pressedColor: Palette.statusDangerBg,
          borderColor: isEnabled
              ? Palette.statusDanger
              : Palette.statusDanger.withValues(alpha: 0.3),
          pressedBorderColor: Palette.statusDanger,
        );
    }
  }

  static ButtonStyleData tertiaryStyle(ButtonVariant variant, bool isEnabled) {
    switch (variant) {
      case ButtonVariant.brand:
        return ButtonStyleData(
          backgroundColor: Colors.transparent,
          textColor: isEnabled
              ? Palette.primary
              : Palette.primary.withValues(alpha: 0.3),
          pressedColor: Palette.primarySoft,
        );

      case ButtonVariant.neutral:
        return ButtonStyleData(
          backgroundColor: Colors.transparent,
          textColor: isEnabled
              ? Palette.textSecondary
              : Palette.textSecondary.withValues(alpha: 0.3),
          pressedColor: Palette.bgBase,
        );

      case ButtonVariant.destructive:
        return ButtonStyleData(
          backgroundColor: Colors.transparent,
          textColor: isEnabled
              ? Palette.statusDanger
              : Palette.statusDanger.withValues(alpha: 0.3),
          pressedColor: Palette.statusDangerBg,
        );
    }
  }

  static ButtonSizeData size(ButtonSize size) {
    switch (size) {
      case ButtonSize.large:
        return ButtonSizeData(
          borderRadius: BorderRadius.circular(8),
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 24),
          builderPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ),
          textStyle: (color) => TextTypes.title3SB(color: color),
        );

      case ButtonSize.medium:
        return ButtonSizeData(
          borderRadius: BorderRadius.circular(6),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          builderPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          textStyle: (color) => TextTypes.title4M(color: color),
        );

      case ButtonSize.small:
        return ButtonSizeData(
          borderRadius: BorderRadius.circular(4),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          builderPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          textStyle: (color) => TextTypes.body2M(color: color),
        );
    }
  }
}
