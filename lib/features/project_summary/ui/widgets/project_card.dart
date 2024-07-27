import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/size_config.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.count,
    required this.title,
    required this.iconPath,
    required this.decoration,
  });

  final int count;
  final String title;
  final String iconPath;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(SizeConfig.padding),
        decoration: decoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    count.toString(),
                    style: TextStyle(
                      fontSize: SizeConfig.h3FontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SvgPicture.asset(iconPath,width: SizeConfig.iconSize,height: SizeConfig.iconSize,)
              ],
            ),
            SizedBox(height:SizeConfig.paddingHalf),
            Text(
              title,
              style: TextStyle(
                fontSize: SizeConfig.textFontSize,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
