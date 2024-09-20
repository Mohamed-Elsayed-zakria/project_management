import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/show_projects/data/repository/fetch_projects_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/errors/failures.dart';
import 'fetch_projects_state.dart';
import 'package:dartz/dartz.dart';

class FetchProjectsCubit extends Cubit<FetchProjectsState> {
  final FetchProjectsRepo _fetchProjectsRepo;
  FetchProjectsCubit(this._fetchProjectsRepo) : super(FetchProjectsInitial()) {
    fetchAllProjects();
  }
  List<ProjectDetails> allProjects = [];

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
}
