import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media_flutter_dev_test/features/login/presentation/bloc/login_bloc.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/size_config.dart';
import '../../../../core/localization/localizations.dart';

class LoginButton extends StatelessWidget {
  final LoginBloc loginBloc;

  const LoginButton({super.key, required this.loginBloc});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RequestState>(
      stream: loginBloc.requestStateSubject,
      builder: (context, snapshot) {
        if (snapshot.data?.status == RequestStatus.loading) {
          return AppButton(
              title: '',
              backgroundColor: primaryColor,
              alignment: AppButtonAlign.center,
              radius: SizeConfig.btnRadius,
              onTap: null,
              width: SizeConfig.screenWidth,
              height: SizeConfig.buttonHeight,
              icon: Padding(
                padding:  EdgeInsets.all(SizeConfig.paddingQuarter),
                child: const CircularProgressIndicator(
                  color: whiteColor,
                ),
              ));
        }
        return StreamBuilder<bool>(
            stream: loginBloc.isValidateFormStream,
            builder: (context, isValidateFormSnapshot) {
              return AppButton(
                title: AppLocalizations.of(context).login,
                backgroundColor: loginBloc.signInButtonBgColor,
                style: TextStyle(
                  fontSize: SizeConfig.btnTitleFontSize,
                  color: whiteColor,
                ),
                alignment: AppButtonAlign.centerEndIcon,
                radius: SizeConfig.btnRadius,
                onTap: isValidateFormSnapshot.hasData &&
                        isValidateFormSnapshot.data == true
                    ? () => loginBloc.signIn(context)
                    : null,
                width: SizeConfig.screenWidth,
                height: SizeConfig.buttonHeight,
              );
            });
      },
    );
  }
}
