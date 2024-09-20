import 'package:window_manager/window_manager.dart';
import 'core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'core/config/hive_config.dart';
import 'core/config/dio_config.dart';
import 'core/routes/app_pages.dart';
import 'core/constant/style.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SetupLocator().setup();
  DioConfig().setupDio();
  await HiveConfig.initHive();
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
      theme: AppStyle.appTheme(),
      locale: const Locale('ar'),
      builder: (context, widget) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: widget!,
        );
      },
      routerConfig: AppPages.router,
    );
  }
}
