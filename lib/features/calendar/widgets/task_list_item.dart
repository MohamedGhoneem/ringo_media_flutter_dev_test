import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/app_colors.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/size_config.dart';

import '../../../core/design_system/assets.dart';

class TaskListItem extends StatelessWidget {
  final String title;
  final DateTime dueDate;

  const TaskListItem({required this.title, required this.dueDate, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.btnRadius),
      ),
      child: Padding(
        padding:  EdgeInsets.all(SizeConfig.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:  TextStyle(
                    fontSize: SizeConfig.textFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Due Date: ${DateFormat('EEE, dd MMM yyyy').format(dueDate)}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
           SvgPicture.asset(tickSquareSvg)
          ],
        ),
      ),
    );
  }
}