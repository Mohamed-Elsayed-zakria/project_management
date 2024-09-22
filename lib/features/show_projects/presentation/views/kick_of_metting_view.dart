import '/features/show_projects/data/models/project_details/project_details.dart';
import 'widgets/kick_of_metting/kick_of_metting_header.dart';
import 'widgets/project_details_form_shape_list_tile.dart';
import 'package:flutter/material.dart';

class KickOfMettingView extends StatelessWidget {
  final ProjectDetails projectDetails;

  const KickOfMettingView({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const KickOfMettingHeader(),
                const SizedBox(height: 10),
                ProjectDetailsFormShapeListTile(
                  title: "PMF-007-INT-033",
                  subtitle: "Kick of Meeting Agenda",
                  guidanceLetterOnTap: () {},
                  outgoingIncomingLettersOnTap: () {},
                ),
                const Divider(),
                ProjectDetailsFormShapeListTile(
                  title: "PMF-007-INT-034",
                  subtitle: "Kick-off Meeting Minutes",
                  guidanceLetterOnTap: () {},
                  outgoingIncomingLettersOnTap: () {},
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
