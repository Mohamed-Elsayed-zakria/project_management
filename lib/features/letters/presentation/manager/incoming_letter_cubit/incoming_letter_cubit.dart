import '/features/letters/data/models/enum/letters_search_type.dart';
import '/features/letters/data/models/letter_data/letter_data.dart';
import '/features/letters/data/models/enum/reply_status.dart';
import '/features/letters/data/models/enum/letter_type.dart';
import '/features/letters/data/repository/letters_repo.dart';
import '/features/letters/data/models/add_letter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/utils/my_date_util.dart';
import 'package:flutter/material.dart';
import '/core/utils/pick_file.dart';
import '/core/constant/colors.dart';
import 'incoming_letter_state.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class IncomingLetterCubit extends Cubit<IncomingLetterState> {
  final LettersRepo _lettersRepo;
  IncomingLetterCubit(this._lettersRepo) : super(IncomingLetterInitial());

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
    emit(SearchTextChanged());
  }

  void changeSelectedLitterType(LetterType value) {
    selectedLitterType = value;
    emit(IncomingLetterInitial());
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
    emit(IncomingLetterInitial());
  }

  void validatorNewLetterDateField() {
    if (newLetterDate == null) {
      newLetterDateValidator = false;
      emit(IncomingLetterInitial());
    } else {
      newLetterDateValidator = true;
      emit(IncomingLetterInitial());
    }
  }

  //=====================================

  bool addLetterFileValidator = true;
  String? addLetterFile;

  void validatorTakeLetterFileField() {
    if (addLetterFile == null) {
      addLetterFileValidator = false;
      emit(IncomingLetterInitial());
    } else {
      addLetterFileValidator = true;
      emit(IncomingLetterInitial());
    }
  }

  Future<void> pickLetterFile() async {
    Either<Failures, String> result = await PickFile.pick();
    result.fold(
      (failure) => emit(IncomingLetterFailure(failure.errMessage)),
      (result) {
        addLetterFile = result;
        emit(IncomingLetterInitial());
      },
    );
  }

  //=====================================
  Future<void> addNewLetter({
    required AddLetter newLetterData,
    required List<LetterData> incomingLetters,
    required List<LetterData> outgoingLetters,
  }) async {
    emit(IncomingLetterLoading());
    Either<Failures, LetterData> result = await _lettersRepo.addNewLetter(
      newLetterData: newLetterData,
    );
    result.fold(
      (failure) => emit(IncomingLetterFailure(failure.errMessage)),
      (result) {
        if (result.replyTo!.isEmpty) {
          incomingLetters.add(result);
        } else {
          for (var element in outgoingLetters) {
            if (result.replyTo == element.number) {
              element.replyStatus = ReplyStatus.answered.name;
            }
          }
          incomingLetters.add(result);
        }
        emit(IncomingLetterSuccess());
      },
    );
  }
}
