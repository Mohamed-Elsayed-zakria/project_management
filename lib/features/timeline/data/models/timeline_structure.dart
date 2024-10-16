import 'package:isar/isar.dart';
part 'timeline_structure.g.dart';

@collection
class TimelineStructure {
  Id uId = Isar.autoIncrement;
  final String? projectId;
  final String? activityID;
  final String? activityName;
  final String? start;
  final String? finish;
  final String? actualStart;
  final String? actualFinish;
  final String? complete;

  TimelineStructure({
    required this.activityID,
    required this.activityName,
    required this.start,
    required this.finish,
    required this.actualStart,
    required this.actualFinish,
    required this.complete,
    required this.projectId,
  });
}
