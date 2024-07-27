import 'package:flutter/material.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/app_colors.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/size_config.dart';

import 'task_list_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'title': 'Meeting Concept', 'dueDate': DateTime(2023, 1, 12)},
      {'title': 'Project Review', 'dueDate': DateTime(2023, 2, 5)},
      {'title': 'Team Lunch', 'dueDate': DateTime(2023, 3, 15)},
      // Add more items here
    ];
    return Container(
      color: whiteColor,
        padding:  EdgeInsets.all(SizeConfig.padding),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return TaskListItem(
              title: items[index]['title'],
              dueDate: items[index]['dueDate'],
            );
          },
        ));
  }
}
