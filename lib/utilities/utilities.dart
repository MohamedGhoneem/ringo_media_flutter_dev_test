import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:network_implementation/network_implementation.dart';
import '../core/design_system/app_colors.dart';
import '../core/design_system/size_config.dart';
import 'constants.dart';

void popWidget() {
  Navigator.pop(navigatorKey.currentState!.context);
}

void navigateAndPop(Widget widget) {
  navigatorKey.currentState?.pushReplacement(
    PageRouteBuilder(
      pageBuilder: (c, a1, a2) => widget,
      transitionsBuilder: (c, anim, a2, child) =>
          FadeTransition(opacity: anim, child: child),
    ),
  );
}

void navigate(Widget widget) {
  navigatorKey.currentState?.push(
    PageRouteBuilder(
      pageBuilder: (c, a1, a2) => widget,
      transitionsBuilder: (c, anim, a2, child) =>
          FadeTransition(opacity: anim, child: child),
    ),
  );
}
