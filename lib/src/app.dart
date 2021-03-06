import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/app_page/app_page.dart';
import 'package:mission_timer/core/bindings/initial_bindings.dart';
import 'package:mission_timer/core/config/app_config.dart';
import 'package:mission_timer/core/config/language/localization_service.dart';
import 'package:mission_timer/core/config/theme/theme_data.dart';
import 'package:mission_timer/src/screen/splat/splat_screen.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: GetMaterialApp(
        title: "Điểm Danh ITTC",
        navigatorKey: AppConfig.navigatorKey,
        navigatorObservers: [routeObserver],
        theme: appThemeData(context),
        builder: (context, widget) {
          return widget!;
        },
        locale: LocalizationService.locale,
        fallbackLocale: LocalizationService.fallbackLocale,
        translations: LocalizationService(),
        supportedLocales: const [Locale('vi', 'VI'), Locale('en', 'US')],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        getPages: AppPages.pages,
        initialBinding: InitialBinding(),
        initialRoute: SplatScreen.router,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
      ),
    );
  }
}
