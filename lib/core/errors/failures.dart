abstract class Failures {
  final String errMessage;
  Failures({required this.errMessage});
}

class LocalFailures extends Failures {
  LocalFailures({required super.errMessage});
  factory LocalFailures.errorMessage({String? error}) {
    switch (error) {
      case null:
        return LocalFailures(errMessage: "حدث خطأ ما حاول مرة اخرى");
      default:
        return LocalFailures(errMessage: error);
    }
  }
}
