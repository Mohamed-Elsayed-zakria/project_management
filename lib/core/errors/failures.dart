abstract class Failures {
  final String errMessage;
  Failures({required this.errMessage});
}

class LocalFailures extends Failures {
  LocalFailures({required super.errMessage});
  factory LocalFailures.errorMessage({String? error}) {
    switch (error) {
      case null:
        return LocalFailures(errMessage: 'Something went wrong');
      default:
        return LocalFailures(errMessage: error);
    }
  }
}
