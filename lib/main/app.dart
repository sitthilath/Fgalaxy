import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/infrastructure/localizations/app_translate_delegate.dart';
import 'package:galaxy_18_lottery_app/infrastructure/localizations/locale_actions.dart';
import 'package:galaxy_18_lottery_app/main/app_env.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';

import '../routes/app_route.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  @override
  void initState(){
    super.initState();
    LocaleActions.newLocaleDelegate = const AppTranslationsDelegate(newLocale: Locale('lo'));
    _checkLang();
  }

  void _checkLang() async {
    await LocaleActions.selectLanguage('lo');
  }

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: EnvInfo.appName,
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      localizationsDelegates: [
        LocaleActions.newLocaleDelegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('lo', ''),
        Locale('en', ''),
      ],
      theme: ThemeData(
        primaryColor: AppColor.primaryColor,
        fontFamily: LAO_FONT_FAMILY,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
