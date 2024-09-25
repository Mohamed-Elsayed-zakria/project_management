import 'package:flutter_bloc/flutter_bloc.dart';
import 'letters_state.dart';

class LettersCubit extends Cubit<LettersState> {
  LettersCubit() : super(LettersInitial());

  bool incomingLettersIsActive = false;
  bool outgoingLettersIsActive = false;

  void changeIncomingLettersIsActive() {
    incomingLettersIsActive = true;
    outgoingLettersIsActive = false;
    emit(LettersInitial());
  }

  void changeOutgoingLettersIsActive() {
    outgoingLettersIsActive = true;
    incomingLettersIsActive = false;
    emit(LettersInitial());
  }
}
