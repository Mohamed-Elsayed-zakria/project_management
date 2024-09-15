import 'package:flutter/material.dart';
import 'project_details_view.dart';

class ShowProjectsView extends StatelessWidget {
  const ShowProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text("Project ${index + 1}"),
                  trailing: const Text("#77fhf رقم المشروع"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProjectDetailsView(),
                      ),
                    );
                  },
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
