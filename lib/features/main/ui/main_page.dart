import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';

import '../../../core/design_system/size_config.dart';
import 'main_page_mobile.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return const ScreenTypeLayout(
      mobile: MainPageMobile(),
    );
  }
}
