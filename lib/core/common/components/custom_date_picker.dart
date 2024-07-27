import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/app_colors.dart';

import '../../design_system/size_config.dart';
import '../../localization/localizations.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();

  void _onDateChanged(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void _onContinuePressed() {
    Navigator.pop(context, selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + SizeConfig.padding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeConfig.padding),
          topRight: Radius.circular(SizeConfig.padding),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, -2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(SizeConfig.padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: SizeConfig.iconSize), // Placeholder for alignment
                const Text(
                  'Choose Date',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const AppDivider(
            dividerColor: inputFieldUnFocusedColor,
            thickness: .7,dividerPadding: EdgeInsets.zero,
          ),
          Padding(
            padding: EdgeInsets.all(SizeConfig.padding),
            child: Column(
              children: [
                CalendarDatePicker(
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                  onDateChanged: _onDateChanged,
                ),
                SizedBox(height: SizeConfig.padding),
                AppButton(
                  title: AppLocalizations.of(context).continueWord,
                  backgroundColor: primaryColor,
                  style: TextStyle(
                    fontSize: SizeConfig.btnTitleFontSize,
                    color: whiteColor,
                  ),
                  alignment: AppButtonAlign.centerEndIcon,
                  radius: SizeConfig.btnRadius,
                  onTap: _onContinuePressed,
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.buttonHeight,
                ),
                SizedBox(height: SizeConfig.padding),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
