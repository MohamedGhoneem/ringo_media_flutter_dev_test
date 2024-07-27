import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/app_colors.dart';

import '../../../design_system/fonts.dart';
import '../../../design_system/size_config.dart';


class ToastWidget extends StatelessWidget {
  final String error;

  const ToastWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.buttonHeight,
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.paddingHalf, horizontal: SizeConfig.padding),
        margin: EdgeInsets.only(bottom: SizeConfig.paddingDouble * 1.5),
        decoration: BoxDecoration(
          color: hintColor,
          // border: Border.all(color: errorColor),
          borderRadius: BorderRadius.all(
            Radius.circular(SizeConfig.paddingHalf),
          ),
        ),
        child:             AppText(
          label: error,
          style: TextStyle(
              color: errorColor,
              fontSize: SizeConfig.textFontSize,
              overflow: TextOverflow.ellipsis,
              fontFamily: Fonts.urbanist.name),
        ),

      ),
    );
  }
}
