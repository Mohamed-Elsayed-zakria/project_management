import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/show_projects/data/models/enum/project_search_type.dart';
import '/features/show_projects/data/repository/fetch_projects_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import '/core/errors/failures.dart';
import 'fetch_projects_state.dart';
import 'package:dartz/dartz.dart';

class FetchProjectsCubit extends Cubit<FetchProjectsState> {
  final FetchProjectsRepo _fetchProjectsRepo;
  FetchProjectsCubit(this._fetchProjectsRepo) : super(FetchProjectsInitial());

  final TextEditingController searchText = TextEditingController();

  ProjectSearchType searchType = ProjectSearchType.projectName;

  List<ProjectDetails> allProjects = [];
  List<ProjectDetails> allAfterSearchProjects = [];

  Future<void> fetchAllProjects() async {
    emit(FetchProjectsLoading());
    Either<Failures, List<ProjectDetails>> result =
        await _fetchProjectsRepo.fetchAllProjects();
    result.fold(
      (failures) => emit(FetchProjectsFailure(failures.errMessage)),
      (result) {
        allProjects = result;
        emit(FetchProjectsSuccess());
      },
    );
  }

  void projectsSearch() {
    allAfterSearchProjects.clear();
    String searchQuery = searchText.text.toLowerCase();
    if (searchType == ProjectSearchType.projectName) {
      allAfterSearchProjects = allProjects.where((project) {
        return project.projectName?.toLowerCase().contains(searchQuery) ??
            false;
      }).toList();
    } else if (searchType == ProjectSearchType.projectNumber) {
      allAfterSearchProjects = allProjects.where((project) {
        return project.projectNumber?.toLowerCase().contains(searchQuery) ??
            false;
      }).toList();
    }
    emit(FetchProjectsSuccess());
  }
}
