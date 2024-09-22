abstract class AddBoqItemState {}

final class AddBoqItemInitial extends AddBoqItemState {}

final class AddBoqItemLoading extends AddBoqItemState {}

final class AddBoqItemSuccess extends AddBoqItemState {}

final class AddBoqItemFailure extends AddBoqItemState {
  final String errMessage;
  AddBoqItemFailure({required this.errMessage});
}
