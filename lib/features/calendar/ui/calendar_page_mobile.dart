import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/app_colors.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/assets.dart';
import 'package:ringo_media_flutter_dev_test/core/localization/localizations.dart';
import 'package:ringo_media_flutter_dev_test/features/calendar/presentation/calendar_bloc.dart';
import 'package:ringo_media_flutter_dev_test/features/project_summary/ui/widgets/project_card.dart';
import 'package:ringo_media_flutter_dev_test/features/project_summary/ui/widgets/project_summary_app_bar.dart';

import '../../../core/design_system/fonts.dart';
import '../../../core/design_system/size_config.dart';
import '../../login/ui/widgets/input_field.dart';
import '../widgets/calendar_tabs.dart';
import '../widgets/calendar.dart';
import '../widgets/calendar_app_bar.dart';
import '../widgets/schedule_list.dart';
import '../widgets/task_list.dart';

class CalendarPageMobile extends BaseStatefulWidget {
  const CalendarPageMobile({super.key});

  @override
  State<CalendarPageMobile> createState() => _CalendarPageMobileState();
}

class _CalendarPageMobileState extends BaseState<CalendarPageMobile> {
  late CalendarBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<CalendarBloc>(context);
  }

  @override
  Widget setBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Calendar(),
        CalendarTabs(
          bloc: bloc,
        ),
        StreamBuilder<CalendarTabsEnum>(
            stream: bloc.selectedTapStream,
            builder: (context, snapshot) {
              return Expanded(
                  child: snapshot.hasData &&
                          snapshot.data == CalendarTabsEnum.schedule
                      ? const ScheduleList()
                      : const TaskList());
            }),
      ],
    );
  }

  @override
  PreferredSizeWidget? setAppbar() {
    // TODO: implement setAppbar
    return const CalendarAppBar();
  }

  @override
  Color setScaffoldBackgroundColor() {
    return bgColor;
  }

  @override
  FloatingActionButtonLocation? setFloatingActionButtonLocation() {
    return FloatingActionButtonLocation.centerFloat;
  }

  @override
  Widget? setDrawer() {
    // TODO: implement setDrawer
    return SizedBox();
  }

  @override
  Future<bool> setOnWillPop() {
    return Future.value(true);
  }
}
