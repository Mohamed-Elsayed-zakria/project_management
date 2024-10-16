import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:window_manager/window_manager.dart';
import 'core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'core/config/isar_config.dart';
import 'core/config/dio_config.dart';
import 'core/routes/app_pages.dart';
import 'core/constant/style.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SetupLocator().setup();
  DioConfig().setupDio();
  await IsarConfig.initHive();
  if (Platform.isWindows) {
    await windowManager.ensureInitialized();
    await windowManager.setMinimumSize(const Size(670, 600));
    await windowManager.center();
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Project management',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar', 'AE'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppStyle.appTheme(),
      routerConfig: AppPages.router,
    );
  }
}
