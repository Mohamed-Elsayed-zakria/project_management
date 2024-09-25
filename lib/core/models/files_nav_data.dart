import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/models/step_type.dart';

class FilesNavData {
  final ProjectDetails projectDetails;
  final StepType stepType;

  FilesNavData({
    required this.projectDetails,
    required this.stepType,
  });
}
