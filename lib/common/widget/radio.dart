import 'package:flutter/material.dart';
import 'package:front_mobile/common/widget/theme.dart';

class RadioLarge<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;

  const RadioLarge({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  bool get _isSelected => value == groupValue;
  bool get _isDisabled => onChanged == null;

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    Color fillColor;
    Color dotColor;

    if (_isDisabled) {
      borderColor = Palette.gray30;
      fillColor = Palette.gray20;
      dotColor = Palette.gray40;
    } else if (_isSelected) {
      borderColor = Palette.violet500;
      fillColor = Palette.gray0;
      dotColor = Palette.violet500;
    } else {
      borderColor = Palette.gray60;
      fillColor = Palette.gray60;
      dotColor = Colors.transparent;
    }

    return GestureDetector(
      onTap: _isDisabled ? null : () => onChanged!(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: _isSelected ? 1.6 : 1),
          color: fillColor,
        ),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: _isSelected ? 12 : 0,
            height: _isSelected ? 12 : 0,
            decoration: BoxDecoration(shape: BoxShape.circle, color: dotColor),
          ),
        ),
      ),
    );
  }
}

class RadioMedium<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;

  const RadioMedium({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  bool get _isSelected => value == groupValue;
  bool get _isDisabled => onChanged == null;

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    Color fillColor;
    Color dotColor;

    if (_isDisabled) {
      borderColor = Palette.gray30;
      fillColor = Palette.gray20;
      dotColor = Palette.gray40;
    } else if (_isSelected) {
      borderColor = Palette.violet500;
      fillColor = Palette.gray0;
      dotColor = Palette.violet500;
    } else {
      borderColor = Palette.gray60;
      fillColor = Palette.gray60;
      dotColor = Colors.transparent;
    }

    return GestureDetector(
      onTap: _isDisabled ? null : () => onChanged!(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: _isSelected ? 1.4 : 1),
          color: fillColor,
        ),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: _isSelected ? 10 : 0,
            height: _isSelected ? 10 : 0,
            decoration: BoxDecoration(shape: BoxShape.circle, color: dotColor),
          ),
        ),
      ),
    );
  }
}

class RadioTileLarge<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;

  final String title;
  final String? description;

  final bool disabled;

  const RadioTileLarge({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    this.description,
    this.disabled = false,
  });

  bool get _isSelected => value == groupValue;
  bool get _isDisabled => disabled || onChanged == null;

  @override
  Widget build(BuildContext context) {
    final titleColor = _isDisabled ? Palette.gray40 : Palette.gray90;
    final descColor = _isDisabled ? Palette.gray30 : Palette.gray60;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _isDisabled ? null : () => onChanged!(value),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: RadioLarge<T>(
                  value: value,
                  groupValue: groupValue,
                  onChanged: _isDisabled ? null : onChanged,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                    ),
                    if (description != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        description!,
                        style: TextStyle(fontSize: 14, color: descColor),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadioTileMedium<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;

  final String title;
  final String? description;

  final bool disabled;

  const RadioTileMedium({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    this.description,
    this.disabled = false,
  });

  bool get _isSelected => value == groupValue;
  bool get _isDisabled => disabled || onChanged == null;

  @override
  Widget build(BuildContext context) {
    final titleColor = _isDisabled ? Palette.gray40 : Palette.gray90;
    final descColor = _isDisabled ? Palette.gray30 : Palette.gray60;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _isDisabled ? null : () => onChanged!(value),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: RadioMedium<T>(
                  value: value,
                  groupValue: groupValue,
                  onChanged: _isDisabled ? null : onChanged,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                    ),
                    if (description != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        description!,
                        style: TextStyle(fontSize: 14, color: descColor),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
