import '/features/timeline/data/models/timeline_structure.dart';
import 'package:path_provider/path_provider.dart';
import '/core/models/user_credentials.dart';
import 'package:isar/isar.dart';

class IsarConfig {
  static late Isar isar;
  static Future<void> initHive() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        UserCredentialsSchema,
        TimelineStructureSchema,
      ],
      directory: dir.path,
    );
  }
}
