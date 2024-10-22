import '/features/show_projects/presentation/manager/fetch_projects_cubit/fetch_projects_cubit.dart';
import 'project_details/project_details.dart';

class ProjectInfoRoute {
  final FetchProjectsCubit fetchProjectsCubit;
  final List<ProjectDetails> allProjects;
  final ProjectDetails projectDetails;

  ProjectInfoRoute({
    required this.fetchProjectsCubit,
    required this.projectDetails,
    required this.allProjects,
  });
}
