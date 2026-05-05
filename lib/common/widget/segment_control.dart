import 'package:flutter/material.dart';
import 'package:front_mobile/common/widget/theme.dart';

class SegmentedControl extends StatelessWidget {
  final List<String> items;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const SegmentedControl({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Palette.bgSoft,
        borderRadius: BorderRadius.circular(8),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = constraints.maxWidth / items.length;

          return Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                left: itemWidth * selectedIndex,
                top: 0,
                child: Container(
                  width: itemWidth,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Palette.bgSurface,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),

              Row(
                children: List.generate(items.length, (index) {
                  final isSelected = index == selectedIndex;

                  return Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => onChanged(index),
                      child: Center(
                        child: Text(
                          items[index],
                          style: TextStyle(
                            fontSize: 14,
                            color: isSelected
                                ? Palette.textPrimary
                                : Palette.textTertiary,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}
