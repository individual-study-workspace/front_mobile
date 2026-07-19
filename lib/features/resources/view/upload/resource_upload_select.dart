import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/theme.dart';

class ResourceUploadSelect extends StatelessWidget {
  const ResourceUploadSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 파일 선택 영역
        Expanded(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Palette.primary,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "1",
                        style: TextTypes.body2R(
                          color: Palette.textPrimaryInverse,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '파일 선택',
                      style: TextTypes.title3SB(color: Palette.gray100),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 34),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '업로드할 파일을 선택해주세요',
                        style: TextTypes.caption1(color: Palette.textSecondary),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  color: Palette.violet200,
                  strokeWidth: 1.5,
                  dashPattern: const [3, 4],
                  padding: EdgeInsets.all(1),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Palette.violet50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/share2_outline.svg',
                          width: 40,
                          height: 40,
                          colorFilter: const ColorFilter.mode(
                            Palette.primaryVariant,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '파일을 선택하세요',
                          style: TextTypes.body2R(color: Palette.textSecondary),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                              color: Palette.gray100,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 15,
                          ),
                          child: Text(
                            '파일 선택',
                            style: TextTypes.caption1(
                              color: Palette.textPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '선택된 파일 ',
                            style: TextTypes.title4M(color: Palette.gray100),
                          ),
                          TextSpan(
                            text: '2개',
                            style: TextTypes.body2R(
                              color: Palette.primaryVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '모두 제거',
                      style: TextTypes.caption1(color: Palette.primaryVariant),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
