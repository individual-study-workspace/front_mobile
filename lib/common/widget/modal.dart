import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/theme.dart';
import 'package:front_mobile/common/widget/button/button.dart';

class Modal extends StatelessWidget {
  final String title;
  final String? description;
  final Widget? content;
  final String? leftText;
  final String rightText;
  final VoidCallback? onLeft;
  final VoidCallback? onRight;
  final bool showCloseButton;

  const Modal({
    super.key,
    required this.title,
    this.description,
    this.content,
    this.leftText,
    required this.rightText,
    this.onLeft,
    this.onRight,
    this.showCloseButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Palette.gray0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// 닫기 버튼
            if (showCloseButton)
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    'assets/icons/close_outline.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),

            /// 제목
            Text(title, style: TextTypes.title1B()),

            /// 부제목
            if (description != null) ...[
              const SizedBox(height: 12),
              Text(
                description!,
                textAlign: TextAlign.center,
                style: TextTypes.body2M(color: Palette.textSecondary),
              ),
            ],

            /// 가변 영역
            if (content != null) ...[const SizedBox(height: 12), content!],

            const SizedBox(height: 16),

            /// 버튼 영역
            if (leftText == null)
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(content: rightText, onPressed: onRight),
              )
            else
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: SecondaryButton(
                        content: leftText!,
                        onPressed: onLeft,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      child: PrimaryButton(
                        content: rightText,
                        onPressed: onRight,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
