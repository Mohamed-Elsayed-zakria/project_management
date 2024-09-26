abstract class OtherAdditionsState {}

final class OtherAdditionsInitial extends OtherAdditionsState {}

final class OtherAdditionsLoading extends OtherAdditionsState {}

final class OtherAdditionsSuccess extends OtherAdditionsState {}

final class OtherAdditionsFailure extends OtherAdditionsState {
  String errMessage;
  OtherAdditionsFailure(this.errMessage);
}
