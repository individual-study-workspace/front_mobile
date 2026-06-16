import 'package:flutter/material.dart';
import 'package:front_mobile/common/theme.dart';

enum TextAreaSize { small, medium, large }

class TextArea extends StatefulWidget {
  const TextArea({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.description,
    this.hintText,
    this.helperText,
    this.focusedHelperText,
    this.errorText,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.size = TextAreaSize.medium,
    this.onChanged,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;

  final Widget? label;
  final String? description;
  final String? hintText;
  final String? helperText;
  final String? focusedHelperText;
  final String? errorText;

  final int? maxLength;

  final bool enabled;
  final bool readOnly;

  final TextAreaSize size;

  final ValueChanged<String>? onChanged;

  @override
  State<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  late final FocusNode _focusNode;
  late final bool _isExternalFocusNode;

  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    _isExternalFocusNode = widget.focusNode != null;
    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    if (!_isExternalFocusNode) {
      _focusNode.dispose();
    }

    super.dispose();
  }

  int get _minLines {
    switch (widget.size) {
      case TextAreaSize.small:
        return 3;
      case TextAreaSize.medium:
        return 5;
      case TextAreaSize.large:
        return 8;
    }
  }

  Color get _borderColor {
    if (!widget.enabled) {
      return Palette.borderLight;
    }

    if (widget.readOnly) {
      return Palette.borderDefault;
    }

    if (widget.errorText != null) {
      return Palette.statusDanger;
    }

    if (_isFocused && !widget.readOnly) {
      return Palette.blue500;
    }

    return Palette.borderDefault;
  }

  Color get _backgroundColor {
    if (!widget.enabled || widget.readOnly) {
      return Palette.bgBase;
    }

    if (widget.readOnly) {
      return Palette.bgBase;
    }

    if (widget.errorText != null) {
      return Palette.statusDangerBg;
    }

    return Palette.bgSurface;
  }

  Color get _textColor {
    if (!widget.enabled) {
      return Palette.textDisabled;
    }

    if (widget.readOnly) {
      return Palette.textTertiary;
    }

    return Palette.textPrimary;
  }

  Color get _hintTextColor {
    if (!widget.enabled) {
      return Palette.textDisabled;
    }

    return Palette.textTertiary;
  }

  @override
  Widget build(BuildContext context) {
    final textLength = widget.controller?.text.length ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[widget.label!, const SizedBox(height: 8)],

        if (widget.description != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.description!,
            style: TextTypes.caption1(color: Palette.textTertiary),
          ),
          const SizedBox(height: 8),
        ],

        Container(
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _borderColor, width: _isFocused ? 2 : 1),
          ),
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            style: TextTypes.body2R(color: _textColor),
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            minLines: _minLines,
            maxLines: null,
            maxLength: widget.maxLength,
            onChanged: (value) {
              setState(() {});
              widget.onChanged?.call(value);
            },
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextTypes.body2R(color: _hintTextColor),
              counterText: '',
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),

        if (widget.errorText != null ||
            widget.helperText != null ||
            widget.focusedHelperText != null ||
            widget.maxLength != null) ...[
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: widget.errorText != null
                    ? Text(
                        widget.errorText!,
                        style: TextTypes.caption1(color: Palette.red600),
                      )
                    : _isFocused && widget.focusedHelperText != null
                    ? Text(
                        widget.focusedHelperText!,
                        style: TextTypes.caption1(color: Palette.blue600),
                      )
                    : widget.helperText != null
                    ? Text(
                        widget.helperText!,
                        style: TextTypes.caption1(
                          color: Palette.textTertiary,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              if (widget.maxLength != null)
                Text(
                  '$textLength/${widget.maxLength}',
                  style: TextTypes.caption1(color: Palette.gray40),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
