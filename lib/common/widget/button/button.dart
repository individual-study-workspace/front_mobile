import 'package:flutter/material.dart';

import 'button_style.dart';

class PrimaryButton extends StatelessWidget {
  final String? content;
  final Widget Function(Color textColor)? contentBuilder;
  final VoidCallback? onPressed;
  final bool isEnabled;

  final ButtonSize size;
  final ButtonVariant variant;

  const PrimaryButton({
    super.key,
    this.content,
    this.contentBuilder,
    this.onPressed,
    this.isEnabled = true,
    this.size = ButtonSize.large,
    this.variant = ButtonVariant.brand,
  });

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyleUtil.primaryStyle(variant, isEnabled);

    final sizeData = ButtonStyleUtil.size(size);

    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style:
          ElevatedButton.styleFrom(
            disabledBackgroundColor: style.backgroundColor,
            minimumSize: Size.zero,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: sizeData.borderRadius),
            overlayColor: Colors.transparent,
            animationDuration: Duration.zero,
          ).copyWith(
            shadowColor: WidgetStatePropertyAll(Colors.transparent),
            surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
            elevation: WidgetStatePropertyAll(0),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed) && isEnabled) {
                return style.pressedColor;
              }
              return style.backgroundColor;
            }),
          ),
      child: contentBuilder != null
          ? Padding(
              padding: sizeData.builderPadding,
              child: contentBuilder!(style.textColor),
            )
          : Padding(
              padding: sizeData.padding,
              child: Text(content!, style: sizeData.textStyle(style.textColor)),
            ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String? content;
  final Widget Function(Color textColor)? contentBuilder;
  final VoidCallback? onPressed;
  final bool isEnabled;

  final ButtonSize size;
  final ButtonVariant variant;

  const SecondaryButton({
    super.key,
    this.content,
    this.contentBuilder,
    this.onPressed,
    this.isEnabled = true,
    this.size = ButtonSize.large,
    this.variant = ButtonVariant.brand,
  });

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyleUtil.secondaryStyle(variant, isEnabled);

    final sizeData = ButtonStyleUtil.size(size);
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style:
          ElevatedButton.styleFrom(
            disabledBackgroundColor: style.backgroundColor,
            minimumSize: Size.zero,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: sizeData.borderRadius),
            overlayColor: Colors.transparent,
            animationDuration: Duration.zero,
          ).copyWith(
            shadowColor: WidgetStatePropertyAll(Colors.transparent),
            surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
            elevation: WidgetStatePropertyAll(0),
            side: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed) && isEnabled) {
                return BorderSide(color: style.pressedBorderColor!, width: 1);
              }

              return BorderSide(color: style.borderColor!, width: 1);
            }),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed) && isEnabled) {
                return style.pressedColor;
              }
              return style.backgroundColor;
            }),
          ),
      child: contentBuilder != null
          ? Padding(
              padding: sizeData.builderPadding,
              child: contentBuilder!(style.textColor),
            )
          : Padding(
              padding: sizeData.padding,
              child: Text(content!, style: sizeData.textStyle(style.textColor)),
            ),
    );
  }
}

class TertiaryButton extends StatelessWidget {
  final String? content;
  final Widget Function(Color textColor)? contentBuilder;
  final VoidCallback? onPressed;
  final bool isEnabled;

  final ButtonSize size;
  final ButtonVariant variant;

  const TertiaryButton({
    super.key,
    this.content,
    this.contentBuilder,
    this.onPressed,
    this.isEnabled = true,
    this.size = ButtonSize.large,
    this.variant = ButtonVariant.brand,
  });

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyleUtil.tertiaryStyle(variant, isEnabled);

    final sizeData = ButtonStyleUtil.size(size);
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style:
          ElevatedButton.styleFrom(
            disabledBackgroundColor: style.backgroundColor,
            minimumSize: Size.zero,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: sizeData.borderRadius),
            overlayColor: Colors.transparent,
            animationDuration: Duration.zero,
          ).copyWith(
            shadowColor: WidgetStatePropertyAll(Colors.transparent),
            surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
            elevation: WidgetStatePropertyAll(0),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed) && isEnabled) {
                return style.pressedColor;
              }
              return style.backgroundColor;
            }),
          ),
      child: contentBuilder != null
          ? Padding(
              padding: sizeData.builderPadding,
              child: contentBuilder!(style.textColor),
            )
          : Padding(
              padding: sizeData.padding,
              child: Text(content!, style: sizeData.textStyle(style.textColor)),
            ),
    );
  }
}
