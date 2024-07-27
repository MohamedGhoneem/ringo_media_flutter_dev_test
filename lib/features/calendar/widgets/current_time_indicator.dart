import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/app_colors.dart';

import '../../../core/design_system/size_config.dart';

class CurrentTimeIndicator extends StatelessWidget {
  final String time;

  const CurrentTimeIndicator({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          time,
          style: TextStyle(
            fontSize: SizeConfig.textFontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: SizeConfig.paddingHalf),
        Container(
            width: SizeConfig.paddingHalf,
            height: SizeConfig.paddingHalf,
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(
                  color: primaryColor, width: SizeConfig.borderWidth),
              borderRadius: BorderRadius.circular(SizeConfig.paddingHalf),
            )),
        const Expanded(
          child: AppDivider(
            dividerColor: primaryColor,
            thickness: .7,
          ),
        ),
      ],
    );
  }
}
