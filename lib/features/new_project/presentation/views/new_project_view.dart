import 'package:project_management/core/constant/style.dart';

import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class NewProjectView extends StatelessWidget {
  const NewProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Text(
                'New Project',
                style: AppStyle.kTextStyle30,
              ),
              const SizedBox(height: 20),
              const CustomFormField(
                label: 'Project Name',
                hintText: 'Enter Project Name',
              ),
              const CustomFormField(
                label: 'Project Number',
                hintText: 'Enter Project Number',
              ),
              CustomButton(
                text: 'Submit',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
