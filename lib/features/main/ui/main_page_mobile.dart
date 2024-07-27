import 'dart:io';
import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oktoast/oktoast.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/assets.dart';
import 'package:ringo_media_flutter_dev_test/features/project_summary/ui/project_summary_page.dart';
import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/size_config.dart';
import '../../../core/common/components/toast/toast_widget.dart';
import '../../../core/localization/localizations.dart';
import '../presentation/bloc/main_bloc.dart';

class MainPageMobile extends BaseStatefulWidget {
  const MainPageMobile({super.key});

  @override
  State<MainPageMobile> createState() => _MainPageMobileState();
}

class _MainPageMobileState extends BaseState<MainPageMobile> {
  MainBloc mainBloc = MainBloc();
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// Here you can have your context and do what ever you want
      mainBloc.init(context);
    });
  }

  @override
  Widget setBody(BuildContext context) {
    return StreamBuilder<Widget>(
      stream: navBarBloc.selectedWidget.stream,
      builder: (context, snapshot) {
        return snapshot.data ?? const ProjectSummaryPage();
      },
    );
  }

  @override
  bool setResizeToAvoidBottomInset() {
    return true;
  }

  @override
  Color setScaffoldBackgroundColor() {
    return bgColor;
  }

  @override
  Widget? setFloatingActionButton() {
    // TODO: implement setFloatingActionButton
    return AppButton(
      title: '',
      backgroundColor: primaryColor,
      alignment: AppButtonAlign.center,
      radius: SizeConfig.buttonHeight,
      onTap: null,
      width: SizeConfig.buttonHeight,
      height: SizeConfig.buttonHeight,
      icon: SvgPicture.asset(addSvg),
      margin: EdgeInsets.only(top: SizeConfig.padding),
    );
  }

  @override
  FloatingActionButtonLocation? setFloatingActionButtonLocation() {
    // TODO: implement setFloatingActionButtonLocation
    return FloatingActionButtonLocation.centerDocked;
  }

  @override
  Widget? setBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(SizeConfig.iconSize),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.only(top: SizeConfig.padding),
      child: NavBarWidget(
        height: SizeConfig.bottomNavbarHeight,
        textFontSize: SizeConfig.bottomNavbarTextSize,
        background: whiteColor,
        borderColor: whiteColor,
        selectedColor: whiteColor,
        unSelectedColor: whiteColor,
      ),
    );
  }

  @override
  Future<bool> setOnWillPop() {
    // TODO: implement onWillPop
    if (navBarBloc.selectedWidget.value is ProjectSummaryPage) {
      final DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
        currentBackPressTime = now;

        showToastWidget(
          Padding(
            padding: EdgeInsets.all(SizeConfig.padding),
            child: ToastWidget(
              error: AppLocalizations.of(context).clickTwice,
            ),
          ),
          duration: const Duration(seconds: 2),
          position: ToastPosition.bottom,
          textDirection: TextDirection.rtl,
        );

        return Future.value(false);
      }
      exit(0);
      // return Future.value(true);
    } else {
      navBarBloc.pickItem(0);
      return Future.value(false);
    }
  }
}
