import 'package:flutter/material.dart';
import 'package:front_mobile/common/widget/theme.dart';

class PrimaryLargeButton extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const PrimaryLargeButton({
    super.key,
    required this.content,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isEnabled ? Palette.primary : Palette.bgBase;
    final Color textColor = isEnabled ? Palette.gray0 : Palette.textDisabled;

    return ElevatedButton(
      onPressed: () {
        if (isEnabled && onPressed != null) {
          onPressed!();
        }
      },
      style:
          ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            minimumSize: Size.zero,
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (isEnabled && states.contains(WidgetState.pressed)) {
                return Palette.violet700;
              }
              return Colors.transparent;
            }),
            elevation: WidgetStateProperty.resolveWith<double>((states) {
              return 0;
            }),
          ),
      child: Text(content, style: TextStyle(color: textColor)),
    );
  }
}

class PrimaryMediumButton extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const PrimaryMediumButton({
    super.key,
    required this.content,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isEnabled ? Palette.primary : Palette.bgBase;
    final Color textColor = isEnabled ? Palette.gray0 : Palette.textDisabled;

    return ElevatedButton(
      onPressed: () {
        if (isEnabled && onPressed != null) {
          onPressed!();
        }
      },
      style:
          ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(vertical: 9.5, horizontal: 20),
            minimumSize: Size.zero,
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (isEnabled && states.contains(WidgetState.pressed)) {
                return Palette.violet700;
              }
              return Colors.transparent;
            }),
            elevation: WidgetStateProperty.resolveWith<double>((states) {
              return 0;
            }),
          ),
      child: Text(content, style: TextStyle(color: textColor)),
    );
  }
}

class PrimarySmallButton extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const PrimarySmallButton({
    super.key,
    required this.content,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isEnabled ? Palette.primary : Palette.bgBase;
    final Color textColor = isEnabled ? Palette.gray0 : Palette.textDisabled;

    return ElevatedButton(
      onPressed: () {
        if (isEnabled && onPressed != null) {
          onPressed!();
        }
      },
      style:
          ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5.5, horizontal: 16),
            minimumSize: Size.zero,
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (isEnabled && states.contains(WidgetState.pressed)) {
                return Palette.violet700;
              }
              return Colors.transparent;
            }),
            elevation: WidgetStateProperty.resolveWith<double>((states) {
              return 0;
            }),
          ),
      child: Text(content, style: TextStyle(color: textColor)),
    );
  }
}

class SecondaryLargeButton extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const SecondaryLargeButton({
    super.key,
    required this.content,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = isEnabled
        ? Palette.violet500
        : Palette.borderDefault;
    final Color backgroundColor = isEnabled ? Palette.gray0 : Palette.bgBase;
    final Color textColor = isEnabled ? Palette.gray90 : Palette.textDisabled;

    return ElevatedButton(
      onPressed: () {
        if (isEnabled && onPressed != null) {
          onPressed!();
        }
      },
      style:
          ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            minimumSize: Size.zero,
            side: BorderSide(color: borderColor, width: 1),
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (isEnabled && states.contains(WidgetState.pressed)) {
                return Palette.violet50;
              }
              return Colors.transparent;
            }),
            elevation: WidgetStateProperty.resolveWith<double>((states) {
              return 0;
            }),
          ),
      child: Text(content, style: TextStyle(color: textColor)),
    );
  }
}

class SecondaryMediumButton extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const SecondaryMediumButton({
    super.key,
    required this.content,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = isEnabled
        ? Palette.violet500
        : Palette.borderDefault;
    final Color backgroundColor = isEnabled ? Palette.gray0 : Palette.bgBase;
    final Color textColor = isEnabled ? Palette.gray90 : Palette.textDisabled;

    return ElevatedButton(
      onPressed: () {
        if (isEnabled && onPressed != null) {
          onPressed!();
        }
      },
      style:
          ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(vertical: 9.5, horizontal: 20),
            minimumSize: Size.zero,
            side: BorderSide(color: borderColor, width: 1),
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (isEnabled && states.contains(WidgetState.pressed)) {
                return Palette.violet50;
              }
              return Colors.transparent;
            }),
            elevation: WidgetStateProperty.resolveWith<double>((states) {
              return 0;
            }),
          ),
      child: Text(content, style: TextStyle(color: textColor)),
    );
  }
}

class SecondarySmallButton extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const SecondarySmallButton({
    super.key,
    required this.content,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = isEnabled
        ? Palette.violet500
        : Palette.borderDefault;
    final Color backgroundColor = isEnabled ? Palette.gray0 : Palette.bgBase;
    final Color textColor = isEnabled ? Palette.gray90 : Palette.textDisabled;

    return ElevatedButton(
      onPressed: () {
        if (isEnabled && onPressed != null) {
          onPressed!();
        }
      },
      style:
          ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5.5, horizontal: 16),
            minimumSize: Size.zero,
            side: BorderSide(color: borderColor, width: 1),
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (isEnabled && states.contains(WidgetState.pressed)) {
                return Palette.violet50;
              }
              return Colors.transparent;
            }),
            elevation: WidgetStateProperty.resolveWith<double>((states) {
              return 0;
            }),
          ),
      child: Text(content, style: TextStyle(color: textColor)),
    );
  }
}

class TertiaryLargeButton extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const TertiaryLargeButton({
    super.key,
    required this.content,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isEnabled ? Palette.gray0 : Palette.gray0;
    final Color textColor = isEnabled ? Palette.gray90 : Palette.textDisabled;

    return ElevatedButton(
      onPressed: () {
        if (isEnabled && onPressed != null) {
          onPressed!();
        }
      },
      style:
          ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            minimumSize: Size.zero,
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (isEnabled && states.contains(WidgetState.pressed)) {
                return Palette.gray0;
              }
              return Colors.transparent;
            }),
            elevation: WidgetStateProperty.resolveWith<double>((states) {
              return 0;
            }),
          ),
      child: Text(content, style: TextStyle(color: textColor)),
    );
  }
}

class TertiaryMediumButton extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const TertiaryMediumButton({
    super.key,
    required this.content,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isEnabled ? Palette.gray0 : Palette.gray0;
    final Color textColor = isEnabled ? Palette.gray90 : Palette.textDisabled;

    return ElevatedButton(
      onPressed: () {
        if (isEnabled && onPressed != null) {
          onPressed!();
        }
      },
      style:
          ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(vertical: 9.5, horizontal: 20),
            minimumSize: Size.zero,
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (isEnabled && states.contains(WidgetState.pressed)) {
                return Palette.gray0;
              }
              return Colors.transparent;
            }),
            elevation: WidgetStateProperty.resolveWith<double>((states) {
              return 0;
            }),
          ),
      child: Text(content, style: TextStyle(color: textColor)),
    );
  }
}

class TertiarySmallButton extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const TertiarySmallButton({
    super.key,
    required this.content,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isEnabled ? Palette.gray0 : Palette.gray0;
    final Color textColor = isEnabled ? Palette.gray90 : Palette.textDisabled;

    return ElevatedButton(
      onPressed: () {
        if (isEnabled && onPressed != null) {
          onPressed!();
        }
      },
      style:
          ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5.5, horizontal: 16),
            minimumSize: Size.zero,
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (isEnabled && states.contains(WidgetState.pressed)) {
                return Palette.gray0;
              }
              return Colors.transparent;
            }),
            elevation: WidgetStateProperty.resolveWith<double>((states) {
              return 0;
            }),
          ),
      child: Text(content, style: TextStyle(color: textColor)),
    );
  }
}
