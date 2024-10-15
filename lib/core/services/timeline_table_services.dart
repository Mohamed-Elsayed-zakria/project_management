import '/features/timeline/data/models/timeline_structure.dart';
import '/core/constant/hive_keywords.dart';
import 'package:hive/hive.dart';

abstract class TimelineTableServices {
  static Future<void> storeTimelineItem({
    required List<TimelineStructure> timelineData,
    required String projectId,
  }) async {
    final box = Hive.box<List<TimelineStructure>>(HiveKeywords.timeline);
    await box.put(projectId, timelineData);
  }

  static Future<void> removeTimelineItem({
    required int index,
    required String projectId,
  }) async {
    final box = Hive.box<List<TimelineStructure>>(HiveKeywords.timeline);
    List<TimelineStructure> timelineList =
        box.get(projectId, defaultValue: []) ?? [];

    // التحقق من أن الفهرس صالح
    if (index >= 0 && index < timelineList.length) {
      timelineList.removeAt(index);
      await box.put(projectId, timelineList);
    }
  }

  static List<TimelineStructure> readTimelineList({
    required String projectId,
  }) {
    final box = Hive.box<List<TimelineStructure>>(HiveKeywords.timeline);
    List<TimelineStructure>? timelineList = box.get(projectId);
    return timelineList ?? [];
  }
}
