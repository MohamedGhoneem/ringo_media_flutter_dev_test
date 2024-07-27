import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/assets.dart';
import 'package:ringo_media_flutter_dev_test/features/login/presentation/bloc/login_bloc.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/size_config.dart';
import '../../../../core/localization/localizations.dart';

class SocialButton extends StatelessWidget {
  final String title, svgIconPath;
  final VoidCallback? onTap;
  const SocialButton({super.key, required this.title, required this.svgIconPath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppButton(
          title: title,
          backgroundColor: whiteColor,
          borderColor: borderColor,
          style: TextStyle(
            fontSize: SizeConfig.titleFontSize,
            color: primaryColor,
          ),
          alignment: AppButtonAlign.centerEndIcon,
          radius: SizeConfig.btnRadius,
          margin: EdgeInsets.symmetric(vertical: SizeConfig.paddingHalf),
          onTap: null,
          width: SizeConfig.screenWidth,
          height: SizeConfig.buttonHeight,
        ),
        Positioned(
            top: SizeConfig.buttonHeight/2,
            left: SizeConfig.iconSize,
            child: SvgPicture.asset(svgIconPath))
      ],
    );
  }
}
