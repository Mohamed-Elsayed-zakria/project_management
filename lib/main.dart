import 'features/auth/presentation/views/login_view.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart';
import 'core/config/hive_config.dart';
import 'core/constant/style.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.initHive();
  if (Platform.isWindows) {
    await windowManager.ensureInitialized();
    // await windowManager.setMinimumSize(const Size(670, 600));
    await windowManager.center();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project management',
      debugShowCheckedModeBanner: false,
      theme: AppStyle.appTheme(),
      home: const LoginView(),
      locale: const Locale('ar'),
      builder: (context, widget) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: widget!,
        );
      },
    );
  }
}
