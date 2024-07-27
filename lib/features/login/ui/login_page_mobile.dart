import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringo_media_flutter_dev_test/core/design_system/assets.dart';
import 'package:ringo_media_flutter_dev_test/features/login/presentation/bloc/login_bloc.dart';
import 'package:ringo_media_flutter_dev_test/features/login/ui/widgets/input_field.dart';
import 'package:ringo_media_flutter_dev_test/features/login/ui/widgets/social_button.dart';
import '../../../../../core/design_system/size_config.dart';
import '../../../../core/design_system/fonts.dart';
import '../../../core/design_system/app_colors.dart';
import '../../../core/localization/localizations.dart';
import 'widgets/login_button.dart';

class LoginPageMobile extends BaseStatefulWidget {
  const LoginPageMobile({super.key});

  @override
  BaseState<LoginPageMobile> createState() => _LoginPageMobileState();
}

class _LoginPageMobileState extends BaseState<LoginPageMobile> {
  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget setBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.padding),
        child: StreamBuilder<RequestState>(
          stream: _loginBloc.requestStateSubject,
          builder: (context, stateSnapshot) {
            return Form(
              key: _loginBloc.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.paddingDouble),
                  Text(
                    AppLocalizations.of(context).login,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: SizeConfig.h3FontSize,
                      fontFamily: Fonts.urbanist.name,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: SizeConfig.paddingThreeQuarter),
                  Text(
                    AppLocalizations.of(context).signInToYourAccount,
                    style: TextStyle(
                      color: hintColor,
                      fontSize: SizeConfig.textFontSize,
                      fontFamily: Fonts.urbanist.name,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: SizeConfig.paddingDouble),
                  Text(
                    AppLocalizations.of(context).usernameOrEmail,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: SizeConfig.textFontSize,
                      fontFamily: Fonts.urbanist.name,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InputField(
                    controller: _loginBloc.emailTextEditingController,
                    readOnly:
                        stateSnapshot.data?.status == RequestStatus.loading
                            ? true
                            : false,
                    hint: AppLocalizations.of(context).enterUsernameOrEmail,
                    hintColor: hintColor,
                    formFieldItemType: AppFormFieldItemType.email,
                    onChanged: _loginBloc.onChangedEmailField,
                    textInputType: TextInputType.text,
                    borderColor: primaryColor,
                    unFocusedBorderColor: inputFieldUnFocusedColor,
                    iconColor: hintColor,
                    fillColor: whiteColor,
                    showHint: true,
                    validator: (val) => _loginBloc.validateEmail(val),
                    fontSize: SizeConfig.subTitleFontSize,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: SizeConfig.padding),
                  ),
                  SizedBox(height: SizeConfig.paddingDouble),
                  Text(
                    AppLocalizations.of(context).password,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: SizeConfig.textFontSize,
                      fontFamily: Fonts.urbanist.name,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  StreamBuilder<bool>(
                      stream: _loginBloc.obscureStream,
                      builder: (context, snapshot) {
                        return InputField(
                          controller: _loginBloc.passwordTextEditingController,
                          readOnly: stateSnapshot.data?.status ==
                                  RequestStatus.loading
                              ? true
                              : false,
                          obscureTextSubject: _loginBloc.obscureSubject,
                          hint: AppLocalizations.of(context).enterPassword,
                          hintColor: hintColor,
                          formFieldItemType: AppFormFieldItemType.password,
                          onChanged: _loginBloc.onChangedPasswordField,
                          textInputType: TextInputType.text,
                          borderColor: primaryColor,
                          unFocusedBorderColor: inputFieldUnFocusedColor,
                          iconColor: hintColor,
                          fillColor: whiteColor,
                          showHint: true,
                          validator: (val) => _loginBloc.validatePassword(val),
                          showPasswordIcon: Padding(
                            padding: EdgeInsets.all(SizeConfig.padding),
                            child: SvgPicture.asset(
                              snapshot.data ?? false ? eyeSlashSvg : eyeSvg,
                            ),
                          ),
                          prefixIcon: null,
                          fontSize: SizeConfig.subTitleFontSize,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: SizeConfig.padding),
                        );
                      }),
                  Align(
                    alignment: Alignment.topRight,
                    child: AppButton(
                      title: AppLocalizations.of(context).forgotPassword,
                      backgroundColor: whiteColor,
                      style: TextStyle(
                        fontSize: SizeConfig.textFontSize,
                        color: primaryColor,
                      ),
                      alignment: AppButtonAlign.centerEndIcon,
                      radius: SizeConfig.btnRadius,
                      onTap: null,
                      width: SizeConfig.safeBlockHorizontal * 30,
                      height: SizeConfig.buttonHeight,
                    ),
                  ),
                  SizedBox(height: SizeConfig.padding),
                  LoginButton(loginBloc: _loginBloc),
                  SizedBox(height: SizeConfig.paddingDouble),
                  Center(
                    child: Text(
                      AppLocalizations.of(context).orLoginWithAccount,
                      style: TextStyle(
                        color: hintColor,
                        fontSize: SizeConfig.textFontSize,
                        fontFamily: Fonts.urbanist.name,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.padding),
                  SocialButton(
                    title: AppLocalizations.of(context).continueWithGoogle,
                    svgIconPath: googleSvg,
                    onTap: stateSnapshot.data?.status == RequestStatus.loading
                        ? null
                        : () {},
                  ),
                  SocialButton(
                    title: AppLocalizations.of(context).continueWithFacebook,
                    svgIconPath: facebookSvg,
                    onTap: stateSnapshot.data?.status == RequestStatus.loading
                        ? null
                        : () {},
                  ),
                  SocialButton(
                    title: AppLocalizations.of(context).continueWithApple,
                    svgIconPath: appleSvg,
                    onTap: stateSnapshot.data?.status == RequestStatus.loading
                        ? null
                        : () {},
                  ),
                  SizedBox(height: SizeConfig.paddingDouble),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).doNotHaveAccount,
                        style: TextStyle(
                          color: hintColor,
                          fontSize: SizeConfig.textFontSize,
                          fontFamily: Fonts.urbanist.name,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      AppButton(
                        title: AppLocalizations.of(context).registerHere,
                        backgroundColor: whiteColor,
                        style: TextStyle(
                            fontSize: SizeConfig.textFontSize,
                            color: primaryColor,
                            fontWeight: FontWeight.w700),
                        // alignment: AppButtonAlign.centerEndIcon,
                        radius: SizeConfig.btnRadius,
                        onTap: null,
                        width: SizeConfig.safeBlockHorizontal * 25,
                        height: SizeConfig.buttonHeight,
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.paddingDouble),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Color setScaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  FloatingActionButtonLocation? setFloatingActionButtonLocation() {
    return FloatingActionButtonLocation.centerFloat;
  }

  @override
  Future<bool> setOnWillPop() {
    return Future.value(true);
  }
}
