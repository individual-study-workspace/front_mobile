import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/common_toast.dart';

class ToastService {
  static OverlayEntry? _currentEntry;

  static void show(
      BuildContext context, {
        required String title,
        required String message,
        required ToastType type,
        Duration duration = const Duration(seconds: 2),
        double bottom = 80,
      }) {
    _removeCurrent();

    final overlay = Overlay.of(context);

    final mediaBottom = MediaQuery.of(context).viewInsets.bottom;
    final adjustedBottom = bottom + mediaBottom;

    late OverlayEntry entry;

    void removeEntry() {
      if (entry.mounted) {
        entry.remove();
      }

      if (_currentEntry == entry) {
        _currentEntry = null;
      }
    }

    entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: 0,
          right: 0,
          bottom: adjustedBottom,
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: CommonToast(
                title: title,
                message: message,
                type: type,
                onClose: removeEntry,
              ),
            ),
          ),
        );
      },
    );

    _currentEntry = entry;
    overlay.insert(entry);

    Future.delayed(duration, removeEntry);
  }

  static void hide() {
    _removeCurrent();
  }

  static void _removeCurrent() {
    if (_currentEntry?.mounted ?? false) {
      _currentEntry!.remove();
    }

    _currentEntry = null;
  }
}