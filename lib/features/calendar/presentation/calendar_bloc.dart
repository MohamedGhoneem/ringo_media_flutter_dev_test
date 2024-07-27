import 'dart:convert';
import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media_flutter_dev_test/core/common/models/success_model.dart';
import 'package:ringo_media_flutter_dev_test/features/main/ui/main_page.dart';

import '../../../../core/common/models/error/handler/error_model.dart';
import '../../../../core/design_system/app_colors.dart';
import '../../../../utilities/utilities.dart';
import '../../../../utilities/validations.dart';

enum CalendarTabsEnum { schedule, task }

class CalendarBloc extends BaseBloc
    with RxdartBlocState<SuccessModel, ErrorModel>, Validations {
  final BehaviorSubject<CalendarTabsEnum> _selectedTap =
      BehaviorSubject.seeded(CalendarTabsEnum.schedule);

  Stream<CalendarTabsEnum> get selectedTapStream => _selectedTap.stream;

  void setSelectedTap(CalendarTabsEnum value) {
    _selectedTap.add(value);
  }


  @override
  void dispose() {
    _selectedTap.close();
  }
}
