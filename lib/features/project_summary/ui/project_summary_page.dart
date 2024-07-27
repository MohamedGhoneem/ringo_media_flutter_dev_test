import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/size_config.dart';
import 'package:ringo_media_flutter_dev_test/features/project_summary/ui/project_summary_page_mobile.dart';

class ProjectSummaryPage extends StatelessWidget {
  const ProjectSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const ScreenTypeLayout(
      mobile:  ProjectSummaryPageMobile(),

    );
  }
}
