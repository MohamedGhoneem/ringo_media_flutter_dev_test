import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media_flutter_dev_test/features/calendar/presentation/calendar_bloc.dart';

import '../../../core/design_system/app_colors.dart';
import '../../../core/design_system/size_config.dart';
import '../../../core/localization/localizations.dart';
import 'task_list.dart';

class CalendarTabs extends StatelessWidget {
  final CalendarBloc bloc;

  const CalendarTabs({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CalendarTabsEnum>(
        stream: bloc.selectedTapStream,
        builder: (context, snapshot) {
          return Row(
            children: [
              Expanded(
                child: Container(
                  decoration: snapshot.hasData &&
                          snapshot.data == CalendarTabsEnum.schedule
                      ?  BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: primaryColor,width: SizeConfig.borderWidth*1.5)))
                      : null,
                  margin: EdgeInsets.symmetric(horizontal: SizeConfig.padding),
                  child: AppButton(
                    title: AppLocalizations.of(context).schedule,
                    style: TextStyle(
                      fontSize: SizeConfig.titleFontSize,
                      color: snapshot.hasData &&
                          snapshot.data == CalendarTabsEnum.schedule?primaryColor:hintColor,
                    ),
                    alignment: AppButtonAlign.centerEndIcon,
                    radius: SizeConfig.btnRadius,
                    onTap: ()=>bloc.setSelectedTap(CalendarTabsEnum.schedule),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.buttonHeight,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: snapshot.hasData &&
                      snapshot.data == CalendarTabsEnum.task
                      ?  BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: primaryColor,width: SizeConfig.borderWidth*1.5)))
                      : null,
                  margin: EdgeInsets.symmetric(horizontal: SizeConfig.padding),

                  child: AppButton(
                    title: AppLocalizations.of(context).task,
                    style: TextStyle(
                      fontSize: SizeConfig.titleFontSize,
                      color: snapshot.data == CalendarTabsEnum.task?primaryColor:hintColor,
                    ),
                    alignment: AppButtonAlign.centerEndIcon,
                    radius: SizeConfig.btnRadius,
                    onTap: ()=>bloc.setSelectedTap(CalendarTabsEnum.task),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.buttonHeight,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
