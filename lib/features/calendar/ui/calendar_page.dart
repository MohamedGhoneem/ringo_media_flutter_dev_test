import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';

import '../../../core/design_system/size_config.dart';
import '../presentation/calendar_bloc.dart';
import 'calendar_page_mobile.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocProvider(
      bloc: CalendarBloc(),
      child: const ScreenTypeLayout(
        mobile:  CalendarPageMobile(),

      ),
    );
  }
}
