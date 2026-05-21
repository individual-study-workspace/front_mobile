import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme.dart';

enum ToastType { success, warning, error }

class CommonToast extends StatelessWidget {
  final String title;
  final String message;
  final ToastType type;
  final VoidCallback? onClose;

  const CommonToast({
    super.key,
    required this.title,
    required this.message,
    required this.type,
    this.onClose,
  });

  Color get _bgColor {
    switch (type) {
      case ToastType.success:
        return Palette.statusSuccess;
      case ToastType.warning:
        return Palette.statusDanger;
      case ToastType.error:
        return Palette.gray80;
    }
  }

  Color get _accentColor {
    switch (type) {
      case ToastType.error:
        return Palette.statusWarning;
      default:
        return Colors.transparent;
    }
  }

  String get _iconPath {
    switch (type) {
      case ToastType.success:
        return 'assets/icons/success_outline.svg';
      case ToastType.warning:
        return 'assets/icons/warning_outline.svg';
      case ToastType.error:
        return 'assets/icons/info_outline.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: _bgColor,
          borderRadius: BorderRadius.circular(8),

          ///error일 때만 왼쪽 바
          border: type == ToastType.error
              ? Border(left: BorderSide(color: _accentColor, width: 3))
              : null,
        ),
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  _iconPath,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Palette.gray0,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        message,
                        style: const TextStyle(
                          color: Palette.gray0,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onClose,
                  child: SvgPicture.asset(
                    'assets/icons/close_outline.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
