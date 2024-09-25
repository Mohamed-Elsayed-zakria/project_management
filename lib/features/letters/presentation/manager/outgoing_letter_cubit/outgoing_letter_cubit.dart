import 'package:project_management/features/letters/data/models/enum/letters_search_type.dart';

import '/features/letters/data/models/letter_data/letter_data.dart';
import '/features/letters/data/models/enum/reply_status.dart';
import '/features/letters/data/models/enum/letter_type.dart';
import '/features/letters/data/repository/letters_repo.dart';
import '/features/letters/data/models/add_letter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/utils/my_date_util.dart';
import 'package:flutter/material.dart';
import 'outgoing_letter_state.dart';
import '/core/constant/colors.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class OutgoingLetterCubit extends Cubit<OutgoingLetterState> {
  final LettersRepo _lettersRepo;

  OutgoingLetterCubit(this._lettersRepo) : super(OutgoingLetterInitial());
  DateTime? newLetterDate;
  bool newLetterDateValidator = true;

  final GlobalKey<FormState> formKeyLetter = GlobalKey();
  final GlobalKey<FormState> letterNumberFormKey = GlobalKey();

  final TextEditingController searchText = TextEditingController();

  final TextEditingController letterNumber = TextEditingController();
  final TextEditingController letterSubject = TextEditingController();
  final TextEditingController letterReplyNumber = TextEditingController();

  LettersSearchType searchType = LettersSearchType.letterTopic;

  LetterType selectedLitterType = LetterType.newletter;

  List<LetterData> allLettersAfterSearch = [];

  void lettersSearch({
    required List<LetterData> letters,
  }) {
    allLettersAfterSearch.clear();
    allLettersAfterSearch = letters;
    String searchQuery = searchText.text.toLowerCase();
    if (searchType == LettersSearchType.letterTopic) {
      allLettersAfterSearch = letters.where((letter) {
        return letter.subject?.toLowerCase().contains(searchQuery) ?? false;
      }).toList();
    } else if (searchType == LettersSearchType.letterNumber) {
      allLettersAfterSearch = letters.where((letter) {
        return letter.number?.toLowerCase().contains(searchQuery) ?? false;
      }).toList();
    }
    emit(OutgoingLetterInitial());
  }

  void changeSelectedLitterType(LetterType value) {
    selectedLitterType = value;
    emit(OutgoingLetterInitial());
  }

  final DateTime dateNow = MyDateUtil.currentDateTimeFromDevice();
  final DateTime firstDate = MyDateUtil.currentDateTimeFromDevice()
      .subtract(const Duration(days: 365 * 20));
  final DateTime lastDate = MyDateUtil.currentDateTimeFromDevice()
      .add(const Duration(days: 365 * 20));

  Future<void> customShowDatePicker({
    required BuildContext context,
  }) async {
    newLetterDate = await showDatePicker(
      context: context,
      initialDate: dateNow,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.kPrimaryColor,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    emit(OutgoingLetterInitial());
  }

  void validatorNewLetterDateField() {
    if (newLetterDate == null) {
      newLetterDateValidator = false;
      emit(OutgoingLetterInitial());
    } else {
      newLetterDateValidator = true;
      emit(OutgoingLetterInitial());
    }
  }

  //=====================================

  bool addLetterFileValidator = true;
  String? addLetterFile;

  void validatorTakeLetterFileField() {
    if (addLetterFile == null) {
      addLetterFileValidator = false;
      emit(OutgoingLetterInitial());
    } else {
      addLetterFileValidator = true;
      emit(OutgoingLetterInitial());
    }
  }

  Future<void> pickLetterFile() async {
    Either<Failures, String> result = await _lettersRepo.pickLetterFile();
    result.fold(
      (failure) => emit(OutgoingLetterFailure(failure.errMessage)),
      (result) {
        addLetterFile = result;
        emit(OutgoingLetterInitial());
      },
    );
  }

  //=====================================
  Future<void> addNewLetter({
    required AddLetter newLetterDate,
    required List<LetterData> incomingLetters,
    required List<LetterData> outgoingLetters,
  }) async {
    emit(OutgoingLetterLoading());
    Either<Failures, LetterData> result = await _lettersRepo.addNewLetter(
      newLetterDate: newLetterDate,
    );
    result.fold(
      (failure) => emit(OutgoingLetterFailure(failure.errMessage)),
      (result) {
        if (result.replyTo!.isEmpty) {
          outgoingLetters.add(result);
        } else {
          for (var element in incomingLetters) {
            if (result.replyTo == element.number) {
              element.replyStatus = ReplyStatus.answered.name;
            }
          }
          outgoingLetters.add(result);
        }
        emit(OutgoingLetterSuccess());
      },
    );
  }
}
