import '/features/timeline/data/models/timeline_structure.dart';
import '/core/config/isar_config.dart';
import 'package:isar/isar.dart';

abstract class TimelineTableServices {
  static Future<void> storeTimelineList({
    required List<TimelineStructure> timelineList,
  }) async {
    await IsarConfig.isar.writeTxn(
      () async {
        await IsarConfig.isar.timelineStructures.putAll(timelineList);
      },
    );
  }

  static Future<List<TimelineStructure>> readTimelineList({
    required String projectId,
  }) async {
    return await IsarConfig.isar.timelineStructures
        .filter()
        .projectIdEqualTo(projectId)
        .findAll();
  }
}
