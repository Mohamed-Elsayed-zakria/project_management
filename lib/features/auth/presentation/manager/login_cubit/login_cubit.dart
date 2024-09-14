import '/features/auth/data/repository/login_repo.dart';
import '/features/auth/data/model/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());

  final TextEditingController getUserName = TextEditingController();
  final TextEditingController getPassword = TextEditingController();
  final GlobalKey<FormState> formKeyLogin = GlobalKey();

  bool passwordVisibility = true;

  void showPasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    emit(LoginInitial());
  }

  Future<void> login({
    required LoginModel loginModel,
  }) async {
    emit(LoginLoading());
    Either<Failures, void> result = await _loginRepo.login(
      loginModel: loginModel,
    );
    result.fold(
      (failures) => emit(LoginFailure(failures.errMessage)),
      (result) => emit(LoginSuccess()),
    );
  }
}
