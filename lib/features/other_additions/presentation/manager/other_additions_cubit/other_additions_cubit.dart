import '/features/other_additions/data/repository/other_additions_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'other_additions_state.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class OtherAdditionsCubit extends Cubit<OtherAdditionsState> {
  final OtherAdditionsRepo _otherAdditionsRepo;
  OtherAdditionsCubit(this._otherAdditionsRepo)
      : super(OtherAdditionsInitial());

  String? addOtherAdditionsFile;

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController otherAdditionsNumber = TextEditingController();
  final TextEditingController otherAdditionsSubject = TextEditingController();

  Future<void> pickOtherAdditionsFile() async {
    Either<Failures, String> result =
        await _otherAdditionsRepo.pickOtherAdditionsFile();
    result.fold(
      (failure) => emit(OtherAdditionsFailure(failure.errMessage)),
      (result) {
        addOtherAdditionsFile = result;
        emit(OtherAdditionsInitial());
      },
    );
  }
}
