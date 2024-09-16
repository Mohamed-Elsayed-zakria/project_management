import '/features/show_projects/data/models/enum/project_search_type.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class ShowProjectSearch extends StatefulWidget {
  const ShowProjectSearch({super.key});

  @override
  State<ShowProjectSearch> createState() => _ShowProjectSearchState();
}

class _ShowProjectSearchState extends State<ShowProjectSearch> {
  ProjectSearchType searchType = ProjectSearchType.projectName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 160,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black54,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<ProjectSearchType>(
                value: searchType,
                isExpanded: true,
                onChanged: (ProjectSearchType? newValue) {
                  setState(() {
                    searchType = newValue!;
                  });
                },
                items: ProjectSearchType.values
                    .map<DropdownMenuItem<ProjectSearchType>>(
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
            ),
          ),
          const SizedBox(width: 10),
          const SizedBox(
            width: 250,
            child: CustomFormField(
              label: "بحث",
              hintText: "ادخل قيمة البحث",
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 100,
            child: CustomButton(
              text: "بحث",
              onPressed: () {
                if (searchType == ProjectSearchType.projectName) {
                } else if (searchType == ProjectSearchType.projectNumber) {}
              },
            ),
          ),
        ],
      ),
    );
  }
}
