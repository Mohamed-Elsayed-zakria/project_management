import 'package:flutter/material.dart';
import 'package:project_management/core/constant/colors.dart';
import 'package:project_management/core/constant/style.dart';
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
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text("اسم المشروع"),
                        subtitle: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Text("رقم المشروع"),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProjectDetailsView(),
                            ),
                          );
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "خطابات المشروع",
                          style: AppStyle.tabTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
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
