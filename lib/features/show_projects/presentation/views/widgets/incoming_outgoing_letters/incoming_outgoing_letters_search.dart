import '/features/show_projects/data/models/enum/letters_search_type.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class IncomingOutgoingLettersSearch extends StatefulWidget {
  const IncomingOutgoingLettersSearch({super.key});

  @override
  State<IncomingOutgoingLettersSearch> createState() =>
      _IncomingOutgoingLettersSearchState();
}

class _IncomingOutgoingLettersSearchState
    extends State<IncomingOutgoingLettersSearch> {
  LettersSearchType searchType = LettersSearchType.letterTopic;

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
                value: searchType,
                isExpanded: true,
                onChanged: (LettersSearchType? newValue) {
                  setState(() {
                    searchType = newValue!;
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
          const Expanded(
            child: CustomFormField(
              label: "بحث",
              hintText: "ادخل قيمة البحث",
              prefixIcon: Icon(Icons.search_outlined),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 120,
            child: CustomButton(
              text: "بحث",
              onPressed: () {
                if (searchType == LettersSearchType.letterTopic) {
                } else if (searchType == LettersSearchType.letterNumber) {}
              },
            ),
          ),
        ],
      ),
    );
  }
}
