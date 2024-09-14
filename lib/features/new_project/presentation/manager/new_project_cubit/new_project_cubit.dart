import '/features/new_project/data/repository/new_project_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'new_project_state.dart';

class NewProjectCubit extends Cubit<NewProjectState> {
  final NewProjectRepo _newProjectRepo;
  NewProjectCubit(this._newProjectRepo) : super(NewProjectInitial());

  final TextEditingController projectName = TextEditingController();
  final TextEditingController projectNumber = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  Future<void> createNewProject() async {
    emit(NewProjectLoading());
    Either<Failures, void> result = await _newProjectRepo.createNewProject();
    result.fold(
      (failure) => emit(NewProjectFailure(failure.errMessage)),
      (result) => emit(NewProjectSuccess()),
    );
  }
}
