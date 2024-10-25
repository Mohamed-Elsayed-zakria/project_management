abstract class OtherAdditionsState {}

final class OtherAdditionsInitial extends OtherAdditionsState {}

final class OtherAdditionsLoading extends OtherAdditionsState {}

final class OtherAdditionsSuccess extends OtherAdditionsState {}

final class OtherAdditionsFailure extends OtherAdditionsState {
  String errMessage;
  OtherAdditionsFailure(this.errMessage);
}

final class AddOtherAdditionsLoading extends OtherAdditionsState {}

final class AddOtherAdditionsSuccess extends OtherAdditionsState {}

final class AddOtherAdditionsFailure extends OtherAdditionsState {
  String errMessage;
  AddOtherAdditionsFailure(this.errMessage);
}


final class PickFileSuccess extends OtherAdditionsState {}
final class PickFileFailure extends OtherAdditionsState {
  String errMessage;
  PickFileFailure(this.errMessage);
}
