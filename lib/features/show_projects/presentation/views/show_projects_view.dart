import '/features/show_projects/presentation/views/widgets/show_projects_project_item.dart';
import 'widgets/show_project_search.dart';
import 'package:flutter/material.dart';

class ShowProjectsView extends StatelessWidget {
  const ShowProjectsView({super.key});

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
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ShowProjectsProjectItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
