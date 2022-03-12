import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mission_timer/config/app_config.dart';
import 'package:mission_timer/config/app_page/app_page.dart';
import 'package:mission_timer/config/theme/theme_data.dart';
import 'package:mission_timer/src/bindings/initial_bindings.dart';
import 'package:mission_timer/screen/splat_screen/splat_screen.dart';


final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: GetMaterialApp(
        title: "Điểm Danh ITTC",
        navigatorKey: AppConfig.navigatorKey,
        navigatorObservers: [routeObserver],
        theme: appThemeData(context),
        builder: (context, widget) {
          try {
            return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: widget);
          } catch (e) {
            return widget;
          }
        },
      
        locale: Locale('vi', 'VI'),
        fallbackLocale: Locale('vi', 'VI'),
        localizationsDelegates: [
          
        ],
        supportedLocales: [
          const Locale('en', ''), // English, no country code
          const Locale('es', ''), // Spanish, no country code
          const Locale('ja', 'JP')
        ],
        getPages: AppPages.pages,
        initialBinding: InitialBinding(),
        initialRoute:  SplatScreen.router,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
      ),
    );
  }
}
