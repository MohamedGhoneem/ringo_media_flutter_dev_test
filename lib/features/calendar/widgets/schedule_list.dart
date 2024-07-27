import 'package:flutter/material.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/app_colors.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/size_config.dart';

import 'current_time_indicator.dart';
import 'schedule_list_item.dart';
import 'task_list_item.dart';

class ScheduleList extends StatelessWidget {
  const ScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    const List<ScheduleItemData> scheduleItems = [
      ScheduleItemData(
        time: '09.00',
        title: 'Sprint Review Period 02 in May 2022',
        duration: '09:00 AM - 10:00 AM',
        color: Color(0xFFD1C4E9),
      ),
      ScheduleItemData(
        time: '10.00',
      ),
      ScheduleItemData(
        time: '10.40',
        isCurrentTime: true,
      ),
      ScheduleItemData(
        time: '11.00',
        title: 'Meeting with Client',
        duration: '11:00 AM - 12:00 AM',
        color: Color(0xFFFD7722),
      ),
      ScheduleItemData(
        time: '12.00',
        title: 'Daily Standup',
        duration: '12:00 AM - 12:30 PM',
        color: Color(0xFF5ECEB3),
      ),
    ];
    return Container(
      color: whiteColor,
      padding: EdgeInsets.only(
          top: SizeConfig.paddingDouble,
          left: SizeConfig.padding,
          right: SizeConfig.padding,
          bottom: SizeConfig.padding),
      child: ListView.builder(
        itemCount: scheduleItems.length,
        itemBuilder: (context, index) {
          final item = scheduleItems[index];
          if (item.isCurrentTime) {
            return CurrentTimeIndicator(time: item.time);
          } else {
            return ScheduleItem(
              time: item.time,
              title: item.title,
              duration: item.duration,
              color: item.color ?? Colors.transparent,
            );
          }
        },
      ),
    );
  }
}
