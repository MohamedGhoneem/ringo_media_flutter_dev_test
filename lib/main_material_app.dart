import 'package:flutter/material.dart';
import 'package:ringo_media_flutter_dev_test/features/login/ui/login_page.dart';
import 'package:ringo_media_flutter_dev_test/features/main/ui/main_page.dart';
import 'core/design_system/app_colors.dart';
import 'core/design_system/fonts.dart';
import 'core/design_system/size_config.dart';
import 'core/localization/locale_helper.dart';
import 'core/localization/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'utilities/constants.dart';

class MainMaterialApp extends StatefulWidget {
  const MainMaterialApp({super.key});

  @override
  State<MainMaterialApp> createState() => _MainMaterialAppState();
}

class _MainMaterialAppState extends State<MainMaterialApp> {
  SpecificLocalizationDelegate? _specificLocalizationDelegate;

  @override
  void initState() {
    super.initState();
    _specificLocalizationDelegate = SpecificLocalizationDelegate(const Locale('en'));
    helper.onLocaleChanged = onLocaleChange;
  }

  void onLocaleChange(Locale locale) {
    if (mounted) {
      setState(() {
        _specificLocalizationDelegate = SpecificLocalizationDelegate(locale);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        _specificLocalizationDelegate!
      ],
      supportedLocales: const [Locale('en'), Locale('ar')],
      locale: _specificLocalizationDelegate?.overriddenLocale,
      title: 'Ringo Media',
      theme: ThemeData(
        fontFamily: Fonts.urbanist.name,
        primaryColor: primaryColor,
      ),
      home: const LoginPage(),
    );
  }
}
