import 'package:flutter/material.dart';
import 'package:front_mobile/common/theme.dart';

class TabMenu extends StatelessWidget {
  const TabMenu({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTap,
  });

  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        children: List.generate(
          tabs.length,
          (index) => Expanded(
            child: InkWell(
              onTap: () => onTap(index),
              child: Container(
                color: Palette.bgSurface,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            tabs[index],
                            style: TextTypes.title3SB(
                              color: selectedIndex == index
                                  ? Palette.textPrimary
                                  : Palette.textSecondary,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 2,
                        width: double.infinity,
                        color: selectedIndex == index
                            ? Palette.primaryVariant
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
