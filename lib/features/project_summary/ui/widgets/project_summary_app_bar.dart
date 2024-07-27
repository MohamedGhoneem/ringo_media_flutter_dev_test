import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/design_system/app_colors.dart';
import '../../../../../../core/design_system/assets.dart';
import '../../../../../../core/design_system/size_config.dart';
import '../../../../../../core/localization/localizations.dart';
import '../../../../core/common/components/app_bar/base_app_bar.dart';

class ProjectSummaryAppBar extends BaseAppBar {
  const ProjectSummaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: SizeConfig.padding,
        top: SizeConfig.appbarHeight,
        right: SizeConfig.padding,
        bottom: SizeConfig.padding,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(
          bottom: BorderSide(
            color: borderColor,
            width: SizeConfig.borderWidth,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            menuSvg,
            width: SizeConfig.appbarIconSize,
            height: SizeConfig.appbarIconSize,
          ),
          SizedBox(width: SizeConfig.padding),
          Expanded(
              child: Text(
            AppLocalizations.of(context).projectSummary,
            style: TextStyle(fontSize: SizeConfig.subTitleFontSize),
          )),
          Stack(
            children: [
              SvgPicture.asset(
                notificationSvg,
                width: SizeConfig.appbarIconSize,
                height: SizeConfig.appbarIconSize,
              ),
              Positioned(
                  top: SizeConfig.paddingQuarter,
                  right: SizeConfig.paddingQuarter,
                  child: SvgPicture.asset(ellipseSvg)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        SizeConfig.screenWidth < 600
            ? SizeConfig.appbarHeight * 7
            : SizeConfig.appbarHeight * 1.5,
      );
}
