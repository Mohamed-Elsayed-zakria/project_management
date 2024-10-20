import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_cubit.dart';
import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_state.dart';
import '/features/letters/presentation/manager/letters_cubit/letters_cubit.dart';
import '/features/letters/data/models/enum/letter_type_sender.dart';
import '/features/letters/data/models/letter_data/letter_data.dart';
import '/features/letters/data/models/enum/reply_status.dart';
import '/features/letters/data/models/enum/letter_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/show_up_animation.dart';
import '/core/widgets/empty_placeholder.dart';
import '/core/constant/api_end_point.dart';
import '/core/utils/url_open_file.dart';
import '/core/utils/my_date_util.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class IncomingLettersTable extends StatelessWidget {
  const IncomingLettersTable({super.key});

  @override
  Widget build(BuildContext context) {
    LettersCubit lettersCubit = BlocProvider.of<LettersCubit>(context);
    IncomingLetterCubit incomingLetterCubit =
        BlocProvider.of<IncomingLetterCubit>(context);
    return ShowUp(
      delay: 1,
      child: BlocBuilder<IncomingLetterCubit, IncomingLetterState>(
        builder: (context, state) {
          return Visibility(
            visible: incomingLetterCubit.searchText.text.isNotEmpty
                ? incomingLetterCubit.allLettersAfterSearch.isNotEmpty
                : lettersCubit.incomingLetters.isNotEmpty,
            replacement:
                const EmptyPlaceholder(message: 'لا يوجد خطابات واردة'),
            child: Table(
              border: TableBorder.all(
                color: AppColors.kPrimaryColor,
              ),
              columnWidths: const {
                 0: FlexColumnWidth(0.5),
                1: FlexColumnWidth(1),
                2: FixedColumnWidth(140),
                3: FixedColumnWidth(140),
                4: FixedColumnWidth(140),
                5: FixedColumnWidth(85),
                6: FixedColumnWidth(110),
              },
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          'الرقم',
                          textAlign: TextAlign.center,
                          style: AppStyle.tabTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          'الموضوع',
                          textAlign: TextAlign.center,
                          style: AppStyle.tabTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          'التاريخ',
                          textAlign: TextAlign.center,
                          style: AppStyle.tabTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          'النوع',
                          textAlign: TextAlign.center,
                          style: AppStyle.tabTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          'حالة الرد',
                          textAlign: TextAlign.center,
                          style: AppStyle.tabTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          "النموذج",
                          textAlign: TextAlign.center,
                          style: AppStyle.tabTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          'فعل',
                          textAlign: TextAlign.center,
                          style: AppStyle.tabTextStyle.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ...buildTableIncomingLettersNewElements(
                  lettersCubit: lettersCubit,
                  incomingLetterCubit: incomingLetterCubit,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<TableRow> buildTableIncomingLettersNewElements({
    required LettersCubit lettersCubit,
    required IncomingLetterCubit incomingLetterCubit,
  }) {
    List<TableRow> letters = [];
    List<LetterData> incomingLetters = [];
    if (incomingLetterCubit.searchText.text.isEmpty) {
      incomingLetters = lettersCubit.incomingLetters;
    } else {
      incomingLetters = incomingLetterCubit.allLettersAfterSearch;
    }
    for (var element in incomingLetters) {
      if (element.letterType == LetterTypeSender.incoming.name) {
        letters.add(
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    element.number ?? '--',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    element.subject ?? '--',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    MyDateUtil.convertDateTime(historyAsText: element.date!),
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    LetterType.newletter.name == element.type
                        ? 'جديد'
                        : LetterType.replyToLetter.name == element.type
                            ? 'رد علي خطاب'
                            : 'رد مع الاغلاق',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    ReplyStatus.answered.name == element.replyStatus
                        ? 'تم الرد'
                        : 'لم يتم الرد',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: InkWell(
                    onTap: () => UrlOpenFile.openFile(
                      "${APIEndPoint.mediaBaseUrl}${element.letterFile!}",
                    ),
                    child: const Icon(
                      Icons.visibility_outlined,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.edit_outlined,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.delete_outlined,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }
    return letters;
  }
}
