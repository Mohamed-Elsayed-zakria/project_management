import '/features/timeline/data/models/timeline_structure.dart';
import 'package:hive_flutter/adapters.dart';
import '/core/models/user_credentials.dart';
import '/core/constant/hive_keywords.dart';

class HiveConfig {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserCredentialsAdapter());
    Hive.registerAdapter(TimelineStructureAdapter());
    await Hive.openBox<UserCredentials>(HiveKeywords.kCreds);
    await Hive.openBox<List<TimelineStructure>>(HiveKeywords.timeline);
  }
}
