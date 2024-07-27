import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/app_colors.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/size_config.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/design_system/assets.dart';
import '../../../../core/design_system/fonts.dart';
import '../../../../core/localization/localizations.dart';

class ProductivityChart extends StatelessWidget {
  const ProductivityChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.padding),
      color: whiteColor,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context).productivity,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: SizeConfig.titleFontSize,
                    fontFamily: Fonts.urbanist.name,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SvgPicture.asset(moreSvg,width: SizeConfig.iconSize,height: SizeConfig.iconSize,),
            ],
          ),
          SizedBox(height: SizeConfig.paddingHalf),
          SfCartesianChart(
            borderWidth: 0,
            plotAreaBorderWidth: 0,
            borderColor: whiteColor,
            primaryXAxis: const CategoryAxis(
              majorGridLines: MajorGridLines(width: 0), // Hides vertical grid lines
            ),
            primaryYAxis: const NumericAxis(
              isVisible: false, // Hides the numeric axis (labels and ticks)
              majorGridLines: MajorGridLines(width: 0), // Hides vertical grid lines
            ),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries>[
              ColumnSeries<ChartData, String>(
                dataSource: getChartData(),
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                pointColorMapper: (ChartData data, _) => data.color,
                // gradient: (ChartData data, _) => data.gradient,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(SizeConfig.btnRadius),
                    topRight: Radius.circular(SizeConfig.btnRadius)),
                // dataLabelSettings: const DataLabelSettings(isVisible: true),

              ),
            ],
          ),
        ],
      ),
    );
  }

  List<ChartData> getChartData() {
    return [
      ChartData('Jan', 40, Colors.grey.shade200),
      ChartData('Feb', 60, Colors.grey.shade200),
      ChartData('Mar', 30, Colors.grey.shade200, borderColor: Colors.red),
      ChartData('Apr', 56, Colors.black, gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [primaryColor],
      )),
      ChartData('May', 70, Colors.grey.shade200),
      ChartData('Jun', 60, Colors.grey.shade200),
    ];
  }
}

class ChartData {
  final String x;
  final double y;
  final Color color;
  final Color borderColor;
  LinearGradient gradient;

  ChartData(this.x, this.y, this.color,
      {this.borderColor = Colors.transparent,
      this.gradient = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF191C2A), Color(0xFF191C2A)],
      )});
}
