import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/app_colors.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/size_config.dart';

import '../../../core/design_system/assets.dart';

class ScheduleItemData {
  final String time;
  final String? title;
  final String? duration;
  final Color? color;
  final bool isCurrentTime;

  const ScheduleItemData({
    required this.time,
    this.title,
    this.duration,
    this.color,
    this.isCurrentTime = false,
  });
}

class ScheduleItem extends StatelessWidget {
  final String time;
  final String? title;
  final String? duration;
  final Color color;

  const ScheduleItem({
    super.key,
    required this.time,
    this.title,
    this.duration,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: SizeConfig.padding),
      child: Row(
        crossAxisAlignment: title != null?CrossAxisAlignment.start:CrossAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: SizeConfig.textFontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: SizeConfig.paddingQuarter),
          Expanded(
            child: title != null
                ? Column(
                  children: [
                    const AppDivider(
                      dividerColor: inputFieldUnFocusedColor,
                      thickness: .7,dividerPadding: EdgeInsets.zero,
                    ),
                    Container(
                        padding: EdgeInsets.all(SizeConfig.padding),
                        margin: EdgeInsets.only(left: SizeConfig.padding),
                        decoration: BoxDecoration(
                          color: color.withOpacity(.2),
                          border: Border(
                              left: BorderSide(
                                  color: color, width: SizeConfig.paddingHalf)),
                          borderRadius:
                              BorderRadius.circular(SizeConfig.paddingHalf),

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: SizeConfig.paddingHalf),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title!,
                                        style: TextStyle(
                                          fontSize: SizeConfig.textFontSize,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.paddingQuarter),
                                      Row(
                                        children: [
                                          SvgPicture.asset(timeCircleSvg),
                                          SizedBox(
                                              width: SizeConfig.paddingQuarter),
                                          Text(
                                            duration!,
                                            style: TextStyle(
                                              fontSize: SizeConfig.textFontSize,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                )
                :   const AppDivider(
              dividerColor: inputFieldUnFocusedColor,
              thickness: .7,
            ),
          ),
        ],
      ),
    );
  }
}
