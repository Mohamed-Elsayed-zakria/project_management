import '/features/timeline/data/models/timeline_structure.dart';
import '/core/constant/hive_keywords.dart';
import 'package:hive/hive.dart';

abstract class TimelineTableServices {
  static Future<void> storeTimelineItem({
    required TimelineStructure timelineList,
    required String projectId,
  }) async {
    final box = Hive.box<TimelineStructure>(HiveKeywords.timeline);
    await box.put(projectId, timelineList);
  }

  static Future<void> removeTimelineItem({
    required String projectId,
  }) async {
    final box = Hive.box<TimelineStructure>(HiveKeywords.timeline);
    box.delete(projectId);
  }

  static List<TimelineStructure> readTimelineList({
    required String projectId,
  }) {
    final box = Hive.box<TimelineStructure>(HiveKeywords.timeline);
    List<TimelineStructure> timelineList = box.values.toList();
    return timelineList;
  }
}
