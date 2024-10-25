import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_state.dart';
import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_cubit.dart';
import '/features/letters/presentation/manager/letters_cubit/letters_cubit.dart';
import '/features/letters/data/models/enum/letters_search_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class IncomingLettersSearch extends StatefulWidget {
  const IncomingLettersSearch({super.key});

  @override
  State<IncomingLettersSearch> createState() => _IncomingLettersSearchState();
}

class _IncomingLettersSearchState extends State<IncomingLettersSearch> {
  late IncomingLetterCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<IncomingLetterCubit>(context);
    LettersCubit letterCubit = BlocProvider.of<LettersCubit>(context);
    cubit.searchText.addListener(() {
      cubit.lettersSearch(letters: letterCubit.incomingLetters);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      constraints: const BoxConstraints(
        maxWidth: 630,
      ),
      margin: const EdgeInsets.symmetric(vertical: 4),
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
            child: DropdownButtonHideUnderline(
              child: DropdownButton<LettersSearchType>(
                value: cubit.searchType,
                isExpanded: true,
                onChanged: (LettersSearchType? newValue) {
                  setState(() {
                    cubit.searchType = newValue!;
                  });
                },
                items: LettersSearchType.values
                    .map<DropdownMenuItem<LettersSearchType>>(
                  (LettersSearchType value) {
                    return DropdownMenuItem<LettersSearchType>(
                      value: value,
                      child: Center(
                        child: Text(
                          value == LettersSearchType.letterTopic
                              ? "موضوع الخطاب"
                              : 'رقم الخطاب',
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
          BlocBuilder<IncomingLetterCubit, IncomingLetterState>(
            buildWhen: (previous, current) => current is SearchTextChanged,
            builder: (context, state) {
              return Expanded(
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
              );
            },
          ),
        ],
      ),
    );
  }
}
