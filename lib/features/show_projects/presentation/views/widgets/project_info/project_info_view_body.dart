import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'project_edite_duration_per_day_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/constant/api_end_point.dart';
import 'package:flutter/material.dart';
import '/core/utils/my_date_util.dart';
import '/core/constant/colors.dart';

class ProjectInfoViewBody extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectInfoViewBody({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    ProjectInfoCubit cubit = BlocProvider.of<ProjectInfoCubit>(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(
                  maxWidth: 700,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text("اسم المشروع"),
                      subtitle: Text(
                        projectDetails.projectName ?? '--',
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("رقم المشروع"),
                      subtitle: Text(
                        projectDetails.projectNumber ?? '--',
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("مبلغ المشروع"),
                      subtitle: Text(
                        projectDetails.projectPrice ?? '--',
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("مدة المشروع باليوم"),
                      subtitle: Text(
                        projectDetails.projectDurationPerDay?.toString() ??
                            '--',
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => BlocProvider.value(
                              value: cubit,
                              child: ProjectEditeDurationPerDayDialog(
                                projectDetails: projectDetails,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("تاريخ استلام المشروع"),
                      subtitle: Text(
                        MyDateUtil.convertDateTime(
                          historyAsText: projectDetails.projectReceiptDate!,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("تاريخ انتهاء المشروع"),
                      subtitle: Text(
                        cubit.calculateProjectEndDate(
                          projectDetails: projectDetails,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("مدير المشروع"),
                      subtitle: Text(
                        projectDetails.projectManager ?? '--',
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("الجهة المالكة"),
                      subtitle: Text(
                        projectDetails.projectOwner ?? '--',
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("المنطقة"),
                      subtitle: Text(
                        projectDetails.projectArea ?? '--',
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("المدينة"),
                      subtitle: Text(
                        projectDetails.projectCity ?? '--',
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("تاريخ ال - po"),
                      subtitle: Text(
                        MyDateUtil.convertDateTime(
                          historyAsText: projectDetails.projectDatePo!,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("ملف ال - po"),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.visibility_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                        onPressed: () async {
                          await cubit.openFile(
                            "${APIEndPoint.mediaBaseUrl}${projectDetails.projectFilePo}",
                          );
                        },
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
