import 'package:flutter/material.dart';

import '../../../design_system/size_config.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key});

  @override
  Size get preferredSize =>
      Size.fromHeight(SizeConfig.appbarHeight + SizeConfig.viewPadding.top);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: SizeConfig.padding,
        top: SizeConfig.appbarHeight,
        right: SizeConfig.padding,
        bottom: SizeConfig.padding,
      ),
      decoration: decoration(),
      child: const Row(
        children: [
          SizedBox(),
        ],
      ),
    );
  }

  BoxDecoration decoration() {
    return const BoxDecoration(
      color: Colors.transparent,
      border: Border(bottom: BorderSide(color: Colors.transparent)),
    );
  }
}
