import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';

import '../../../common/widget/schedule_calendar.dart';
import '../../../common/widget/schedule_tab_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.bgSurface,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('logo'),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/notification_outline.svg',
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 24),
                SvgPicture.asset(
                  'assets/icons/profile_outline.svg',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ],
        ), //title 지정
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const ScheduleCalendar(),
              SizedBox(height: 16),
              Row(
                children: List.generate(
                  40,
                  (index) => Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 0.1),
                      height: 1,
                      color: index.isEven
                          ? Palette.borderDefault
                          : Colors.transparent,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(children: [Text("오늘의 수업", style: TextTypes.title2())]),
              SizedBox(height: 12),
              ScheduleTabBar(selectedIndex: 1, onTap: (index) {}),
            ],
          ),
        ),
      ),
    );
  }
}
