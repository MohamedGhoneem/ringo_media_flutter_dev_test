import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/assets.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/size_config.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:intl/intl.dart';

import '../../../core/common/components/custom_date_picker.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDate = DateTime.now();
  final ItemScrollController _scrollController = ItemScrollController();
  DateTime? selectedDate;

  void _showDatePicker() async {
    final DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return const CustomDatePicker();
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.blockSizeVertical * 25,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(SizeConfig.padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap:_showDatePicker,
                  child: Row(
                    children: [
                      Text(
                        DateFormat.yMMMM().format(_selectedDate),
                        style: TextStyle(
                          fontSize: SizeConfig.titleFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.paddingHalf),
                        child: SvgPicture.asset(arrowDownSvg),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(arrowRightSvg),
                      onPressed: () {
                        _scrollController.scrollTo(
                          index: 0,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset(arrowLeftSvg),
                      onPressed: () {
                        _scrollController.scrollTo(
                          index: DateTime.now().day - 1,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 13,
            child: ScrollablePositionedList.builder(
              itemScrollController: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: daysInMonth(_selectedDate),
              itemBuilder: (context, index) {
                DateTime date = DateTime(
                  _selectedDate.year,
                  _selectedDate.month,
                  index + 1,
                );
                bool isSelected = date.day == _selectedDate.day;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 14,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.paddingQuarter),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : Colors.white,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.paddingThreeQuarter),
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat.E().format(date).toUpperCase(),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${date.day}',
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  int daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, 1);
    var firstDayNextMonth = DateTime(date.year, date.month + 1, 1);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }
}

