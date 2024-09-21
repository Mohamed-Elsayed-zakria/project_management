import '/features/show_projects/presentation/manager/fetch_projects_cubit/fetch_projects_cubit.dart';
import '/features/show_projects/data/models/enum/project_search_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ShowProjectSearchDropDown extends StatefulWidget {
  const ShowProjectSearchDropDown({super.key});

  @override
  State<ShowProjectSearchDropDown> createState() =>
      _ShowProjectSearchDropDownState();
}

class _ShowProjectSearchDropDownState extends State<ShowProjectSearchDropDown> {
  late FetchProjectsCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<FetchProjectsCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<ProjectSearchType>(
        value: cubit.searchType,
        isExpanded: true,
        onChanged: (ProjectSearchType? newValue) {
          setState(() {
            cubit.searchType = newValue!;
          });
        },
        items:
            ProjectSearchType.values.map<DropdownMenuItem<ProjectSearchType>>(
          (ProjectSearchType value) {
            return DropdownMenuItem<ProjectSearchType>(
              value: value,
              child: Center(
                child: Text(
                  value == ProjectSearchType.projectName
                      ? 'اسم المشروع'
                      : 'رقم المشروع',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            );
          },
        ).toList(),
        dropdownColor: Colors.white,
        focusColor: Colors.white,
      ),
    );
  }
}
