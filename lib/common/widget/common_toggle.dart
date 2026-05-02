import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ToggleState { enabled, disabled, readOnly }

enum ToggleSize { small, medium }

class CommonToggle extends StatelessWidget {
  final String? label;
  final String? text;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final ToggleState state;
  final ToggleSize size;

  const CommonToggle({
    super.key,
    this.label = 'Label',
    this.text = 'Text',
    required this.value,
    required this.onChanged,
    this.state = ToggleState.enabled,
    this.size = ToggleSize.medium,
  });

  String _getToggleIcon() {
    final sizePrefix = size == ToggleSize.small ? 'small' : 'default';

    switch (state) {
      case ToggleState.disabled:
        return value
            ? 'assets/icons/${sizePrefix}_disable_toggle_true.svg'
            : 'assets/icons/${sizePrefix}_disable_toggle_false.svg';

      case ToggleState.readOnly:
        return value
            ? 'assets/icons/${sizePrefix}_read_only_toggle_true.svg'
            : 'assets/icons/${sizePrefix}_read_only_toggle_false.svg';

      case ToggleState.enabled:
        return value
            ? 'assets/icons/${sizePrefix}_enable_toggle_true.svg'
            : 'assets/icons/${sizePrefix}_enable_toggle_false.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = state == ToggleState.enabled;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label!, style: const TextStyle(fontSize: 12)),
            const SizedBox(width: 4),
            SvgPicture.asset(
              'assets/icons/info_outline.svg',
              width: 16,
              height: 16,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IgnorePointer(
              ignoring: !isEnabled,
              child: GestureDetector(
                onTap: () => onChanged?.call(!value),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 120),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: SvgPicture.asset(
                    _getToggleIcon(),
                    key: ValueKey('${state}_$value'),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(text!, style: TextStyle(fontSize: 14)),
          ],
        ),
      ],
    );
  }
}
