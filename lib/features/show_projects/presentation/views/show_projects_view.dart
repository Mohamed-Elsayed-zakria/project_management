import '/features/show_projects/presentation/manager/fetch_projects_cubit/fetch_projects_state.dart';
import '/features/show_projects/presentation/manager/fetch_projects_cubit/fetch_projects_cubit.dart';
import '/features/show_projects/presentation/views/widgets/show_projects_project_item.dart';
import '/features/show_projects/data/repository/fetch_projects_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/empty_placeholder.dart';
import '/core/widgets/loading_widget.dart';
import 'widgets/show_project_search.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class ShowProjectsView extends StatelessWidget {
  const ShowProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchProjectsCubit(
        FetchProjectsImplement(),
      ),
      child: Card(
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
                  FetchProjectsCubit cubit =
                      BlocProvider.of<FetchProjectsCubit>(context);
                  if (state is FetchProjectsSuccess) {
                    return Expanded(
                      child: cubit.searchText.text.isEmpty
                          ? cubit.allProjects.isNotEmpty
                              ? ListView.builder(
                                  itemCount: cubit.allProjects.length,
                                  itemBuilder: (context, index) {
                                    return ShowProjectsProjectItem(
                                      projectDetails: cubit.allProjects[index],
                                    );
                                  },
                                )
                              : const EmptyPlaceholder(
                                  message: 'لا يوجد مشاريع',
                                )
                          : cubit.allAfterSearchProjects.isNotEmpty
                              ? ListView.builder(
                                  itemCount:
                                      cubit.allAfterSearchProjects.length,
                                  itemBuilder: (context, index) {
                                    return ShowProjectsProjectItem(
                                      projectDetails:
                                          cubit.allAfterSearchProjects[index],
                                    );
                                  },
                                )
                              : const EmptyPlaceholder(
                                  message: 'لا يوجد مشاريع',
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
      ),
    );
  }
}
