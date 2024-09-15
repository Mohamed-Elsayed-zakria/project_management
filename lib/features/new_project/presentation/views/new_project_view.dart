import '/features/new_project/presentation/manager/new_project_cubit/new_project_cubit.dart';
import '/features/new_project/data/repository/new_project_implement.dart';
import 'widgets/new_project_button_create.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/new_project_take_data.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class NewProjectView extends StatelessWidget {
  const NewProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewProjectCubit(NewProjectImplement()),
      child: const Card(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
