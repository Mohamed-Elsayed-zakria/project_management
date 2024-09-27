abstract class BoqItemState {}

final class BoqItemInitial extends BoqItemState {}

final class AddBoqItemLoading extends BoqItemState {}

final class AddBoqItemSuccess extends BoqItemState {}

final class AddBoqItemFailure extends BoqItemState {
  final String errMessage;
  AddBoqItemFailure({required this.errMessage});
}

final class UpdateBoqItemLoading extends BoqItemState {}

final class UpdateBoqItemSuccess extends BoqItemState {}

final class UpdateBoqItemFailure extends BoqItemState {
  final String errMessage;
  UpdateBoqItemFailure({required this.errMessage});
}
