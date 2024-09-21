import '/features/show_projects/presentation/manager/fetch_projects_cubit/fetch_projects_cubit.dart';
import '/features/show_projects/data/repository/fetch_projects_implement.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

class SetupLocator {
  static GetIt locator = GetIt.instance;
  void setup() {
    locator.registerLazySingleton(() => Dio());
    locator.registerLazySingleton(
      () => FetchProjectsCubit(
        FetchProjectsImplement(),
      ),
    );
  }
}
