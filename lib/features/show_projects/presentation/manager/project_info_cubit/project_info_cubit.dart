import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '/core/utils/my_date_util.dart';
import 'package:flutter/widgets.dart';
import 'project_info_state.dart';

class ProjectInfoCubit extends Cubit<ProjectInfoState> {
  ProjectInfoCubit() : super(ProjectInfoInitial());

  final TextEditingController editeDurationPerDay = TextEditingController();
  final GlobalKey<FormState> formKeyProjectInfo = GlobalKey();

  String calculateProjectEndDate({
    required ProjectDetails projectDetails,
  }) {
    return MyDateUtil.convertDateTime(
      historyAsText: MyDateUtil.covertStringToDate(
        date: projectDetails.projectReceiptDate!,
      ).add(Duration(days: projectDetails.projectDurationPerDay!)).toString(),
    );
  }

  changeDurationPerDay({
    required int newDuration,
    required ProjectDetails projectDetails,
  }) {}

  Future<void> openFile(String url) async {
    // Open file in external application (browser or appropriate viewer)
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
