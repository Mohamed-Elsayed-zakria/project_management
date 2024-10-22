import '/features/show_projects/presentation/manager/fetch_projects_cubit/fetch_projects_cubit.dart';
import '/features/show_projects/presentation/manager/fetch_projects_cubit/fetch_projects_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/empty_placeholder.dart';
import '/core/widgets/loading_widget.dart';
import 'show_projects_project_item.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';
import 'show_project_search.dart';

class ShowProjectsViewBody extends StatelessWidget {
  const ShowProjectsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const ShowProjectSearch(),
            const Divider(),
            BlocBuilder<FetchProjectsCubit, FetchProjectsState>(
              builder: (context, state) {
                var cubit = context.read<FetchProjectsCubit>();
                if (state is FetchProjectsSuccess) {
                  return Expanded(
                    child: Builder(
                      builder: (context) {
                        final isSearchEmpty = cubit.searchText.text.isEmpty;
                        final projects = isSearchEmpty
                            ? cubit.allProjects
                            : cubit.allAfterSearchProjects;

                        if (projects.isEmpty) {
                          return const EmptyPlaceholder(
                            message: 'لا يوجد مشاريع',
                          );
                        }

                        return ListView.builder(
                          itemCount: projects.length,
                          itemBuilder: (context, index) {
                            return ShowProjectsProjectItem(
                              projectDetails: projects[index],
                              allProjects: cubit.allProjects,
                            );
                          },
                        );
                      },
                    ),
                  );
                } else if (state is FetchProjectsFailure) {
                  return Text(
                    state.errMessage,
                    style: AppStyle.tabTextStyle,
                  );
                } else {
                  return const Expanded(
                    child: Center(
                      child: LoadingWidget(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
