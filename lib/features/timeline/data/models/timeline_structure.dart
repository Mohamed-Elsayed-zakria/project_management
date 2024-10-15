import 'package:hive/hive.dart';
part 'timeline_structure.g.dart';

@HiveType(typeId: 1)
class TimelineStructure extends HiveObject {
  @HiveField(0)
  final String? activityID;
  @HiveField(1)
  final String? activityName;
  @HiveField(2)
  final String? start;
  @HiveField(3)
  final String? finish;
  @HiveField(4)
  final String? actualStart;
  @HiveField(5)
  final String? actualFinish;
  @HiveField(6)
  final String? complete;

  TimelineStructure({
    required this.activityID,
    required this.activityName,
    required this.start,
    required this.finish,
    required this.actualStart,
    required this.actualFinish,
    required this.complete,
  });
}
