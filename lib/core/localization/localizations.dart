import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  String get locale => Intl.message('en', name: 'locale');
  String get login => Intl.message('Login', name: 'login');
  String get signInToYourAccount => Intl.message('Sign in to your account', name: 'signInToYourAccount');
  String get usernameOrEmail => Intl.message('Username / Email', name: 'usernameOrEmail');
  String get enterUsernameOrEmail => Intl.message('Enter Username / Email here', name: 'enterUsernameOrEmail');
  String get password => Intl.message('Password', name: 'password');
  String get enterPassword => Intl.message('Enter password here', name: 'enterPassword');
  String get forgotPassword => Intl.message('Forgot Password?', name: 'forgotPassword');
  String get orLoginWithAccount => Intl.message('Or login with account', name: 'orLoginWithAccount');
  String get continueWithGoogle => Intl.message('Continue with Google', name: 'continueWithGoogle');
  String get continueWithFacebook => Intl.message('Continue with Facebook', name: 'continueWithFacebook');
  String get continueWithApple => Intl.message('Continue with Apple', name: 'continueWithApple');
  String get doNotHaveAccount => Intl.message('Don\'t have an account?', name: 'doNotHaveAccount');
  String get registerHere => Intl.message('Register Here', name: 'registerHere');
  String get clickTwice => Intl.message('To close the app, double-click the back button.', name: 'clickTwice');
  String get projectSummary => Intl.message('Project Summary', name: 'projectSummary');
  String get productivity => Intl.message('Productivity', name: 'productivity');
  String get viewAllProject => Intl.message('View All Project', name: 'viewAllProject');
  String get search => Intl.message('Search', name: 'search');
  String get searchProjectHere => Intl.message('Search project here', name: 'searchProjectHere');
  String get calendar => Intl.message('Calendar', name: 'calendar');
  String get schedule => Intl.message('Schedule', name: 'schedule');
  String get task => Intl.message('Task', name: 'task');
  String get continueWord => Intl.message('Continue', name: 'continueWord');




  // String get locale => Intl.message('en', name: 'locale');




}

class SpecificLocalizationDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final Locale? overriddenLocale;

  SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<AppLocalizations> load(Locale locale) =>
      AppLocalizations.load(overriddenLocale!);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}
