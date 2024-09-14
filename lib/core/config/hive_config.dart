import 'package:hive_flutter/adapters.dart';
import '/core/models/user_credentials.dart';
import '/core/constant/hive_keywords.dart';

class HiveConfig {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserCredentialsAdapter());
    await Hive.openBox<UserCredentials>(HiveKeywords.kCreds);
  }
}
