import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/app_colors.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/assets.dart';
import 'package:ringo_media_flutter_dev_test/core/localization/localizations.dart';
import 'package:ringo_media_flutter_dev_test/features/project_summary/ui/widgets/project_card.dart';
import 'package:ringo_media_flutter_dev_test/features/project_summary/ui/widgets/project_summary_app_bar.dart';

import '../../../core/design_system/fonts.dart';
import '../../../core/design_system/size_config.dart';
import '../../login/ui/widgets/input_field.dart';
import 'widgets/productivity_chart.dart';

class ProjectSummaryPageMobile extends BaseStatefulWidget {
  const ProjectSummaryPageMobile({super.key});

  @override
  State<ProjectSummaryPageMobile> createState() =>
      _ProjectSummaryPageMobileState();
}

class _ProjectSummaryPageMobileState
    extends BaseState<ProjectSummaryPageMobile> {
  @override
  Widget setBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.padding),

          Padding(
            padding: EdgeInsets.symmetric(horizontal:SizeConfig.padding),
            child: Text(
              AppLocalizations.of(context).search,
              style: TextStyle(
                color: primaryColor,
                fontSize: SizeConfig.textFontSize,
                fontFamily: Fonts.urbanist.name,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:SizeConfig.padding),
            child: InputField(
              hint: AppLocalizations.of(context).searchProjectHere,
              hintColor: hintColor,
              formFieldItemType: AppFormFieldItemType.email,
              textInputType: TextInputType.text,
              borderColor: primaryColor,
              unFocusedBorderColor: inputFieldUnFocusedColor,
              iconColor: hintColor,
              fillColor: bgColor,
              showHint: true,
              fontSize: SizeConfig.subTitleFontSize,
              contentPadding:
              EdgeInsets.symmetric(vertical: SizeConfig.padding),
              suffixIcon: Padding(
                padding:  EdgeInsets.all(SizeConfig.padding),
                child: SvgPicture.asset(searchSvg,),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.padding),

          Padding(
            padding: EdgeInsets.all(SizeConfig.padding),
            child: Row(
              children: [
                ProjectCard(
                    count: 10,
                    title: 'Project In Progress',
                    iconPath: clockSvg,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF3A9ADE), Color(0xFF5EACE4)],
                      ),
                      borderRadius: BorderRadius.circular(SizeConfig.padding),
                    )),
                SizedBox(width: SizeConfig.padding),
                ProjectCard(
                    count: 24,
                    iconPath: verifySvg,
                    title: 'Project Competed',
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF3F8B8D), Color(0xFF58B2B4)],
                      ),
                      borderRadius: BorderRadius.circular(SizeConfig.padding),
                    )),
                SizedBox(width: SizeConfig.padding),
                ProjectCard(
                    count: 5,
                    iconPath: closeCircleSvg,
                    title: 'Project Cancelled',
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFDD4A4A), Color(0xFFE87777)],
                      ),
                      borderRadius: BorderRadius.circular(SizeConfig.padding),
                    )),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.paddingDouble),
          AppButton(
            title: AppLocalizations.of(context).viewAllProject,
            backgroundColor: bgColor,
            borderColor: primaryColor,
            alignment: AppButtonAlign.center,
            radius: SizeConfig.btnRadius,
            onTap: null,
            width: SizeConfig.screenWidth,
            height: SizeConfig.buttonHeight,
            margin: EdgeInsets.all(SizeConfig.padding),
            style: TextStyle(
              color: primaryColor,
              fontSize: SizeConfig.titleFontSize,
              fontFamily: Fonts.urbanist.name,
              fontWeight: FontWeight.w700,
            ),

          ),

          SizedBox(height: SizeConfig.paddingDouble),

          const ProductivityChart(),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? setAppbar() {
    // TODO: implement setAppbar
    return const ProjectSummaryAppBar();
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
