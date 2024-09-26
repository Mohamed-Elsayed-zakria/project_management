import '/features/letters/data/models/enum/letter_type_sender.dart';
import '/features/letters/data/models/letter_data/letter_data.dart';
import '/features/letters/data/repository/letters_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/models/step_type.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'letters_state.dart';

class LettersCubit extends Cubit<LettersState> {
  final LettersRepo _lettersRepo;

  LettersCubit(this._lettersRepo) : super(LettersInitial());

  bool incomingLettersIsActive = false;
  bool outgoingLettersIsActive = false;

  List<LetterData> incomingLetters = [];
  List<LetterData> outgoingLetters = [];

  void changeIncomingLettersIsActive() {
    incomingLettersIsActive = true;
    outgoingLettersIsActive = false;
    emit(LetterSuccess());
  }

  void changeOutgoingLettersIsActive() {
    outgoingLettersIsActive = true;
    incomingLettersIsActive = false;
    emit(LetterSuccess());
  }

  Future<void> getAllLetter({
    required String projectId,
    required StepType stepType,
  }) async {
    emit(LetterLoading());
    Either<Failures, List<LetterData>> result = await _lettersRepo.getAllLetter(
      projectId: projectId,
      stepType: stepType,
    );
    result.fold(
      (failures) => emit(LetterFailure(failures.errMessage)),
      (result) {
        for (var element in result) {
          if (element.letterType == LetterTypeSender.incoming.name) {
            incomingLetters.add(element);
          } else if (element.letterType == LetterTypeSender.outgoing.name) {
            outgoingLetters.add(element);
          }
        }
        emit(LetterSuccess());
      },
    );
  }
}
