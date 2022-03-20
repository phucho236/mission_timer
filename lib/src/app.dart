import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:mission_timer/config/app_config.dart';
import 'package:mission_timer/config/app_page/app_page.dart';
import 'package:mission_timer/config/language/translation.dart';
import 'package:mission_timer/config/theme/theme_data.dart';
import 'package:mission_timer/screen/splat/splat_screen.dart';
import 'package:mission_timer/src/bindings/initial_bindings.dart';

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
        translations: Internationalization(),
        locale: const Locale('vi', 'VI'),
        supportedLocales: const [Locale('vi', 'VI')],
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
