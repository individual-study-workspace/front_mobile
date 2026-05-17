import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/widget/schedule_calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                SizedBox(width: 12),
                SvgPicture.asset(
                  'assets/icons/profile_filled.svg',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ],
        ), //title 지정
      ),
      body: Column(children: [const ScheduleCalendar()]),
    );
  }
}
