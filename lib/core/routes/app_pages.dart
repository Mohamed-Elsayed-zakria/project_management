import '/features/letters/presentation/views/incoming_outgoing_letters_view.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/other_additions/presentation/views/other_additions_view.dart';
import '/features/show_projects/presentation/views/project_details_view.dart';
import '/features/show_projects/presentation/views/project_info_view.dart';
import '/features/show_projects/data/models/project_info_route.dart';
import '/features/forms/presentation/views/forms_view.dart';
import '/features/auth/presentation/views/login_view.dart';
import '/features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '/core/models/files_nav_data.dart';
import '/core/routes/app_routes.dart';
import 'package:flutter/widgets.dart';
import '/initial_view.dart';

class AppPages {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.initialScreen,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.initialScreen,
        builder: (context, state) => const InitialView(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.projectInfo,
        builder: (context, state) {
          final projectInfoRoute = state.extra as ProjectInfoRoute;
          return BlocProvider.value(
            value: projectInfoRoute.fetchProjectsCubit,
            child: ProjectInfoView(
              projectDetails: projectInfoRoute.projectDetails,
              allProjects: projectInfoRoute.allProjects,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.projectDetails,
        builder: (context, state) {
          final type = state.extra as ProjectDetails;
          return ProjectDetailsView(
            projectDetails: type,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.incomingOutgoingLetters,
        builder: (context, state) {
          final details = state.extra as FilesNavData;
          final projectDetails = details.projectDetails;
          final stepType = details.stepType;
          return IncomingOutgoingLettersView(
            projectDetails: projectDetails,
            stepType: stepType,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.forms,
        builder: (context, state) {
          final details = state.extra as FilesNavData;
          final projectDetails = details.projectDetails;
          final stepType = details.stepType;
          return FormsView(
            projectDetails: projectDetails,
            stepType: stepType,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.otherAdditions,
        builder: (context, state) {
          final details = state.extra as FilesNavData;
          final projectDetails = details.projectDetails;
          final stepType = details.stepType;
          return OtherAdditionsView(
            projectDetails: projectDetails,
            stepType: stepType,
          );
        },
      ),
    ],
  );
  static void to({
    required String path,
    required BuildContext context,
    Object? data,
  }) {
    GoRouter.of(context).push(path, extra: data);
  }

  static void off({
    required String path,
    required BuildContext context,
    Object? data,
  }) {
    GoRouter.of(context).go(path, extra: data);
  }

  static void offAll({
    required String path,
    required BuildContext context,
    Object? data,
  }) {
    GoRouter.of(context).go(
      path,
      extra: {'reset': true, 'data': data},
    );
  }

  static void back(BuildContext context) {
    GoRouter.of(context).pop();
  }
}
