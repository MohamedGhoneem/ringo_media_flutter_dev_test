import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/assets.dart';
import '../../../../core/design_system/size_config.dart';
import '../../../calendar/ui/calendar_page.dart';
import '../../../calendar/ui/calendar_page_mobile.dart';
import '../../../project_summary/ui/project_summary_page.dart';

class MainBloc {
  DateTime? currentBackPressTime;

 void init(BuildContext context) {
    navBarBloc.naveBarItemList = [
      NavBarItem(
        title: '',
        widget:const SizedBox(),
        selectedIcon: SvgPicture.asset(
          categorySvg,
          width: SizeConfig.iconSize,
          height: SizeConfig.iconSize,
        ),
        unSelectedIcon: SvgPicture.asset(
          categorySvg,
          width: SizeConfig.iconSize,
          height: SizeConfig.iconSize,
        ),
      ),
      NavBarItem(
        title: '',
        widget:const ProjectSummaryPage(),
        selectedIcon: SvgPicture.asset(
          selectedFolderSvg,
          width: SizeConfig.iconSize,
          height: SizeConfig.iconSize,
        ),
        unSelectedIcon: SvgPicture.asset(
          unSelectedFolderSvg,
          width: SizeConfig.iconSize,
          height: SizeConfig.iconSize,
        ),
        onTap: () {
        },
      ),
      const NavBarItem(
        title: '',
        widget:SizedBox(),
      ),
      NavBarItem(
        title: '',
        widget:const CalendarPage(),
        selectedIcon: SvgPicture.asset(
          selectedCalendarSvg,
          width: SizeConfig.iconSize,
          height: SizeConfig.iconSize,
        ),
        unSelectedIcon: SvgPicture.asset(
          unSelectedCalendarSvg,
          width: SizeConfig.iconSize,
          height: SizeConfig.iconSize,
        ),
        onTap: () {
        },
      ),
      const NavBarItem(
        title: '',
        widget:SizedBox(),
        selectedIcon: AppImage(path: profilePng,),
        unSelectedIcon: AppImage(path: profilePng,),
      ),
    ];
    /// To Start App on Events screen till finishing Home screen
    navBarBloc.pickItem(1);
  }
}
