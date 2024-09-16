import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int indexScreen = 0;

  void changeIndexScreen(int index) {
    if (index == 5) {
    } else {
      indexScreen = index;
    }
    emit(HomeChangeIndexScreen());
  }
}
