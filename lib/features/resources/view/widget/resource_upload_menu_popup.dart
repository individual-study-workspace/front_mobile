import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/theme.dart';

class ResourceUploadMenuPopup extends StatelessWidget {
  final VoidCallback onCreateFolder;
  final VoidCallback onUploadFile;

  const ResourceUploadMenuPopup({
    super.key,
    required this.onCreateFolder,
    required this.onUploadFile,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      elevation: 4,
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Palette.primarySoft,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Palette.iconDisabled),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: onCreateFolder,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/folder_outline.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            Palette.iconSecondary,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '폴더 만들기',
                          style: TextTypes.title4M(color: Palette.textPrimary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: onUploadFile,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/upload_outline.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            Palette.iconSecondary,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '파일 업로드',
                          style: TextTypes.title4M(color: Palette.textPrimary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
