import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media_flutter_dev_test/features/login/presentation/bloc/login_bloc.dart';

import '../../../core/design_system/size_config.dart';
import 'login_page_mobile.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocProvider(
      bloc: LoginBloc(),
      child: const ScreenTypeLayout(
        mobile: LoginPageMobile(),
      ),
    );
  }
}
