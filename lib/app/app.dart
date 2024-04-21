import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nucles_app/app/app_theme.dart';
import 'package:nucles_app/config/navigation_service.dart';
import 'package:nucles_app/config/strings.dart';
import 'package:nucles_app/ui_features/pages/menu/menu_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: darkNotifier,
      builder: (BuildContext context, bool darkMode, Widget? child) {
        return MaterialApp(
          title: Strings.appName,
          theme: darkMode ? darkTheme : theme,
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          home: const MenuPage(),
        );
      },
    );
  }
}
