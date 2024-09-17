import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/utils/my_date_util.dart';
import 'package:flutter/material.dart';
import 'outgoing_letter_state.dart';
import '/core/constant/colors.dart';

class OutgoingLetterCubit extends Cubit<OutgoingLetterState> {
  OutgoingLetterCubit() : super(OutgoingLetterInitial());
  DateTime? newLetterDate;
  bool newLetterDateValidator = true;

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
}
