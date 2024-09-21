import '/features/show_projects/presentation/manager/fetch_projects_cubit/fetch_projects_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'show_project_search_drop_down.dart';
import 'package:flutter/material.dart';

class ShowProjectSearch extends StatefulWidget {
  const ShowProjectSearch({super.key});

  @override
  State<ShowProjectSearch> createState() => _ShowProjectSearchState();
}

class _ShowProjectSearchState extends State<ShowProjectSearch> {
  late FetchProjectsCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<FetchProjectsCubit>(context);
    cubit.searchText.addListener(() {
      cubit.projectsSearch();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      constraints: const BoxConstraints(
        maxWidth: 600,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 150,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black54,
              ),
            ),
            child: const ShowProjectSearchDropDown(),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CustomFormField(
              controller: cubit.searchText,
              label: "بحث",
              hintText: "ادخل قيمة البحث",
              prefixIcon: const Icon(Icons.search_outlined),
              suffixIcon: Visibility(
                visible: cubit.searchText.text.isNotEmpty,
                child: IconButton(
                  onPressed: () => cubit.searchText.clear(),
                  icon: const Icon(
                    Icons.clear_outlined,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
