import 'new_project_button_create.dart';
import 'package:flutter/material.dart';
import 'new_project_take_data.dart';
import '/core/constant/style.dart';

class NewProjectViewBody extends StatelessWidget {
  const NewProjectViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    'مشروع جديد',
                    style: AppStyle.kTextStyle26,
                  ),
                ),
                NewProjectTakeData(),
                NewProjectButtonCreate(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
